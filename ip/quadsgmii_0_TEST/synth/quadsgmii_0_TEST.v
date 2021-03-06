//------------------------------------------------------------------------------
// File       : quadsgmii_0_TEST.v
// Author     : Xilinx Inc.
//------------------------------------------------------------------------------
// (c) Copyright 2011 Xilinx, Inc. All rights reserved.
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
// 
//------------------------------------------------------------------------------
// Description: This Core Block Level wrapper connects the core to a  
//              Series-7 Transceiver.
//
//              The QSGMII adaptation module is provided to convert
//              between 1Gbps and 10/100 Mbps rates for each channel.
//              This is connected to the MAC side of the core to provide 
//              a GMII style interface.  When the core is running at 
//              1Gbps speeds, the GMII (8-bitdata pathway) is used at a
//              clock frequency of 125MHz.  When the core is running at
//              100Mbps, a clock frequency of 12.5MHz is used.  When
//              running at 100Mbps speeds, a clock frequency of 1.25MHz
//              is used.
//
//    -----------------------------------------------------------------
//    |                    Core Block Level Wrapper                   |
//    |                                                               |
//    |                                                               |
//    |                   --------------          --------------      |
//    |                   |    Core    |          | Transceiver|      |
//    |                   |            |          |            |      |
//    |    ----------     |            |          |            |      |
//    |    |        |     |            |          |            |      |
//    |    | QSGMII |     |            |          |            |      |
//  ------>| Adapt  |---->| GMII       |--------->|        TXP |-------->
//    |    | Module |     | Tx         |          |        TXN |      |
//    |    |        |     |            |          |            |      |
//    |    |        |     |            |          |            |      |
//    |    |        |     |            |          |            |      |
//    |    |        |     |            |          |            |      |
//    |    |        |     |            |          |            |      |
//    |    |        |     | GMII       |          |        RXP |      |
//  <------|        |<----| Rx         |<---------|        RXN |<--------
//    |    |        |     |            |          |            |      |
//    |    ----------     --------------          --------------      |
//    |                                                               |
//    -----------------------------------------------------------------
//
//

`timescale 1 ps/1 ps

//------------------------------------------------------------------------------
// The module declaration for the Core Block wrapper.
//------------------------------------------------------------------------------

(* CORE_GENERATION_INFO = "quadsgmii_0_TEST,quadsgmii_v3_4_6,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=quadsgmii,x_ipVersion=3.4,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,c_elaboration_transient_dir=./,c_component_name=quadsgmii_0_TEST,c_family=zynquplus,c_xdevicefamily=xczu19eg,c_has_an=true,c_has_mdio=true,c_qsgmii_phy_mode=false,c_gmii_or_mii_mode=true,C_PHYADDR_0=1,C_PHYADDR_1=2,C_PHYADDR_2=3,C_PHYADDR_3=4,EXAMPLE_SIMULATION=0,c_support_level=false,c_transceivercontrol=false,c_config_interface=false,c_an_config_interface=false,c_sub_core_name=quadsgmii_0_TEST_gt,c_gt_dmonitorout_width=16,c_gt_drpaddr_width=10,c_gt_txdiffctrl_width=5,c_gt_rxmonitorout_width=8,c_gt_loc=X0Y0,c_refclk=clk0,c_drpclkrate=75.0,c_gttype=5,c_rx_gmii_clk_src=TXOUTCLK,c_enable_tx_userclk_reset_port=true}" *)
(* X_CORE_INFO = "quadsgmii_v3_4_6,Vivado 2019.1" *)
module quadsgmii_0_TEST
   (
      input        reset,                     // Asynchronous reset for entire core.


      // Transceiver Interface
      //----------------------

      input        gtrefclk,                  // Very high quality 125MHz clock for GT transceiver.
      output       txp,                       // Differential +ve of serial transmission from PMA to PMD.
      output       txn,                       // Differential -ve of serial transmission from PMA to PMD.
      input        rxp,                       // Differential +ve for serial reception from PMD to PMA.
      input        rxn,                       // Differential -ve for serial reception from PMD to PMA.

      output       txoutclk,                  // txoutclk from GT transceiver (62.5MHz)
      output       rxoutclk,                  // rxoutclk from GT transceiver
      output       resetdone,                 // The GT transceiver has completed its reset cycle
      input        userclk,                   // 125MHz global clock.
      input        userclk2,                  // 125MHz global clock.
      input        rxuserclk,                 
      input        rxuserclk2,                
      input        independent_clock_bufg,    // 200 MHx independent clock.

      input        pma_reset,                 // transceiver PMA reset signal
      input        mmcm_locked,               // MMCM Locked

      //-----------------------------------------------
      // CHANNEL 0 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output       sgmii_clk_en_ch0,          // Clock enable for client MAC
      input [7:0]  gmii_txd_ch0,              // Transmit data from client MAC.
      input        gmii_tx_en_ch0,            // Transmit control signal from client MAC.
      input        gmii_tx_er_ch0,            // Transmit control signal from client MAC.
      output [7:0] gmii_rxd_ch0,              // Received Data to client MAC.
      output       gmii_rx_dv_ch0,            // Received control signal to client MAC.
      output       gmii_rx_er_ch0,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input        mdc_ch0,                   // Management Data Clock
      input        mdio_i_ch0,                // Management Data In
      output       mdio_o_ch0,                // Management Data Out
      output       mdio_t_ch0,                // Management Data Tristate
      output       an_interrupt_ch0,          // Interrupt to processor to signal that Auto-Negotiation has completed

      // Speed Control
      //--------------
      input        speed_is_10_100_ch0,       // Core should operate at either 10Mbps or 100Mbps speeds
      input        speed_is_100_ch0,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output [15:0] status_vector_ch0,         // Core status.

      //-----------------------------------------------
      // CHANNEL 1 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output       sgmii_clk_en_ch1,          // Clock enable for client MAC
      input [7:0]  gmii_txd_ch1,              // Transmit data from client MAC.
      input        gmii_tx_en_ch1,            // Transmit control signal from client MAC.
      input        gmii_tx_er_ch1,            // Transmit control signal from client MAC.
      output [7:0] gmii_rxd_ch1,              // Received Data to client MAC.
      output       gmii_rx_dv_ch1,            // Received control signal to client MAC.
      output       gmii_rx_er_ch1,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input        mdc_ch1,                   // Management Data Clock
      input        mdio_i_ch1,                // Management Data In
      output       mdio_o_ch1,                // Management Data Out
      output       mdio_t_ch1,                // Management Data Tristate
      output       an_interrupt_ch1,          // Interrupt to processor to signal that Auto-Negotiation has completed

      // Speed Control
      //--------------
      input        speed_is_10_100_ch1,       // Core should operate at either 10Mbps or 100Mbps speeds
      input        speed_is_100_ch1,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output [15:0] status_vector_ch1,         // Core status

      //-----------------------------------------------
      // CHANNEL 2 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output       sgmii_clk_en_ch2,          // Clock enable for client MAC
      input [7:0]  gmii_txd_ch2,              // Transmit data from client MAC.
      input        gmii_tx_en_ch2,            // Transmit control signal from client MAC.
      input        gmii_tx_er_ch2,            // Transmit control signal from client MAC.
      output [7:0] gmii_rxd_ch2,              // Received Data to client MAC.
      output       gmii_rx_dv_ch2,            // Received control signal to client MAC.
      output       gmii_rx_er_ch2,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input        mdc_ch2,                   // Management Data Clock
      input        mdio_i_ch2,                // Management Data In
      output       mdio_o_ch2,                // Management Data Out
      output       mdio_t_ch2,                // Management Data Tristate
      output       an_interrupt_ch2,          // Interrupt to processor to signal that Auto-Negotiation has completed

      // Speed Control
      //--------------
      input        speed_is_10_100_ch2,       // Core should operate at either 10Mbps or 100Mbps speeds
      input        speed_is_100_ch2,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output [15:0] status_vector_ch2,         // Core status

      //-----------------------------------------------
      // CHANNEL 3 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output       sgmii_clk_en_ch3,          // Clock enable for client MAC
      input [7:0]  gmii_txd_ch3,              // Transmit data from client MAC.
      input        gmii_tx_en_ch3,            // Transmit control signal from client MAC.
      input        gmii_tx_er_ch3,            // Transmit control signal from client MAC.
      output [7:0] gmii_rxd_ch3,              // Received Data to client MAC.
      output       gmii_rx_dv_ch3,            // Received control signal to client MAC.
      output       gmii_rx_er_ch3,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input        mdc_ch3,                   // Management Data Clock
      input        mdio_i_ch3,                // Management Data In
      output       mdio_o_ch3,                // Management Data Out
      output       mdio_t_ch3,                // Management Data Tristate
      output       an_interrupt_ch3,          // Interrupt to processor to signal that Auto-Negotiation has completed

      // Speed Control
      //--------------
      input        speed_is_10_100_ch3,       // Core should operate at either 10Mbps or 100Mbps speeds
      input        speed_is_100_ch3,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output [15:0] status_vector_ch3,        // Core status

      output             gt_powergood_out,
      input              independent_clock_bufgdiv4,
      input              signal_detect              // Input from PMD to indicate presence of optical input.
   );

parameter EXAMPLE_SIMULATION = 0 ;
wire [8:0]      link_timer_value_ch0;
wire [8:0]      link_timer_value_ch1;
wire [8:0]      link_timer_value_ch2;
wire [8:0]      link_timer_value_ch3;

assign link_timer_value_ch0  = (EXAMPLE_SIMULATION == 1 ) ? 9'b000000100 : 9'b000110010;
assign link_timer_value_ch1  = (EXAMPLE_SIMULATION == 1 ) ? 9'b000000100 : 9'b000110010;
assign link_timer_value_ch2  = (EXAMPLE_SIMULATION == 1 ) ? 9'b000000100 : 9'b000110010;
assign link_timer_value_ch3  = (EXAMPLE_SIMULATION == 1 ) ? 9'b000000100 : 9'b000110010;


quadsgmii_0_TEST_block inst
   (
      .reset                                (reset),

      // Transceiver Interface
      //----------------------

      .gtrefclk                             (gtrefclk),
      .txp                                  (txp),
      .txn                                  (txn),
      .rxp                                  (rxp),
      .rxn                                  (rxn),

      .txoutclk                             (txoutclk),
      .rxoutclk                             (rxoutclk),
      .resetdone                            (resetdone),
      .userclk                              (userclk),
      .userclk2                             (userclk2),
      .rxuserclk                            (rxuserclk),
      .rxuserclk2                           (rxuserclk2),
      .independent_clock_bufg               (independent_clock_bufg),

      .pma_reset                            (pma_reset),
      .mmcm_locked                          (mmcm_locked),

      //-----------------------------------------------
      // CHANNEL 0 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      .sgmii_clk_en_ch0                     (sgmii_clk_en_ch0),
      .gmii_txd_ch0                         (gmii_txd_ch0),
      .gmii_tx_en_ch0                       (gmii_tx_en_ch0),
      .gmii_tx_er_ch0                       (gmii_tx_er_ch0),
      .gmii_rxd_ch0                         (gmii_rxd_ch0),
      .gmii_rx_dv_ch0                       (gmii_rx_dv_ch0),
      .gmii_rx_er_ch0                       (gmii_rx_er_ch0),

      // Management: MDIO Interface
      //---------------------------
      .mdc_ch0                              (mdc_ch0),
      .mdio_i_ch0                           (mdio_i_ch0),
      .mdio_o_ch0                           (mdio_o_ch0),
      .mdio_t_ch0                           (mdio_t_ch0),
      .phyad_ch0                            (5'd1),
      .an_interrupt_ch0                     (an_interrupt_ch0),
      .link_timer_value_ch0                 (link_timer_value_ch0),

      // Speed Control
      //--------------
      .speed_is_10_100_ch0                  (speed_is_10_100_ch0),
      .speed_is_100_ch0                     (speed_is_100_ch0),

      // General IO's
      //-------------
      .status_vector_ch0                    (status_vector_ch0),

      //-----------------------------------------------
      // CHANNEL 1 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      .sgmii_clk_en_ch1                     (sgmii_clk_en_ch1),
      .gmii_txd_ch1                         (gmii_txd_ch1),
      .gmii_tx_en_ch1                       (gmii_tx_en_ch1),
      .gmii_tx_er_ch1                       (gmii_tx_er_ch1),
      .gmii_rxd_ch1                         (gmii_rxd_ch1),
      .gmii_rx_dv_ch1                       (gmii_rx_dv_ch1),
      .gmii_rx_er_ch1                       (gmii_rx_er_ch1),

      // Management: MDIO Interface
      //---------------------------
      .mdc_ch1                              (mdc_ch1),
      .mdio_i_ch1                           (mdio_i_ch1),
      .mdio_o_ch1                           (mdio_o_ch1),
      .mdio_t_ch1                           (mdio_t_ch1),
      .phyad_ch1                            (5'd2),
      .an_interrupt_ch1                     (an_interrupt_ch1),
      .link_timer_value_ch1                 (link_timer_value_ch1),

      // Speed Control
      //--------------
      .speed_is_10_100_ch1                  (speed_is_10_100_ch1),
      .speed_is_100_ch1                     (speed_is_100_ch1),

      // General IO's
      //-------------
      .status_vector_ch1                    (status_vector_ch1),

      //-----------------------------------------------
      // CHANNEL 2 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      .sgmii_clk_en_ch2                     (sgmii_clk_en_ch2),
      .gmii_txd_ch2                         (gmii_txd_ch2),
      .gmii_tx_en_ch2                       (gmii_tx_en_ch2),
      .gmii_tx_er_ch2                       (gmii_tx_er_ch2),
      .gmii_rxd_ch2                         (gmii_rxd_ch2),
      .gmii_rx_dv_ch2                       (gmii_rx_dv_ch2),
      .gmii_rx_er_ch2                       (gmii_rx_er_ch2),

      // Management: MDIO Interface
      //---------------------------
      .mdc_ch2                              (mdc_ch2),
      .mdio_i_ch2                           (mdio_i_ch2),
      .mdio_o_ch2                           (mdio_o_ch2),
      .mdio_t_ch2                           (mdio_t_ch2),
      .phyad_ch2                            (5'd3),
      .an_interrupt_ch2                     (an_interrupt_ch2),
      .link_timer_value_ch2                 (link_timer_value_ch2),

      // Speed Control
      //--------------
      .speed_is_10_100_ch2                  (speed_is_10_100_ch2),
      .speed_is_100_ch2                     (speed_is_100_ch2),

      // General IO's
      //-------------
      .status_vector_ch2                    (status_vector_ch2),

      //-----------------------------------------------
      // CHANNEL 3 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      .sgmii_clk_en_ch3                     (sgmii_clk_en_ch3),
      .gmii_txd_ch3                         (gmii_txd_ch3),
      .gmii_tx_en_ch3                       (gmii_tx_en_ch3),
      .gmii_tx_er_ch3                       (gmii_tx_er_ch3),
      .gmii_rxd_ch3                         (gmii_rxd_ch3),
      .gmii_rx_dv_ch3                       (gmii_rx_dv_ch3),
      .gmii_rx_er_ch3                       (gmii_rx_er_ch3),

      // Management: MDIO Interface
      //---------------------------
      .mdc_ch3                              (mdc_ch3),
      .mdio_i_ch3                           (mdio_i_ch3),
      .mdio_o_ch3                           (mdio_o_ch3),
      .mdio_t_ch3                           (mdio_t_ch3),
      .phyad_ch3                            (5'd4),
      .an_interrupt_ch3                     (an_interrupt_ch3),
      .link_timer_value_ch3                 (link_timer_value_ch3),

      // Speed Control
      //--------------
      .speed_is_10_100_ch3                  (speed_is_10_100_ch3),
      .speed_is_100_ch3                     (speed_is_100_ch3),

      // General IO's
      //-------------
      .status_vector_ch3                    (status_vector_ch3),

      .gt0_powergood_out                    (gt_powergood_out),
      .independent_clock_bufgdiv4           (independent_clock_bufgdiv4),
      .signal_detect                        (signal_detect)
   );

endmodule // quadsgmii_0_TEST

