// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 25 08:39:22 2021
// Host        : FM-B3P78C3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Noah.Parker/VivadoTest/TestRepo/ip/picxo_fracxo_0/picxo_fracxo_0_stub.v
// Design      : picxo_fracxo_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu19eg-ffve1924-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "picxo_top_wrapper,Vivado 2019.1" *)
module picxo_fracxo_0(RESET_I, REF_CLK_I, TXOUTCLK_I, RSIGCE_I, 
  VSIGCE_I, VSIGCE_O, ACC_STEP, G1, G2, R, V, CE_DSP_RATE, C_I, P_I, N_I, OFFSET_PPM, OFFSET_EN, DON_I, 
  ACC_DATA, ERROR_O, VOLT_O, CE_PI_O, CE_PI2_O, CE_DSP_O, OVF_PD, OVF_AB, OVF_VOLT, OVF_INT)
/* synthesis syn_black_box black_box_pad_pin="RESET_I,REF_CLK_I,TXOUTCLK_I,RSIGCE_I,VSIGCE_I,VSIGCE_O,ACC_STEP[3:0],G1[4:0],G2[4:0],R[15:0],V[15:0],CE_DSP_RATE[15:0],C_I[6:0],P_I[9:0],N_I[9:0],OFFSET_PPM[21:0],OFFSET_EN,DON_I[0:0],ACC_DATA[4:0],ERROR_O[20:0],VOLT_O[21:0],CE_PI_O,CE_PI2_O,CE_DSP_O,OVF_PD,OVF_AB,OVF_VOLT,OVF_INT" */;
  input RESET_I;
  input REF_CLK_I;
  input TXOUTCLK_I;
  input RSIGCE_I;
  input VSIGCE_I;
  output VSIGCE_O;
  input [3:0]ACC_STEP;
  input [4:0]G1;
  input [4:0]G2;
  input [15:0]R;
  input [15:0]V;
  input [15:0]CE_DSP_RATE;
  input [6:0]C_I;
  input [9:0]P_I;
  input [9:0]N_I;
  input [21:0]OFFSET_PPM;
  input OFFSET_EN;
  input [0:0]DON_I;
  output [4:0]ACC_DATA;
  output [20:0]ERROR_O;
  output [21:0]VOLT_O;
  output CE_PI_O;
  output CE_PI2_O;
  output CE_DSP_O;
  output OVF_PD;
  output OVF_AB;
  output OVF_VOLT;
  output OVF_INT;
endmodule
