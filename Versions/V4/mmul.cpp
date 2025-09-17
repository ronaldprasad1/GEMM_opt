#include <stdint.h>
#include <hls_stream.h>
#include "ap_int.h"

#define TILE_WIDTH 128
#define ROW_WIDTH 16
#define TOTAL_WORDS (TILE_WIDTH * TILE_WIDTH / ROW_WIDTH)

union packed512 {
    ap_int<512> width;
    int row[16]; // 512/32 = 16

    packed512() {}
};

extern "C" {
    void mmul(ap_int<512>* in1, ap_int<512>* in2, ap_int<512>* out, int N) {
        #pragma HLS INTERFACE m_axi port=in1 bundle=gmem0
        #pragma HLS INTERFACE m_axi port=in2 bundle=gmem1
        #pragma HLS INTERFACE m_axi port=out bundle=gmem2

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
                        #pragma HLS unroll 
                        C_tile[ii][jj] = 0;
                    }
                }

	            loop_k:
                for (int k = 0; k < N; k += TILE_WIDTH) {

		            loop_LOAD_A_B_ii:
                    for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                        int row_base_index_a = ((i + ii) * N + k) / ROW_WIDTH;
                        int row_base_index_b = ((k + ii) * N + j) / ROW_WIDTH;
                        loop_A_B_kk_row:
                        for (int kk_row = 0; kk_row < TILE_WIDTH / ROW_WIDTH; ++kk_row) {
                            #pragma HLS pipeline II=1

                            packed512 a_512, b_512;
                            a_512.width = in1[row_base_index_a + kk_row];
                            b_512.width = in2[row_base_index_b + kk_row];

			                loop_A_B_unroll:
                            for (int r = 0; r < ROW_WIDTH; ++r) {
                                #pragma HLS unroll
                                int jj = kk_row * ROW_WIDTH + r;
                                A_tile[ii][jj] = a_512.row[r];
                                B_tile[ii][jj] = b_512.row[r];
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
                    int row_base_index = ((i + ii) * N + j) / ROW_WIDTH; 
                    for (int jj_row = 0; jj_row < TILE_WIDTH / ROW_WIDTH; ++jj_row) { 
                        #pragma HLS pipeline II=1 
                        packed512 c_512; 
                        
                        for (int r = 0; r < ROW_WIDTH; ++r) { 
                            #pragma HLS unroll
                            int jj = jj_row * ROW_WIDTH + r;
                            c_512.row[r] = C_tile[ii][jj]; 
                        } 

                        out[row_base_index + jj_row] = c_512.width; 
                    }
                }
            }
        }		    
    }
}