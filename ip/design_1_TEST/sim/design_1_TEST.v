//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Jun 25 08:40:22 2021
//Host        : FM-B3P78C3 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_TEST.bd
//Design      : design_1_TEST
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1_TEST,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1_TEST,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1_TEST.hwdef" *) 
module design_1_TEST
   ();

  wire picxo_fracxo_0_OVF_INT;
  wire [21:0]picxo_fracxo_0_VOLT_O;
  wire picxo_fracxo_0_VSIGCE_O;

  design_1_TEST_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(picxo_fracxo_0_OVF_INT),
        .reset(picxo_fracxo_0_VSIGCE_O));
  design_1_TEST_picxo_fracxo_0_0 picxo_fracxo_0
       (.ACC_STEP(picxo_fracxo_0_VOLT_O[3:0]),
        .CE_DSP_RATE(picxo_fracxo_0_VOLT_O[15:0]),
        .C_I(picxo_fracxo_0_VOLT_O[6:0]),
        .DON_I(picxo_fracxo_0_VOLT_O[0]),
        .G1(picxo_fracxo_0_VOLT_O[4:0]),
        .G2(picxo_fracxo_0_VOLT_O[4:0]),
        .N_I(picxo_fracxo_0_VOLT_O[9:0]),
        .OFFSET_EN(picxo_fracxo_0_VOLT_O[0]),
        .OFFSET_PPM(picxo_fracxo_0_VOLT_O),
        .OVF_INT(picxo_fracxo_0_OVF_INT),
        .P_I(picxo_fracxo_0_VOLT_O[9:0]),
        .R(picxo_fracxo_0_VOLT_O[15:0]),
        .REF_CLK_I(picxo_fracxo_0_VOLT_O[0]),
        .RESET_I(picxo_fracxo_0_VOLT_O[0]),
        .RSIGCE_I(picxo_fracxo_0_VOLT_O[0]),
        .TXOUTCLK_I(picxo_fracxo_0_VOLT_O[0]),
        .V(picxo_fracxo_0_VOLT_O[15:0]),
        .VOLT_O(picxo_fracxo_0_VOLT_O),
        .VSIGCE_I(picxo_fracxo_0_VOLT_O[0]),
        .VSIGCE_O(picxo_fracxo_0_VSIGCE_O));
endmodule
