#include "cmdlineparser.h"
#include <iostream>
#include <cstring>
#include <cstdlib>

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_profile.h"

#define N 2048
#define TILE_WIDTH 128
#define ROW_WIDTH 16
#define TOTAL_WORDS (TILE_WIDTH * TILE_WIDTH / ROW_WIDTH)
#define WORDS_PER_ROW (TILE_WIDTH / ROW_WIDTH)
#define TOTAL_TILES (N / TILE_WIDTH)
#define TOTAL_PACKED_WORDS (TOTAL_TILES * TOTAL_TILES * TOTAL_WORDS)

union packed512 {
    int64_t width[8]; // 8 x 64b = 512
    int row[16]; // 16 x 32b ints
};

int main(int argc, char** argv) {

    // Command Line Parser
    sda::utils::CmdLineParser parser;

    // Switches
    //**************//"<Full Arg>",  "<Short Arg>", "<Description>", "<Default>"
    parser.addSwitch("--xclbin_file", "-x", "input binary file string", "");
    parser.addSwitch("--device_id", "-d", "device index", "0");
    parser.parse(argc, argv);

    // Read settings
    std::string binaryFile = parser.value("xclbin_file");
    int device_index = stoi(parser.value("device_id"));

    if (argc < 3) {
        parser.printHelp();
        return EXIT_FAILURE;
    }

    std::cout << "Open the device: " << device_index << std::endl;
    auto device = xrt::device(device_index);
    std::cout << "Load the xclbin " << binaryFile << std::endl;
    auto uuid = device.load_xclbin(binaryFile);

    size_t packed_size_bytes = sizeof(packed512) * TOTAL_PACKED_WORDS;

    auto krnl = xrt::kernel(device, uuid, "mmul");

    std::cout << "Allocate Buffer in Global Memory\n";
    auto bo0 = xrt::bo(device, packed_size_bytes, krnl.group_id(0));
    auto bo1 = xrt::bo(device, packed_size_bytes, krnl.group_id(1));
    auto bo_out = xrt::bo(device, packed_size_bytes, krnl.group_id(2));

    // Map the contents of the buffer object into host memory
    auto bo0_map = bo0.map<int64_t*>();
    auto bo1_map = bo1.map<int64_t*>();
    auto bo_out_map = bo_out.map<int64_t*>();
    std::fill(bo0_map, bo0_map + TOTAL_PACKED_WORDS * 8, 0);
    std::fill(bo1_map, bo1_map + TOTAL_PACKED_WORDS * 8, 0);
    std::fill(bo_out_map, bo_out_map + TOTAL_PACKED_WORDS * 8, 0);

    // Create test data
    std::vector<int> flatA(N * N);
    std::vector<int> flatB(N * N);
    std::vector<int> bufReference(N * N);

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            flatA[i * N + j] = std::rand();
            flatB[i * N + j] = std::rand();
        }
    }

    std::vector<packed512> packedA(TOTAL_PACKED_WORDS);
    std::vector<packed512> packedB(TOTAL_PACKED_WORDS);

    for (int t_i = 0; t_i < TOTAL_TILES; ++t_i) {
        for (int t_j = 0; t_j < TOTAL_TILES; ++t_j) {
            int tile_base = (t_i * TOTAL_TILES + t_j) * TOTAL_WORDS;

            int packed_words = 0;

            for (int i = 0; i < TILE_WIDTH; ++i) {
                for (int w = 0; w < WORDS_PER_ROW; ++w) {

                    for (int k = 0; k < ROW_WIDTH; ++k) {
                        int global_row = t_i * TILE_WIDTH + i;
                        int global_col = t_j * TILE_WIDTH + w * ROW_WIDTH + k;

                        packedA[tile_base + packed_words].row[k] = flatA[global_row * N + global_col];
                        packedB[tile_base + packed_words].row[k] = flatB[global_row * N + global_col];
                    }
                    packed_words++;
                }
            }
        }
    }

    for (int i = 0; i < TOTAL_PACKED_WORDS; ++i) {
        for (int w = 0; w < 8; ++w) {
            bo0_map[i * 8 + w] = packedA[i].width[w];
            bo1_map[i * 8 + w] = packedB[i].width[w];
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int sum = 0;
            for (int k = 0; k < N; k++) {
                sum += flatA[i * N + k] * flatB[k * N + j];
            }

            bufReference[i * N + j] = sum;
        }
    }

    // Synchronize buffer content with device side
    std::cout << "Synchronize input buffer data to device global memory\n";

    bo0.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    bo1.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    std::cout << "Execution of the kernel\n";
    auto run = krnl(bo0, bo1, bo_out, N);
    run.wait();

    // Get the output;
    std::cout << "Get the output data from the device" << std::endl;
    bo_out.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    // Validate our results
    std::cout << "Validating output...\n";
    std::vector<int> kernel_result(N * N, 0);

    for (int t_i = 0; t_i < TOTAL_TILES; ++t_i) {
        for (int t_j = 0; t_j < TOTAL_TILES; ++t_j) {
            int tile_base = (t_i * TOTAL_TILES + t_j) * TOTAL_WORDS;

            int packed_words = 0;

            for (int i = 0; i < TILE_WIDTH; ++i) {
                for (int w = 0; w < WORDS_PER_ROW; ++w) {

                    packed512 tmp;
                    for (int w_idx = 0; w_idx < 8; ++w_idx) {
                        tmp.width[w_idx] = bo_out_map[(tile_base + packed_words) * 8 + w_idx];
                    }

                    for (int k = 0; k < ROW_WIDTH; ++k) {
                        int global_row = t_i * TILE_WIDTH + i;
                        int global_col = t_j * TILE_WIDTH + w * ROW_WIDTH + k;

                        kernel_result[global_row * N + global_col] = tmp.row[k];
                    }
                    packed_words++;
                }
            }
        }
    }
    
    bool match = true;
    for (int i = 0; i < N  * N; ++i) {
        if (kernel_result[i] != bufReference[i]) {
            std::cout << "Mismatch at index " << i 
                      << " (row " << i/N << ", col " << i%N << "): "
                      << "expected " << bufReference[i] 
                      << ", got " << kernel_result[i] << "\n";
            
            match = false;
            break;
        }
    }

    if (!match) {
        throw std::runtime_error("Value read back does not match reference");
    }

    std::cout << "TEST PASSED\n";

    return 0;
}