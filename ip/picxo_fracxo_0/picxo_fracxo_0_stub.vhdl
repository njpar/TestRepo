-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 25 08:39:22 2021
-- Host        : FM-B3P78C3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Noah.Parker/VivadoTest/TestRepo/ip/picxo_fracxo_0/picxo_fracxo_0_stub.vhdl
-- Design      : picxo_fracxo_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu19eg-ffve1924-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity picxo_fracxo_0 is
  Port ( 
    RESET_I : in STD_LOGIC;
    REF_CLK_I : in STD_LOGIC;
    TXOUTCLK_I : in STD_LOGIC;
    RSIGCE_I : in STD_LOGIC;
    VSIGCE_I : in STD_LOGIC;
    VSIGCE_O : out STD_LOGIC;
    ACC_STEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    G1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    G2 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    R : in STD_LOGIC_VECTOR ( 15 downto 0 );
    V : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CE_DSP_RATE : in STD_LOGIC_VECTOR ( 15 downto 0 );
    C_I : in STD_LOGIC_VECTOR ( 6 downto 0 );
    P_I : in STD_LOGIC_VECTOR ( 9 downto 0 );
    N_I : in STD_LOGIC_VECTOR ( 9 downto 0 );
    OFFSET_PPM : in STD_LOGIC_VECTOR ( 21 downto 0 );
    OFFSET_EN : in STD_LOGIC;
    DON_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    ACC_DATA : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ERROR_O : out STD_LOGIC_VECTOR ( 20 downto 0 );
    VOLT_O : out STD_LOGIC_VECTOR ( 21 downto 0 );
    CE_PI_O : out STD_LOGIC;
    CE_PI2_O : out STD_LOGIC;
    CE_DSP_O : out STD_LOGIC;
    OVF_PD : out STD_LOGIC;
    OVF_AB : out STD_LOGIC;
    OVF_VOLT : out STD_LOGIC;
    OVF_INT : out STD_LOGIC
  );

end picxo_fracxo_0;

architecture stub of picxo_fracxo_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "RESET_I,REF_CLK_I,TXOUTCLK_I,RSIGCE_I,VSIGCE_I,VSIGCE_O,ACC_STEP[3:0],G1[4:0],G2[4:0],R[15:0],V[15:0],CE_DSP_RATE[15:0],C_I[6:0],P_I[9:0],N_I[9:0],OFFSET_PPM[21:0],OFFSET_EN,DON_I[0:0],ACC_DATA[4:0],ERROR_O[20:0],VOLT_O[21:0],CE_PI_O,CE_PI2_O,CE_DSP_O,OVF_PD,OVF_AB,OVF_VOLT,OVF_INT";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "picxo_top_wrapper,Vivado 2019.1";
begin
end;
