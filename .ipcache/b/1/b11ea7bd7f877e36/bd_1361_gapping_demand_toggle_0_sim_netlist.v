// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Fri May 23 19:42:15 2025
// Host        : eq1 running 64-bit Linux Mint 21.2
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_1361_gapping_demand_toggle_0_sim_netlist.v
// Design      : bd_1361_gapping_demand_toggle_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_1361_gapping_demand_toggle_0,c_counter_binary_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_16,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN cd_ctrl_00, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_LOAD = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "1" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_16 U0
       (.CE(CE),
        .CLK(CLK),
        .L(1'b0),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
rRTOhyxlrYBSSl4vXOJsCov/PYTcGQv0hZAEWOT0hXiNol44n1/uH9QDDV2d6jw2JngQv7TlJPZr
ks3uCeCjkKNEWnRoMqLLTYocNlzPK8/C69vks1NsEThxNhNC+ZsJsgirzk+kgzY9kn0FeBByVNqf
jvMBsh9uVgRGd4uC1wk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
01nKGPawFhPZM6IfhQEjhBpb1VBWTCn/eVyNPM0YoKiJQV9nou366lnD6Z7IbogTZYpQ+S4S46GW
PUw6z6hJ+9NtiS3jFFu6T9LFXPfNcraug8eCrLWiosznuSBj9mp+1Bol3rqM7js96zbwYO0gqweI
QolQG37MZX2LrNEtgf5D1fnq4deWVQfLA/P2WGX5Hnk//FeuACvmWvGb24p41b9RIe2VpYd8xEQz
A6AtDqFJvar62K48Gzx6gqqLAeVwxFUAgFb2nNrwFHikIbJfIt3VXvF2yBr2Wv1aHj98N3zwMHG9
E+x52jYbkwxMgPOUm/EflFroqLTP230jaGZVkQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
OgWk/5sEH+VtvUozJoY5vqwlh1efblM9NuO5cPvnN4s9tI520b4yVIDKiBCaB9QhJ4geHmQtgFDa
TMoDECveDjTlUvpvwUA91n9f4rTXBK36T3uiuOpqPSFEhM3PJq+nKh/nPjg3bo1//FOQPmo1DI0d
iNpWtFZ4Yuobaoyj1GA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
avNU0fSLkoHFIh/jgPtDSi4L86Y2rAHF1WLjnPGw39ZrkztShDCTHzGPRVaSu06kikZjHwGr6OMy
T67c/p0aK2uSfhKd5uYwusuDWVNMJELM/HyeaR4JFtZGvAtAJkUblcBmbFlkcI4Z49bkp3pjhRbd
oqJsP4yHfbFSuZxkHkOYue3u1K0oQxwgcUrrdjDWx6H2y0fN4RGST5A1qM7gDvK44xvDnmrq1QrB
WuYnDcXDUTN49PurLq8sGWTloRUZZjyG4v4sJZAISb2iEoxXVn2Oir7rUqLsON9rjCa9ReXnwO3F
swiKFDINK5ClAXgbtTMvsfVN+O0IGNRU0aF8Vw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UTM7xXi12etbqCmw/O1eGBPAsmWm1WEG4doh1296UvN3zKFsM0XZSx6Ziz0WajROY06JopnqYS0x
/Ia1Lr6DyPP38PE1ShybMJtKmjZ1zST1OjYMejK7hPTbabUMFmwYT/OfK3ahjtEeWEYYfnIRrRE3
GL+AdqvYhvkGdkLCn0zHlZLa1P6wOKJhkHxUXMOuWxCZnYWb0dYA6q8lwdwL3BUPjWijs0xNXuXh
6AOa5hCO2AUfXuy2pN4DWMLLIWq/eZ22oKicS27mPAUmy/l18cQOtBty67ZhdWjLAuHZYfZEFmdl
p18LDWn1yJaT4uTzqqo3ScoOQYuZvujZL0BH/g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bkTXl+yGo2kTZsZVV2g5kqW/E/Je2ArJQXMgsh7Q9SZbPJkPn9tIdLpVifXduO9BY3NvCUT1tBDC
B56m0NNTikMELxSmvDh9WftYnAGYoN02iguLJTuH7NzI23upb8elIic/BDxq/3iMFm8xDrY19K8r
75jJQT6UylYBGBBx3EYHAhhkCNFWaIbOsDhjr8Pkl48dB7itI7RuNe91ySXIjPfhqaqGYDlQq6iL
LD1ywn/GzcK0iOn1NCWZYrhfNG9npiJxnWJaBhRu0SmuXk3A51Iq2la43BHz9A0mKQxuITXlO6k0
YvNhDl0Rb73kAzaok7jRBBxD/hZCpsaeIRbDKA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U6/adMPoVlZkpPldLQcCHpV4MnnkIQ0koS1BgPRFbzVzgmAT5+90B+/aOuXDsHsTY04FiiPSIkLy
X/dO2qbqvjwOlU7hL5YLfc7M3R6VGFAtCeh26ScKD1rcCEXnk7okSxg+nBgOEdWfQxMWv/Igc1G7
ficf74VbUGXBK7sGFqUiU3Sju74MYsBIWQFL81s+d4noxooslx07SsduB1MZnNo98wPrfeHGRc5I
tOoy1ZWRRBurKqRaweusWsq2353jR1aRe0dis1d2TD9E5IRN04tRbRPxnvaqt5TbI6C0KKVGmJgA
dg5xKX8dUTm5P6EU7CJb0PIRstzyS8dbEWj6Mw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
l62S5HJJngOx7wKWqzRxn8l+Zg34fSA30rTACPQntRpmLTvPCtB/ZO7N2geVIGZC5xlFKur3ypkk
gu7fuj69QZIIf8cA+q5rFgQLKPTV5Jjb56A3m0e1ryIz1HNhekqxB2A3c3BoEM76CvsgwTCuJ54S
4itGKkmT3kSVqW+obJEyNczHp7v9brZlaNTGjLv/R++veL6PEriPMPaTCtM2GqlrRY0BEMamlh3G
G6HR53gprRQpNRt5ZXkgLBQgfAH6tcEUp2spoJfm5XQ0FJd/iuCRvaxcZRZ2SleGB7w4ohuSvU6D
FE5p5qm5ki1c8Q/lkBoNee27G3UYyYFvIVXUZpcrWdQc+9IXYqSZcB7lofhHMrNyGoJS1iwhFvZK
D3F5wNGYRvhmbp3scu/9bG1yieO8z89TMhn88AKkroCRONKExS2ADS+GyaI9cssXVbYPckioLbtI
83vBK/BOGY2haiXenyOeb5nBchvy+BuOhGB7yNbOBo5FjCpHK3NUmnTD

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EB6FjmYfx5AnR6fqTJUDdNb8c6YI6fwnWVddbslCiiAEGWvpdNhCI94KZF1FewEBx/Y7HBBzOaPn
yIlFlswHYGGMlfTegCY7JSiCoX/xAYVWCe9+j+jE1HzhweCqfGP4z8wS5adANRari25fd3QTJfRH
VT9Xk/f2wud81Esu6X0vYYR/Wr9r9gyO/pxR2OgM2A+/LUA4EP4y2PwfdybHcbyhUc+MukeYeuLY
a9ZCUnEUm1GoQ8x1SOVTINVuU2py9zm9rU35K7RKCKr1bWiFQ6fN9YJc37GaxwMNRwOkltL1TXgH
uUy5c0CgX23BbSV2nXDmlCUYQbiQwIH8I0RV4Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
APi7c7POJTa17Aq1yYpsgXXGyDVsShg04NJRlww3Fpx4rVT/LgZ9l8ePKMA0/dPcfJU3SyEIK+1C
J7p2EGpQIPps1DLxGiftGSH4oX++071u00aztuGpATiKL6XsvLpMkU3uYl542TMRyOUQIBUUxY3H
O3r1hH7KiXhEv0zq+kQuspPdyckmAKmi5Je/x/ypr0TUobCLSU7u4dRIHS5uSZqDYmJXf3Kn0fQD
styU0SFHKzb4IRVhTUKg+ijPWR8WpMreOR+TbgrVsq0zfkP/BwKz4zN2XHzSYHWiBGHJdlIEEZON
dD2ksk9lyoRktg4nV0d1WP5WQzHvRBvsVBY7Tw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mw9G2y1Pgm0uVRXA7/sWE7bqaZGb/dNe4s7VPV8FKb8L9Hz68va/jiHgjFbAtQTaQ9PAM37hQUrZ
7oxtVB2MB/NuORHG6enTk/JhlZoUsLVxlru40uGGT6IqqDBGCxi64Y9d3ccc2EUuA1tqFY/Rn/Pj
HDAFdP8Yg5QeSZ8HMQr7PLzPbPbRYFolKJ09Z0XnRZY/g5sQuVNWmqMiFAgrIwp6pHtwlt5KRoiO
F12Rp9qDwO2PABmHDhIJ8njusJ09XGARKhQ4F9+BLeKDUDsovc6RAUexqL9FSvkzmVvU5P/2BYlg
Akkm534Tnp8g/Pou1v0mycfdhgDcTRUkrJ0IzA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5152)
`pragma protect data_block
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
D2WOEhGmRlnD8K9XYCXeSuijVsBx7g==
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
