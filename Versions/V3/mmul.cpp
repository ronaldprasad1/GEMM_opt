
#include <stdint.h>
#include <hls_stream.h>
#include "ap_int.h"

#define TILE_WIDTH 128

union packed512 {
    ap_int<512> width;
    int row[16]; // 512/32 = 16

    packed512() {}
};

extern "C" {
    void mmul(ap_int<512>* in1, ap_int<512>* in2, ap_int<512>* out, int N) {
        #pragma HLS INTERFACE m_axi port = in1 bundle = gmem0
        #pragma HLS INTERFACE m_axi port = in2 bundle = gmem1
        #pragma HLS INTERFACE m_axi port = out bundle = gmem2

        int A_tile[TILE_WIDTH][TILE_WIDTH];
        int B_tile[TILE_WIDTH][TILE_WIDTH];
        int C_tile[TILE_WIDTH][TILE_WIDTH];

        #pragma HLS array_partition variable=A_tile type=cyclic dim=2 factor=8
        #pragma HLS array_partition variable=B_tile type=cyclic dim=1 factor=8
        #pragma HLS array_partition variable=C_tile type=cyclic dim=2 factor=8


        loop_i: 
        for (int i = 0; i < N; i += TILE_WIDTH) {
         	loop_j: 
            for (int j = 0; j < N; j += TILE_WIDTH){      
                // iterate through the tiles
                // reset C tile
                for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                    #pragma HLS pipeline II=1
                    for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                        #pragma HLS unroll factor=8 
                        C_tile[ii][jj] = 0;
                    }
                }

	            loop_k:
                for (int k = 0; k < N; k += TILE_WIDTH) {

                    // load A_tile 

                    // VERSION 1
		            loop_A_ii:
                    for (int ii = 0; ii < TILE_WIDTH; ++ii) {
            		    loop_A_kk_row:
                        for (int kk_row = 0; kk_row < TILE_WIDTH / 16; ++kk_row) {
                            
		                    int row = i + ii;
                            #pragma HLS pipeline II=1
                            int col = k + kk_row * 16;
                            int index = (row * N + col) / 16;
                            
                            packed512 tmp;
                            tmp.width = in1[index];

			                loop_A_unroll:
                            for (int kk = 0; kk < 16; ++kk) {
                                #pragma HLS unroll factor=8
                                A_tile[ii][kk_row * 16 + kk] = tmp.row[kk];
                            }
                        }
                    }
		    
                    // load B_tile
                    for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                        for (int jj_row = 0; jj_row < TILE_WIDTH / 16; ++jj_row) {
                            #pragma HLS pipeline II=1
                            int row = k + kk;
                            int col = j + jj_row * 16;
                            int index = (row * N + col) / 16;

                            packed512 tmp;
                            tmp.width = in2[index];

                            for (int jj = 0; jj < 16; ++jj) {
                                #pragma HLS unroll factor=8
                                B_tile[kk][jj_row * 16 + jj] = tmp.row[jj];
                            }
                        }
                    }
		    
                    // compute C_tile
                    COMPUTE_LOOP:
                    for (int ii = 0; ii < TILE_WIDTH; ++ii) {
		                compute_loop_inner: 
		                for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                            #pragma HLS pipeline II=1
                            int sum = 0;
		                    compute_loop_innermost:
                            for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                                #pragma HLS unroll
                                sum += A_tile[ii][kk] * B_tile[kk][jj];
                            }
                            C_tile[ii][jj] += sum;
                        }
                    }
		    
                }
		
                // write to output
                for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                    for (int jj_row = 0; jj_row < TILE_WIDTH / 16; ++jj_row) {
                        #pragma HLS pipeline II=1
                        packed512 tmp;
                        int row = i + ii;
                        int col = j + jj_row * 16;
                        int index = row * N + col;
                        tmp.width = out[index / 16];

                        for (int jj = 0; jj < 16; ++jj) {
                            #pragma HLS unroll
                            tmp.row[jj] = C_tile[ii][jj_row * 16 + jj];
                        }
                        out[index / 16] = tmp.width;
                    }
                }
		    
            }
		    
        }
		    
		//out[0] = (volatile int) 0;
    }
}
