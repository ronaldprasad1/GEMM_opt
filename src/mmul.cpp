#include <stdint.h>
#include <hls_stream.h>

#define N 100

// TRIPCOUNT identifier
const int c_size = (N * N);

static void read_input(unsigned int* in, hls::stream<unsigned int>& inStream, int size) {
// Auto-pipeline is going to apply pipeline to this loop
mem_rd:
    for (int i = 0; i < size; i++) {
    #pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        inStream << in[i];
    }
}

static void compute_mm(hls::stream<unsigned int>& inStream1,
                       hls::stream<unsigned int>& inStream2,
                       hls::stream<unsigned int>& outStream) {

    unsigned int matrixA[N][N];
    unsigned int matrixB[N][N];
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            matrixA[i][j] = inStream1.read();
            matrixB[i][j] = inStream2.read();
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            unsigned int sum = 0;
            for (int k = 0; k < N; k++) {
                sum += matrixA[i][k] * matrixB[k][j];
            }

            outStream.write(sum);
        }
    }
}

static void write_result(unsigned int* out, hls::stream<unsigned int>& outStream, int size) {
// Auto-pipeline is going to apply pipeline to this loop
mem_wr:
    for (int i = 0; i < size; i++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        out[i] = outStream.read();
    }
}


extern "C" {
    void mmul(unsigned int* in1, unsigned int* in2, unsigned int* out, int size) {
        static hls::stream<unsigned int> inStream1("input_stream_1");
        static hls::stream<unsigned int> inStream2("input_stream_2");
        static hls::stream<unsigned int> outStream("output_stream");
#pragma HLS INTERFACE m_axi port = in1 bundle = gmem0
#pragma HLS INTERFACE m_axi port = in2 bundle = gmem1
#pragma HLS INTERFACE m_axi port = out bundle = gmem2

#pragma HLS dataflow
        // dataflow pragma instruct compiler to run following three APIs in parallel
        read_input(in1, inStream1, size);
        read_input(in2, inStream2, size);
        compute_mm(inStream1, inStream2, outStream);
        write_result(out, outStream, size);
    }
}