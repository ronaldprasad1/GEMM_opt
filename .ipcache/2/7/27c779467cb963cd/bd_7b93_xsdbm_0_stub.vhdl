-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Fri May 23 19:43:27 2025
-- Host        : eq1 running 64-bit Linux Mint 21.2
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_7b93_xsdbm_0_stub.vhdl
-- Design      : bd_7b93_xsdbm_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    update : in STD_LOGIC;
    capture : in STD_LOGIC;
    reset : in STD_LOGIC;
    runtest : in STD_LOGIC;
    tck : in STD_LOGIC;
    tms : in STD_LOGIC;
    tdi : in STD_LOGIC;
    sel : in STD_LOGIC;
    shift : in STD_LOGIC;
    drck : in STD_LOGIC;
    tdo : out STD_LOGIC;
    bscanid_en : in STD_LOGIC;
    clk : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "update,capture,reset,runtest,tck,tms,tdi,sel,shift,drck,tdo,bscanid_en,clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xsdbm_v3_0_0_xsdbm,Vivado 2023.1";
begin
end;
