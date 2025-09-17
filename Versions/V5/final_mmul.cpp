#include <stdint.h>
#include <hls_stream.h>
#include "ap_int.h"

#define TILE_WIDTH 128
#define ROW_WIDTH 16
#define TOTAL_WORDS (TILE_WIDTH * TILE_WIDTH / ROW_WIDTH)
#define WORDS_PER_ROW (TILE_WIDTH / ROW_WIDTH)

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
        #pragma HLS INTERFACE s_axilite port=N
        #pragma HLS INTERFACE s_axilite port=return

        int A_tile[TILE_WIDTH][TILE_WIDTH];
        int B_tile[TILE_WIDTH][TILE_WIDTH];
        int C_tile[TILE_WIDTH][TILE_WIDTH];
        
        const int TOTAL_TILES = N / TILE_WIDTH;

        #pragma HLS array_partition variable=A_tile type=cyclic dim=2 factor=16
        #pragma HLS array_partition variable=B_tile type=cyclic dim=1 factor=16
        #pragma HLS array_partition variable=C_tile type=cyclic dim=2 factor=16


        loop_i: for (int t_i = 0; t_i < TOTAL_TILES; ++t_i) {
         	loop_j: for (int t_j = 0; t_j < TOTAL_TILES; ++t_j){      

                // iterate through the tiles
                // reset C tile
                RESET_C_ii: for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                    #pragma HLS pipeline II=1
                    RESET_C_UNROLL_jj: for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                        #pragma HLS unroll 
                        C_tile[ii][jj] = 0;
                    }
                }

	            loop_k: for (int t_k = 0; t_k < TOTAL_TILES; ++t_k) {

                    ap_int<512>* a_base = in1 + ((t_i * TOTAL_TILES + t_k) * TOTAL_WORDS); 
                    
                    int a_ii = 0;
                    int a_w = 0;
                    load_a_outer: for (int t = 0; t < TOTAL_WORDS; ++t) {
                        #pragma HLS pipeline II=1
                        
                        packed512 tmp;
                        tmp.width = a_base[t];
                        
                        
                        int base = a_w * ROW_WIDTH;
                        unpack_a: for (int r = 0; r < ROW_WIDTH; ++r) {
                            #pragma HLS unroll
                            int jj = base + r;
                            A_tile[a_ii][jj] = tmp.row[r];
                        }
                        
                        a_w++;
                        if (a_w == WORDS_PER_ROW) {
                            a_w = 0;
                            a_ii++;
                        }
                    }

                    ap_int<512>* b_base = in2 + ((t_k * TOTAL_TILES + t_j) * TOTAL_WORDS);
                    
                    int b_ii = 0;
                    int b_w = 0;
                    load_b_outer: for (int t = 0; t < TOTAL_WORDS; ++t) {
                        #pragma HLS pipeline II=1
                       
                        packed512 tmp;
                        tmp.width = b_base[t];

                        
                        int base = b_w * ROW_WIDTH;
                        unpack_b: for (int r = 0; r < ROW_WIDTH; ++r) {
                            #pragma HLS unroll
                            int jj = base + r;
                            B_tile[b_ii][jj] = tmp.row[r];
                        }

                        b_w++;
                        if (b_w == WORDS_PER_ROW) {
                            b_w = 0;
                            b_ii++;
                        }
                    }

                    // compute C_tile
                    COMPUTE_LOOP: for (int ii = 0; ii < TILE_WIDTH; ++ii) {
                        compute_loop_inner: for (int jj = 0; jj < TILE_WIDTH; ++jj) {
                            #pragma HLS pipeline II=1
                            int sum = 0;
                            compute_loop_innermost: for (int kk = 0; kk < TILE_WIDTH; ++kk) {
                                #pragma HLS unroll;
                                sum += A_tile[ii][kk] * B_tile[kk][jj];
                            }
                            C_tile[ii][jj] += sum;
                        }
                    }
		    
                }
		
                // write to output
                ap_int<512>* c_base = out + ((t_i * TOTAL_TILES + t_j) * TOTAL_WORDS);

                int c_ii = 0;
                int c_w = 0;
                store_c_outer: for (int t = 0; t < TOTAL_WORDS; ++t) {
                    #pragma HLS pipeline II=1
                    
                    packed512 tmp;
                    
                    int base = c_w * ROW_WIDTH;
                    unpack_c: for (int r = 0; r < ROW_WIDTH; ++r) {
                        #pragma HLS unroll
                        int jj = base + r;
                        tmp.row[r] = C_tile[c_ii][jj];
                    }

                    c_w++;
                    if (c_w == WORDS_PER_ROW) {
                        c_w = 0;
                        c_ii++;
                    }
                    c_base[t] = tmp.width;
                }
           }
        }		    
    }
}