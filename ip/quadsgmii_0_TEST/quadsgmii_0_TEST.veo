// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:quadsgmii:3.4
// IP Revision: 6

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
quadsgmii_0_TEST your_instance_name (
  .reset(reset),                                            // input wire reset
  .signal_detect(signal_detect),                            // input wire signal_detect
  .gtrefclk(gtrefclk),                                      // input wire gtrefclk
  .txn(txn),                                                // output wire txn
  .txp(txp),                                                // output wire txp
  .rxn(rxn),                                                // input wire rxn
  .rxp(rxp),                                                // input wire rxp
  .txoutclk(txoutclk),                                      // output wire txoutclk
  .rxoutclk(rxoutclk),                                      // output wire rxoutclk
  .resetdone(resetdone),                                    // output wire resetdone
  .userclk(userclk),                                        // input wire userclk
  .userclk2(userclk2),                                      // input wire userclk2
  .rxuserclk(rxuserclk),                                    // input wire rxuserclk
  .rxuserclk2(rxuserclk2),                                  // input wire rxuserclk2
  .independent_clock_bufg(independent_clock_bufg),          // input wire independent_clock_bufg
  .pma_reset(pma_reset),                                    // input wire pma_reset
  .mmcm_locked(mmcm_locked),                                // input wire mmcm_locked
  .sgmii_clk_en_ch0(sgmii_clk_en_ch0),                      // output wire sgmii_clk_en_ch0
  .gmii_txd_ch0(gmii_txd_ch0),                              // input wire [7 : 0] gmii_txd_ch0
  .gmii_tx_en_ch0(gmii_tx_en_ch0),                          // input wire gmii_tx_en_ch0
  .gmii_tx_er_ch0(gmii_tx_er_ch0),                          // input wire gmii_tx_er_ch0
  .gmii_rxd_ch0(gmii_rxd_ch0),                              // output wire [7 : 0] gmii_rxd_ch0
  .gmii_rx_dv_ch0(gmii_rx_dv_ch0),                          // output wire gmii_rx_dv_ch0
  .gmii_rx_er_ch0(gmii_rx_er_ch0),                          // output wire gmii_rx_er_ch0
  .mdc_ch0(mdc_ch0),                                        // input wire mdc_ch0
  .mdio_i_ch0(mdio_i_ch0),                                  // input wire mdio_i_ch0
  .mdio_o_ch0(mdio_o_ch0),                                  // output wire mdio_o_ch0
  .mdio_t_ch0(mdio_t_ch0),                                  // output wire mdio_t_ch0
  .an_interrupt_ch0(an_interrupt_ch0),                      // output wire an_interrupt_ch0
  .speed_is_10_100_ch0(speed_is_10_100_ch0),                // input wire speed_is_10_100_ch0
  .speed_is_100_ch0(speed_is_100_ch0),                      // input wire speed_is_100_ch0
  .status_vector_ch0(status_vector_ch0),                    // output wire [15 : 0] status_vector_ch0
  .sgmii_clk_en_ch1(sgmii_clk_en_ch1),                      // output wire sgmii_clk_en_ch1
  .gmii_txd_ch1(gmii_txd_ch1),                              // input wire [7 : 0] gmii_txd_ch1
  .gmii_tx_en_ch1(gmii_tx_en_ch1),                          // input wire gmii_tx_en_ch1
  .gmii_tx_er_ch1(gmii_tx_er_ch1),                          // input wire gmii_tx_er_ch1
  .gmii_rxd_ch1(gmii_rxd_ch1),                              // output wire [7 : 0] gmii_rxd_ch1
  .gmii_rx_dv_ch1(gmii_rx_dv_ch1),                          // output wire gmii_rx_dv_ch1
  .gmii_rx_er_ch1(gmii_rx_er_ch1),                          // output wire gmii_rx_er_ch1
  .mdc_ch1(mdc_ch1),                                        // input wire mdc_ch1
  .mdio_i_ch1(mdio_i_ch1),                                  // input wire mdio_i_ch1
  .mdio_o_ch1(mdio_o_ch1),                                  // output wire mdio_o_ch1
  .mdio_t_ch1(mdio_t_ch1),                                  // output wire mdio_t_ch1
  .an_interrupt_ch1(an_interrupt_ch1),                      // output wire an_interrupt_ch1
  .speed_is_10_100_ch1(speed_is_10_100_ch1),                // input wire speed_is_10_100_ch1
  .speed_is_100_ch1(speed_is_100_ch1),                      // input wire speed_is_100_ch1
  .status_vector_ch1(status_vector_ch1),                    // output wire [15 : 0] status_vector_ch1
  .sgmii_clk_en_ch2(sgmii_clk_en_ch2),                      // output wire sgmii_clk_en_ch2
  .gmii_txd_ch2(gmii_txd_ch2),                              // input wire [7 : 0] gmii_txd_ch2
  .gmii_tx_en_ch2(gmii_tx_en_ch2),                          // input wire gmii_tx_en_ch2
  .gmii_tx_er_ch2(gmii_tx_er_ch2),                          // input wire gmii_tx_er_ch2
  .gmii_rxd_ch2(gmii_rxd_ch2),                              // output wire [7 : 0] gmii_rxd_ch2
  .gmii_rx_dv_ch2(gmii_rx_dv_ch2),                          // output wire gmii_rx_dv_ch2
  .gmii_rx_er_ch2(gmii_rx_er_ch2),                          // output wire gmii_rx_er_ch2
  .mdc_ch2(mdc_ch2),                                        // input wire mdc_ch2
  .mdio_i_ch2(mdio_i_ch2),                                  // input wire mdio_i_ch2
  .mdio_o_ch2(mdio_o_ch2),                                  // output wire mdio_o_ch2
  .mdio_t_ch2(mdio_t_ch2),                                  // output wire mdio_t_ch2
  .an_interrupt_ch2(an_interrupt_ch2),                      // output wire an_interrupt_ch2
  .speed_is_10_100_ch2(speed_is_10_100_ch2),                // input wire speed_is_10_100_ch2
  .speed_is_100_ch2(speed_is_100_ch2),                      // input wire speed_is_100_ch2
  .status_vector_ch2(status_vector_ch2),                    // output wire [15 : 0] status_vector_ch2
  .sgmii_clk_en_ch3(sgmii_clk_en_ch3),                      // output wire sgmii_clk_en_ch3
  .gmii_txd_ch3(gmii_txd_ch3),                              // input wire [7 : 0] gmii_txd_ch3
  .gmii_tx_en_ch3(gmii_tx_en_ch3),                          // input wire gmii_tx_en_ch3
  .gmii_tx_er_ch3(gmii_tx_er_ch3),                          // input wire gmii_tx_er_ch3
  .gmii_rxd_ch3(gmii_rxd_ch3),                              // output wire [7 : 0] gmii_rxd_ch3
  .gmii_rx_dv_ch3(gmii_rx_dv_ch3),                          // output wire gmii_rx_dv_ch3
  .gmii_rx_er_ch3(gmii_rx_er_ch3),                          // output wire gmii_rx_er_ch3
  .mdc_ch3(mdc_ch3),                                        // input wire mdc_ch3
  .mdio_i_ch3(mdio_i_ch3),                                  // input wire mdio_i_ch3
  .mdio_o_ch3(mdio_o_ch3),                                  // output wire mdio_o_ch3
  .mdio_t_ch3(mdio_t_ch3),                                  // output wire mdio_t_ch3
  .an_interrupt_ch3(an_interrupt_ch3),                      // output wire an_interrupt_ch3
  .speed_is_10_100_ch3(speed_is_10_100_ch3),                // input wire speed_is_10_100_ch3
  .speed_is_100_ch3(speed_is_100_ch3),                      // input wire speed_is_100_ch3
  .status_vector_ch3(status_vector_ch3),                    // output wire [15 : 0] status_vector_ch3
  .gt_powergood_out(gt_powergood_out),                      // output wire gt_powergood_out
  .independent_clock_bufgdiv4(independent_clock_bufgdiv4)  // input wire independent_clock_bufgdiv4
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file quadsgmii_0_TEST.v when simulating
// the core, quadsgmii_0_TEST. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

