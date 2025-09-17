#include "cmdlineparser.h"
#include <iostream>
#include <cstring>
#include <cstdlib>

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_profile.h"

#define N 2560
#define TILE_WIDTH 128

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

    size_t vector_size_bytes = sizeof(int) * (N * N);

    auto krnl = xrt::kernel(device, uuid, "mmul");

    std::cout << "Allocate Buffer in Global Memory\n";
    auto bo0 = xrt::bo(device, vector_size_bytes, krnl.group_id(0));
    auto bo1 = xrt::bo(device, vector_size_bytes, krnl.group_id(1));
    auto bo_out = xrt::bo(device, vector_size_bytes, krnl.group_id(2));

    // Map the contents of the buffer object into host memory
    auto bo0_map = bo0.map<int64_t*>();
    auto bo1_map = bo1.map<int64_t*>();
    auto bo_out_map = bo_out.map<int64_t*>();
    std::fill(bo0_map, bo0_map + (N * N / 2), 0);
    std::fill(bo1_map, bo1_map + (N * N / 2), 0);
    std::fill(bo_out_map, bo_out_map + (N * N / 2), 0);

    // Create test data
    std::vector<int> flatA(N * N);
    std::vector<int> flatB(N * N);
    std::vector<int> bufReference(N * N);
    for (int i = 0; i < (N * N) / 16; i++) {
        packed512 tmp0, tmp1;
        for (int j = 0; j < 16; ++j) {
            tmp0.row[j] = std::rand();
            tmp1.row[j] = std::rand();
            flatA[i * 16 + j] = tmp0.row[j];
            flatB[i * 16 + j] = tmp1.row[j];
        }
        for (int w = 0; w < 8; ++w) {
            bo0_map[i * 8 + w] = tmp0.width[w];
            bo1_map[i * 8 + w] = tmp1.width[w];
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
    bool match = true;
    for (int  i = 0; i < N * N / 16; ++i) {
        packed512 tmp;

        for (int w = 0; w < 8; ++w) {
            tmp.width[w] = bo_out_map[i * 8 + w];
        }

        for (int j = 0; j < 16; ++j) {
            int index = i * 16 + j;
            if (tmp.row[j] != bufReference[index]) {
                std::cout << "Mismatch at index " << index
                        << ": expected " << bufReference[index]
                        << ", got " << tmp.row[j] << "\n";
                match = false;
                break; // or remove break to see all mismatches
            }
        }

        if (!match) break;
    }

    if (!match) {
        throw std::runtime_error("Value read back does not match reference");
    }

    std::cout << "TEST PASSED\n";

    return 0;
}