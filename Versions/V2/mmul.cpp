#include <stdint.h>
#include <hls_stream.h>
#include "ap_int.h"

#define N 2560
#define TILE_WIDTH 32

extern "C" {
    void mmul(int* in1, int* in2, int* out) {
        #pragma HLS INTERFACE m_axi port = in1 bundle = gmem0
        #pragma HLS INTERFACE m_axi port = in2 bundle = gmem1
        #pragma HLS INTERFACE m_axi port = out bundle = gmem2

        static int A_tile[TILE_WIDTH][TILE_WIDTH];
        static int B_tile[TILE_WIDTH][TILE_WIDTH];
        static int C_tile[TILE_WIDTH][TILE_WIDTH];

        for (int i = 0; i < N; i += TILE_WIDTH) {
            for (int j = 0; j < N; j += TILE_WIDTH) {
                
                // iterate through the tiles
                // reset C tile
                for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                    for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                        #pragma HLS pipeline
                        C_tile[ii][jj] = 0;
                    }
                }

                for (int k = 0; k < N; k += TILE_WIDTH) {

                    // load A_tile
                    for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                        for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                            #pragma HLS pipeline
                            int row = i + ii;
                            int col = k + kk;
                            A_tile[ii][kk] = in1[row * N + col];
                        }
                    }

                    // load B_tile
                    for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                        for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                            #pragma HLS pipeline
                            int row = k + kk;
                            int col = j + jj;
                            B_tile[kk][jj] = in2[row * N + col];
                        }
                    }

                    // compute C_tile
                    for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                        for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                            int sum = 0;
                            for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                                #pragma HLS pipeline
                                sum += A_tile[ii][kk] * B_tile[kk][jj];
                            }
                            C_tile[ii][jj] += sum;
                        }
                    }
                }

                // write to output
                for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                    for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                        #pragma HLS pipeline
                        int row = i + ii;
                        int col = j + jj;

                        out[row * N + col] = C_tile[ii][jj];
                    }
                }
            }
        }
        
    }
}