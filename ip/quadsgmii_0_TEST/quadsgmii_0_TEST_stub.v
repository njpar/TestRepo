// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 25 08:37:08 2021
// Host        : FM-B3P78C3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Noah.Parker/VivadoTest/TestRepo/ip/quadsgmii_0_TEST/quadsgmii_0_TEST_stub.v
// Design      : quadsgmii_0_TEST
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu19eg-ffve1924-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "quadsgmii_v3_4_6,Vivado 2019.1" *)
module quadsgmii_0_TEST(reset, gtrefclk, txp, txn, rxp, rxn, txoutclk, 
  rxoutclk, resetdone, userclk, userclk2, rxuserclk, rxuserclk2, independent_clock_bufg, 
  pma_reset, mmcm_locked, sgmii_clk_en_ch0, gmii_txd_ch0, gmii_tx_en_ch0, gmii_tx_er_ch0, 
  gmii_rxd_ch0, gmii_rx_dv_ch0, gmii_rx_er_ch0, mdc_ch0, mdio_i_ch0, mdio_o_ch0, mdio_t_ch0, 
  an_interrupt_ch0, speed_is_10_100_ch0, speed_is_100_ch0, status_vector_ch0, 
  sgmii_clk_en_ch1, gmii_txd_ch1, gmii_tx_en_ch1, gmii_tx_er_ch1, gmii_rxd_ch1, 
  gmii_rx_dv_ch1, gmii_rx_er_ch1, mdc_ch1, mdio_i_ch1, mdio_o_ch1, mdio_t_ch1, 
  an_interrupt_ch1, speed_is_10_100_ch1, speed_is_100_ch1, status_vector_ch1, 
  sgmii_clk_en_ch2, gmii_txd_ch2, gmii_tx_en_ch2, gmii_tx_er_ch2, gmii_rxd_ch2, 
  gmii_rx_dv_ch2, gmii_rx_er_ch2, mdc_ch2, mdio_i_ch2, mdio_o_ch2, mdio_t_ch2, 
  an_interrupt_ch2, speed_is_10_100_ch2, speed_is_100_ch2, status_vector_ch2, 
  sgmii_clk_en_ch3, gmii_txd_ch3, gmii_tx_en_ch3, gmii_tx_er_ch3, gmii_rxd_ch3, 
  gmii_rx_dv_ch3, gmii_rx_er_ch3, mdc_ch3, mdio_i_ch3, mdio_o_ch3, mdio_t_ch3, 
  an_interrupt_ch3, speed_is_10_100_ch3, speed_is_100_ch3, status_vector_ch3, 
  gt_powergood_out, independent_clock_bufgdiv4, signal_detect)
/* synthesis syn_black_box black_box_pad_pin="reset,gtrefclk,txp,txn,rxp,rxn,txoutclk,rxoutclk,resetdone,userclk,userclk2,rxuserclk,rxuserclk2,independent_clock_bufg,pma_reset,mmcm_locked,sgmii_clk_en_ch0,gmii_txd_ch0[7:0],gmii_tx_en_ch0,gmii_tx_er_ch0,gmii_rxd_ch0[7:0],gmii_rx_dv_ch0,gmii_rx_er_ch0,mdc_ch0,mdio_i_ch0,mdio_o_ch0,mdio_t_ch0,an_interrupt_ch0,speed_is_10_100_ch0,speed_is_100_ch0,status_vector_ch0[15:0],sgmii_clk_en_ch1,gmii_txd_ch1[7:0],gmii_tx_en_ch1,gmii_tx_er_ch1,gmii_rxd_ch1[7:0],gmii_rx_dv_ch1,gmii_rx_er_ch1,mdc_ch1,mdio_i_ch1,mdio_o_ch1,mdio_t_ch1,an_interrupt_ch1,speed_is_10_100_ch1,speed_is_100_ch1,status_vector_ch1[15:0],sgmii_clk_en_ch2,gmii_txd_ch2[7:0],gmii_tx_en_ch2,gmii_tx_er_ch2,gmii_rxd_ch2[7:0],gmii_rx_dv_ch2,gmii_rx_er_ch2,mdc_ch2,mdio_i_ch2,mdio_o_ch2,mdio_t_ch2,an_interrupt_ch2,speed_is_10_100_ch2,speed_is_100_ch2,status_vector_ch2[15:0],sgmii_clk_en_ch3,gmii_txd_ch3[7:0],gmii_tx_en_ch3,gmii_tx_er_ch3,gmii_rxd_ch3[7:0],gmii_rx_dv_ch3,gmii_rx_er_ch3,mdc_ch3,mdio_i_ch3,mdio_o_ch3,mdio_t_ch3,an_interrupt_ch3,speed_is_10_100_ch3,speed_is_100_ch3,status_vector_ch3[15:0],gt_powergood_out,independent_clock_bufgdiv4,signal_detect" */;
  input reset;
  input gtrefclk;
  output txp;
  output txn;
  input rxp;
  input rxn;
  output txoutclk;
  output rxoutclk;
  output resetdone;
  input userclk;
  input userclk2;
  input rxuserclk;
  input rxuserclk2;
  input independent_clock_bufg;
  input pma_reset;
  input mmcm_locked;
  output sgmii_clk_en_ch0;
  input [7:0]gmii_txd_ch0;
  input gmii_tx_en_ch0;
  input gmii_tx_er_ch0;
  output [7:0]gmii_rxd_ch0;
  output gmii_rx_dv_ch0;
  output gmii_rx_er_ch0;
  input mdc_ch0;
  input mdio_i_ch0;
  output mdio_o_ch0;
  output mdio_t_ch0;
  output an_interrupt_ch0;
  input speed_is_10_100_ch0;
  input speed_is_100_ch0;
  output [15:0]status_vector_ch0;
  output sgmii_clk_en_ch1;
  input [7:0]gmii_txd_ch1;
  input gmii_tx_en_ch1;
  input gmii_tx_er_ch1;
  output [7:0]gmii_rxd_ch1;
  output gmii_rx_dv_ch1;
  output gmii_rx_er_ch1;
  input mdc_ch1;
  input mdio_i_ch1;
  output mdio_o_ch1;
  output mdio_t_ch1;
  output an_interrupt_ch1;
  input speed_is_10_100_ch1;
  input speed_is_100_ch1;
  output [15:0]status_vector_ch1;
  output sgmii_clk_en_ch2;
  input [7:0]gmii_txd_ch2;
  input gmii_tx_en_ch2;
  input gmii_tx_er_ch2;
  output [7:0]gmii_rxd_ch2;
  output gmii_rx_dv_ch2;
  output gmii_rx_er_ch2;
  input mdc_ch2;
  input mdio_i_ch2;
  output mdio_o_ch2;
  output mdio_t_ch2;
  output an_interrupt_ch2;
  input speed_is_10_100_ch2;
  input speed_is_100_ch2;
  output [15:0]status_vector_ch2;
  output sgmii_clk_en_ch3;
  input [7:0]gmii_txd_ch3;
  input gmii_tx_en_ch3;
  input gmii_tx_er_ch3;
  output [7:0]gmii_rxd_ch3;
  output gmii_rx_dv_ch3;
  output gmii_rx_er_ch3;
  input mdc_ch3;
  input mdio_i_ch3;
  output mdio_o_ch3;
  output mdio_t_ch3;
  output an_interrupt_ch3;
  input speed_is_10_100_ch3;
  input speed_is_100_ch3;
  output [15:0]status_vector_ch3;
  output gt_powergood_out;
  input independent_clock_bufgdiv4;
  input signal_detect;
endmodule
