#include <stdint.h>
#include <hls_stream.h>

#define N 1000

// TRIPCOUNT identifier
const int c_size = (N * N);

static void read_input(int* in, hls::stream<int>& inStream, int size) {
// Auto-pipeline is going to apply pipeline to this loop
mem_rd:
    for (int i = 0; i < size; ++i) {
    #pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        inStream << in[i];
    }
}

static void transpose_matrix(int matrix[N][N], int (&t_mat)[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            #pragma HLS PIPELINE II=1
            t_mat[j][i] = matrix[i][j];
        }
    }
}

static void compute_mm(hls::stream<int>& inStream1,
                       hls::stream<int>& inStream2,
                       hls::stream<int>& outStream) {

    int matrixA[N][N];
    int matrixB[N][N];
    
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrixA[i][j] = inStream1.read();
            matrixB[i][j] = inStream2.read();
        }
    }

    int t_matrixB[N][N];
    transpose_matrix(matrixB, t_matrixB);

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            int sum = 0;
            for (int k = 0; k < N; ++k) {
                sum += matrixA[i][k] * t_matrixB[j][k];
            }

            outStream.write(sum);
        }
    }
}

static void write_result(int* out, hls::stream<int>& outStream, int size) {
// Auto-pipeline is going to apply pipeline to this loop
mem_wr:
    for (int i = 0; i < size; ++i) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        out[i] = outStream.read();
    }
}


extern "C" {
    void mmul(int* in1, int* in2, int* out, int size) {
        static hls::stream<int> inStream1("input_stream_1");
        static hls::stream<int> inStream2("input_stream_2");
        static hls::stream<int> outStream("output_stream");
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