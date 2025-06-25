// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Fri May 23 19:43:38 2025
// Host        : eq1 running 64-bit Linux Mint 21.2
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_7b93_lut_buffer_0_sim_netlist.v
// Design      : bd_7b93_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_7b93_lut_buffer_0,lut_buffer_v2_0_0_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_0_lut_buffer,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_0_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
PFWuFi9INDaYht5D9rexh/y7jPCksidWuo1Qj9P4/kg4g51mgSPxHO4BORjOYEBOl6igKk6B35Vw
KZn+XAeZUHtYsmme/Mlh7gXkxT5pWoBbSodqiBaU/fSabdC0eSPi3PGkEF8J6iaJ4gfBipmn7SIR
mjAJ0rLvEkIW/xq84Lk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yK0wZhqyxEbGOtcVASnw81GUBW94GwWDEYdacyCUXrEdTt4L277Iw4mXS8SXRMDHxcEHU3XkUemI
9Zw5aS2XBZUjD6AiRLmdmaaMy4PmL9Dqk60bvMVsGzZHOuA1WdeIe9DrfyJu5GfgmIvpobXASIfW
Spy9jf0acLwazzOqBZG2HZMLlYdfUDdca3dp5LbT99nIE4gZ+Lfth0ofw92g/3Tlme1tJ5BmFa6a
TDifQVq16OpP5zDlVI/z2YIQJvYZrjE+eKeyQSX6uBxUMZEBygH8jafWSSvPT9rAuecd3BmSWL7F
Lp4TTPBa83LRlG0O2MAe+7HxUNBv3F75IHzwkw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
LOs5LyF85q1EGknNJJwyStxjeLH/tRt6DtOKGxgNfzrksqJZQmdNh6ibryGbLm2vuVsgs6deHA07
xiCS1X7hKo06PfIkiDEBMAhhVG3OGXORbrnZ34GHPPvYh1ZCZAlv9LaVCmDC1LtSt0JrmCO+fNVF
AG0n4RUPeouYVMsXPQU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OzN4Eh/yuqMyftOotmPdXDvvHpfPcbZaDgplkZX053Q6FgQ1rz2s+Ah62BJR8Wf9QyhwRCwYmZ9x
7EYfqN5EkBKMxueqGKb/JLQTPIwFzB6OjmJiQJ4bxJ7pNILTYxFngHGGhXdlA5tSTzMRUgBOkBA9
qKFJ51C0CvwLKAMTYim13QiLOjDIUJzEltpqNlZuMarSdx7hcyZl8Z+sbRjnBDnmZv6VNCMpwB/Y
0TLwXCnYyVHeosW/TgkuoB0i8hBalboPdqWffYPFAuxkb16PuB1PT1US1RJQoneomFSLpAq8TPwA
C3MJmHs/2BevtB7a4glpX5rTjRH8SH9J/6mcxQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mmn3F07aMaQELmsoIAOLTXobjRPX6+jJGYxbHjAwiv+5GYbu4U1QHqM/n9MWKs5scXwRTklohbAA
sYC6LYGUnASoZ4cRBHxixylxt20YJ12cKi/TBunCWqC3d1aevmfIM3Lxvd2szBsA0T/7TB+3Nnqq
3yB3OVYDS8gXxBp1SL7Bbyay1yUzPEH0tWuf75xMp6gXEj+/D3mhiNWlqmR47ouullerBYE94msU
VtNmb8++jomCzXKIwNqiVjyt3v1FCh69YGeVxGmlVUm/prdbHGGLTDGxNYyn+CzLLISB/XYYwlX3
2jRBVvI5RU/Rji1AMzFUT+1WSuBT8DAY4qjB8w==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
belPtlwUb6tkWZoO/daP4JnSM4Ix9rwO0UINU6lqKRLWU84wh6RRE5L5Vjp7Ep2NKjxmxr/fIx/N
nOeAqkGET10Mnh7wtBqbrKaOaCh+9VwSFg5ZktuhPIA3ieYV25JNzxXg28xOF96ruw5Ta/Q+/mon
VJO3bVWKtTG4dvy5mmOdOK5wKwaMN/UZcBhEg8AZaiG76DOv0DEFCyEkUOJb+Um8ZtHye6Xhwot3
lD84DJmgfiwLJCVmr8I0o4gSEKuwYlz03yx0ntqaleN40mb2K5mIsOUPB0gV9p6UDkllmgrVK2KK
a2zoG1baxmRZ7Gp7QUmaNDbn6o3uod+lZl1ozA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hMbTrg3QVspzwQdvTAHkjT/KH2DRuL4CUyt/0Z5sjxyAaKTIMbIN/jZ+x3/TVS7NDePtu73D+mIG
+1fimH1EvpxpO9wE52LKEu3+y1igFN48hrK0QC4n/Z+tC6q/RgTvWlHV7kTYPcbZBJRi2XjtxByP
gbjAptSbmf4aSQn2aAoeYxtP1Y3SRmdsDMPmMlL5luJ5+sgvJDoydsm3Xz1XOr9lw5MhUN1GtPYd
S13wonWfhYt5FtCApi1VlHFtyA6NOyV4Dj5BS+7h5hLUoJkfkVbnwIQJzp1NAQ/AQA8Gl/Y2emTn
QLJFWilKDxi+FR31oVrwbrItFl8q/GwGJ6EGRQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
OvQ8gaRgp5yYmvledOQGZsF3nMK1WKgp1m0ZXgW9QOFZZPK6omrLMcJ+aMLFCvGsc2GldXXcBtZM
hI33jy47IvykTcRD7Jr3IkOHudh3GNSgi5gqpVnFZuFnpYrW5hAuv6BW+ZgHZsKE/Q5lrUsGdAyw
OhR3UqqHX0VPBsI60QzwCFgZHboHi6bHiPWonZ8Ei7ULxB6XdSDeRqesb+LFyRysa6W6GT7XNRf4
1Xk2R7SLKLqwMA9SFHWBRiMumtr6hxj49qcS90XSKRPhmwFBVnGGqA4xEBhzgtaVM4U073AYQxMW
hfrebm/4LNV4OAQXLh5LGP76og9xB7KScZtxzWghei75OvTHhXoFQAqyH/saIlgAKwgLsVoJPkqS
9sZwnN0Mb2MvI9Des4YZ1/ESDb2qAFvo8ewiS3UxzeWyOKcEcS2ATkSXzz5wxf/kzUxeMI3kiC6M
3meU3wbsXLJu24QLstvkpPPSaIO9420R2GD7EIb56DvSP6rR4FsrqBXr

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RPDrNu9XPTEchh9FQy18nOywOdqS/pwDBk2qsCrp5JG4kr2q8SlG7FMRGGXaPxwAmotmynZ0TZSW
7inea8lC1WTnsd9WblO6l+6l51GMUR5O1j20+bZdJeMidt/7zLoR5O0E1s6W0glfdqVX6qG4DtxY
Li723KHl8S3wBTQDQ3Hw6FoD8/XszNJOEysd55XJ0/FHh9BHFL7oxT7mYtunD1F06xqdW7S8Kf9f
qj72ulLja6JmwnN3+KIiumCpH7gjw/Re4H9lvnIns32Y3SBWDxaVL0Koo0/33ivaHV6uRH0je8uY
4nm/pmzNE4N/Hly2hyPPcli2JFwE0xMlFNWwFw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
