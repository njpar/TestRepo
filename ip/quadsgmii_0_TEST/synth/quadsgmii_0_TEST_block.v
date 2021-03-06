//------------------------------------------------------------------------------
// File       : quadsgmii_0_TEST_block.v
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

module quadsgmii_0_TEST_block
   (
      input            reset,                     // Asynchronous reset for entire core.

      // Transceiver Interface
      //----------------------

      input            gtrefclk,                  // Very high quality 125MHz clock for GT transceiver.
      output           txp,                       // Differential +ve of serial transmission from PMA to PMD.
      output           txn,                       // Differential -ve of serial transmission from PMA to PMD.
      input            rxp,                       // Differential +ve for serial reception from PMD to PMA.
      input            rxn,                       // Differential -ve for serial reception from PMD to PMA.

      output           txoutclk,                  // txoutclk from GT transceiver (62.5MHz)
      output           rxoutclk,                  // rxoutclk from GT transceiver
      output           resetdone,                 // The GT transceiver has completed its reset cycle
      input            userclk,                   // 125MHz global clock.
      input            userclk2,                  // 125MHz global clock.
      input            rxuserclk,                 // global clock.
      input            rxuserclk2,                // 125MHz global clock.
      input            independent_clock_bufg,    // 200 MHx independent clock.

      input            pma_reset,                 // transceiver PMA reset signal
      input            mmcm_locked,               // MMCM Locked

      //-----------------------------------------------
      // CHANNEL 0 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output reg       sgmii_clk_en_ch0,          // Clock enable for client MAC
      input [7:0]      gmii_txd_ch0,              // Transmit data from client MAC.
      input            gmii_tx_en_ch0,            // Transmit control signal from client MAC.
      input            gmii_tx_er_ch0,            // Transmit control signal from client MAC.
      output reg [7:0] gmii_rxd_ch0,              // Received Data to client MAC.
      output reg       gmii_rx_dv_ch0,            // Received control signal to client MAC.
      output reg       gmii_rx_er_ch0,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input             mdc_ch0,                   // Management Data Clock
      input             mdio_i_ch0,                // Management Data In
      output            mdio_o_ch0,                // Management Data Out
      output            mdio_t_ch0,                // Management Data Tristate
      input [4:0]       phyad_ch0,                 // Port address for MDIO.
      output            an_interrupt_ch0,          // Interrupt to processor to signal that Auto-Negotiation has completed
      input [8:0]       link_timer_value_ch0,      // Programmable Auto-Negotiation Link Timer Control

      // Speed Control
      //--------------
      input             speed_is_10_100_ch0,       // Core should operate at either 10Mbps or 100Mbps speeds
      input             speed_is_100_ch0,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output wire [15:0] status_vector_ch0,         // Core status.

      //-----------------------------------------------
      // CHANNEL 1 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output reg        sgmii_clk_en_ch1,          // Clock enable for client MAC
      input [7:0]       gmii_txd_ch1,              // Transmit data from client MAC.
      input             gmii_tx_en_ch1,            // Transmit control signal from client MAC.
      input             gmii_tx_er_ch1,            // Transmit control signal from client MAC.
      output reg [7:0]  gmii_rxd_ch1,              // Received Data to client MAC.
      output reg        gmii_rx_dv_ch1,            // Received control signal to client MAC.
      output reg        gmii_rx_er_ch1,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input             mdc_ch1,                   // Management Data Clock
      input             mdio_i_ch1,                // Management Data In
      output            mdio_o_ch1,                // Management Data Out
      output            mdio_t_ch1,                // Management Data Tristate
      input [4:0]       phyad_ch1,                 // Port address for MDIO.
      output            an_interrupt_ch1,          // Interrupt to processor to signal that Auto-Negotiation has completed
      input [8:0]       link_timer_value_ch1,      // Programmable Auto-Negotiation Link Timer Control

      // Speed Control
      //--------------
      input             speed_is_10_100_ch1,       // Core should operate at either 10Mbps or 100Mbps speeds
      input             speed_is_100_ch1,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output wire [15:0] status_vector_ch1,         // Core status

      //-----------------------------------------------
      // CHANNEL 2 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output reg        sgmii_clk_en_ch2,          // Clock enable for client MAC
      input [7:0]       gmii_txd_ch2,              // Transmit data from client MAC.
      input             gmii_tx_en_ch2,            // Transmit control signal from client MAC.
      input             gmii_tx_er_ch2,            // Transmit control signal from client MAC.
      output reg [7:0]  gmii_rxd_ch2,              // Received Data to client MAC.
      output reg        gmii_rx_dv_ch2,            // Received control signal to client MAC.
      output reg        gmii_rx_er_ch2,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input             mdc_ch2,                   // Management Data Clock
      input             mdio_i_ch2,                // Management Data In
      output            mdio_o_ch2,                // Management Data Out
      output            mdio_t_ch2,                // Management Data Tristate
      input [4:0]       phyad_ch2,                 // Port address for MDIO.
      output            an_interrupt_ch2,          // Interrupt to processor to signal that Auto-Negotiation has completed
      input [8:0]       link_timer_value_ch2,      // Programmable Auto-Negotiation Link Timer Control

      // Speed Control
      //--------------
      input             speed_is_10_100_ch2,       // Core should operate at either 10Mbps or 100Mbps speeds
      input             speed_is_100_ch2,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output wire [15:0] status_vector_ch2,         // Core status

      //-----------------------------------------------
      // CHANNEL 3 Interface
      //-----------------------------------------------
      // GMII Interface
      //---------------
      output reg        sgmii_clk_en_ch3,          // Clock enable for client MAC
      input [7:0]       gmii_txd_ch3,              // Transmit data from client MAC.
      input             gmii_tx_en_ch3,            // Transmit control signal from client MAC.
      input             gmii_tx_er_ch3,            // Transmit control signal from client MAC.
      output reg [7:0]  gmii_rxd_ch3,              // Received Data to client MAC.
      output reg        gmii_rx_dv_ch3,            // Received control signal to client MAC.
      output reg        gmii_rx_er_ch3,            // Received control signal to client MAC.

      // Management: MDIO Interface
      //---------------------------
      input             mdc_ch3,                   // Management Data Clock
      input             mdio_i_ch3,                // Management Data In
      output            mdio_o_ch3,                // Management Data Out
      output            mdio_t_ch3,                // Management Data Tristate
      input [4:0]       phyad_ch3,                 // Port address for MDIO.
      output            an_interrupt_ch3,          // Interrupt to processor to signal that Auto-Negotiation has completed
      input [8:0]       link_timer_value_ch3,      // Programmable Auto-Negotiation Link Timer Control

      // Speed Control
      //--------------
      input             speed_is_10_100_ch3,       // Core should operate at either 10Mbps or 100Mbps speeds
      input             speed_is_100_ch3,          // Core should operate at 100Mbps speed

      // General IO's
      //-------------
      output wire [15:0] status_vector_ch3,         // Core status

      // GT Interface
      //-------------
      input              independent_clock_bufgdiv4,
      output             gt0_powergood_out,
      input            signal_detect              // Input from PMD to indicate presence of optical input.

   );


   //---------------------------------------------------------------------------
   // Internal signals used in this block level wrapper.
   //---------------------------------------------------------------------------

   // Core <=> Transceiver interconnect
   wire         plllock;                  // The PLL Locked status of the Transceiver
   wire         mgt_rx_reset;             // Reset for the receiver half of the Transceiver
   wire         mgt_tx_reset;             // Reset for the transmitter half of the Transceiver
   wire [3:0]   rxchariscomma;            // Comma detected in RXDATA.
   wire [3:0]   rxcharisk;                // K character received (or extra data bit) in RXDATA.
   wire [2:0]   rxclkcorcnt;              // Indicates clock correction.
   wire [31:0]  rxdata;                   // Data after 8B/10B decoding.
   wire [3:0]   rxrundisp;                // Running Disparity after current byte, becomes 9th data bit when RXNOTINTABLE='1'.
   wire [3:0]   rxdisperr;                // Disparity-error in RXDATA.
   wire [3:0]   rxnotintable;             // Non-existent 8B/10 code indicated.
   wire         txbuferr;                 // TX Buffer error (overflow or underflow).
   wire         loopback;                 // Set the Transceiver for loopback.
   wire         powerdown;                // Powerdown the Transceiver
   wire [3:0]   txchardispmode;           // Set running disparity for current byte.
   wire [3:0]   txchardispval;            // Set running disparity value.
   wire [3:0]   txcharisk;                // K character transmitted in TXDATA.
   wire [31:0]  txdata;                   // Data for 8B/10B encoding.
   wire         enablealign;              // Allow the transceivers to serially realign to a comma character.
   
   reg   [3:0]  data_valid_ctl;
   wire         gt_channel_valid_ch0_int;
   wire         gt_channel_valid_ch1_int;
   wire         gt_channel_valid_ch2_int;
   wire         gt_channel_valid_ch3_int;

   reg          data_valid;               // Signal indicating the sync status
   wire         gt0_txresetdone_out_sig;  // Transmit reset done
   wire         gt0_rxresetdone_out_sig;  // Receive reset done
   wire         gt0_txresetdone_out_sync; // Transmit reset done sync
   wire         gt0_rxresetdone_out_sync; // Receive reset done sync
   wire         gt0_resetdone_out_sig;    // reset done
   wire         sgmii_clk_en_ch0_int;      // Clock enable for client MAC
   wire         sgmii_clk_en_ch1_int;      // Clock enable for client MAC
   wire         sgmii_clk_en_ch2_int;      // Clock enable for client MAC
   wire         sgmii_clk_en_ch3_int;      // Clock enable for client MAC

   // signals routed between Interface and SGMII Adaptation Module
   wire  [7:0]  gmii_txd_ch0_adp;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch0_adp;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch0_adp;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch0_adp;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch0_adp;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch0_adp;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch1_adp;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch1_adp;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch1_adp;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch1_adp;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch1_adp;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch1_adp;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch2_adp;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch2_adp;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch2_adp;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch2_adp;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch2_adp;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch2_adp;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch3_adp;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch3_adp;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch3_adp;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch3_adp;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch3_adp;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch3_adp;       // internal gmii_rx_er signal.

   // GMII signals routed between Interface and SGMII Adaptation Module
   reg  [7:0]   gmii_txd_ch0_int1;        // internal gmii_txd signal.
   reg          gmii_tx_en_ch0_int1;      // internal gmii_tx_en signal.
   reg          gmii_tx_er_ch0_int1;      // internal gmii_tx_er signal.
   wire [7:0]   gmii_rxd_ch0_int1;        // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch0_int1;      // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch0_int1;      // internal gmii_rx_er signal.

   reg  [7:0]   gmii_txd_ch1_int1;        // internal gmii_txd signal.
   reg          gmii_tx_en_ch1_int1;      // internal gmii_tx_en signal.
   reg          gmii_tx_er_ch1_int1;      // internal gmii_tx_er signal.
   wire [7:0]   gmii_rxd_ch1_int1;        // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch1_int1;      // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch1_int1;      // internal gmii_rx_er signal.

   reg  [7:0]   gmii_txd_ch2_int1;        // internal gmii_txd signal.
   reg          gmii_tx_en_ch2_int1;      // internal gmii_tx_en signal.
   reg          gmii_tx_er_ch2_int1;      // internal gmii_tx_er signal.
   wire [7:0]   gmii_rxd_ch2_int1;        // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch2_int1;      // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch2_int1;      // internal gmii_rx_er signal.

   reg  [7:0]   gmii_txd_ch3_int1;        // internal gmii_txd signal.
   reg          gmii_tx_en_ch3_int1;      // internal gmii_tx_en signal.
   reg          gmii_tx_er_ch3_int1;      // internal gmii_tx_er signal.
   wire [7:0]   gmii_rxd_ch3_int1;        // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch3_int1;      // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch3_int1;      // internal gmii_rx_er signal.

   // GMII signals routed between core and SGMII Adaptation Module
   wire  [7:0]  gmii_txd_ch0_int;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch0_int;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch0_int;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch0_int;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch0_int;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch0_int;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch1_int;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch1_int;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch1_int;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch1_int;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch1_int;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch1_int;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch2_int;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch2_int;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch2_int;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch2_int;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch2_int;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch2_int;       // internal gmii_rx_er signal.

   wire  [7:0]  gmii_txd_ch3_int;         // internal gmii_txd signal.
   wire         gmii_tx_en_ch3_int;       // internal gmii_tx_en signal.
   wire         gmii_tx_er_ch3_int;       // internal gmii_tx_er signal.
   wire  [7:0]  gmii_rxd_ch3_int;         // internal gmii_rxd signal.
   wire         gmii_rx_dv_ch3_int;       // internal gmii_rx_dv signal.
   wire         gmii_rx_er_ch3_int;       // internal gmii_rx_er signal.



   //---------------------------------------------------------------------------
   // GMII Enable register logic
   //---------------------------------------------------------------------------

   // Drive input GMII signals through IOB input flip-flops (inferred).
   always @ (posedge userclk2)
     begin
         sgmii_clk_en_ch0   <= sgmii_clk_en_ch0_int;
         sgmii_clk_en_ch1   <= sgmii_clk_en_ch1_int;
         sgmii_clk_en_ch2   <= sgmii_clk_en_ch2_int;
         sgmii_clk_en_ch3   <= sgmii_clk_en_ch3_int;
     end

   //---------------------------------------------------------------------------
   // GMII transmitter data logic
   //---------------------------------------------------------------------------


   // Drive input GMII signals through IOB input flip-flops (inferred).
   always @ (posedge userclk2)
     begin
         gmii_txd_ch0_int1    <= gmii_txd_ch0;
         gmii_tx_en_ch0_int1  <= gmii_tx_en_ch0;
         gmii_tx_er_ch0_int1  <= gmii_tx_er_ch0;
         gmii_txd_ch1_int1    <= gmii_txd_ch1;
         gmii_tx_en_ch1_int1  <= gmii_tx_en_ch1;
         gmii_tx_er_ch1_int1  <= gmii_tx_er_ch1;
         gmii_txd_ch2_int1    <= gmii_txd_ch2;
         gmii_tx_en_ch2_int1  <= gmii_tx_en_ch2;
         gmii_tx_er_ch2_int1  <= gmii_tx_er_ch2;
         gmii_txd_ch3_int1    <= gmii_txd_ch3;
         gmii_tx_en_ch3_int1  <= gmii_tx_en_ch3;
         gmii_tx_er_ch3_int1  <= gmii_tx_er_ch3;
     end

   // Drive input GMII signals through IOB input flip-flops (inferred).
   assign gmii_txd_ch0_adp   = gmii_txd_ch0_int1;
   assign gmii_tx_en_ch0_adp = gmii_tx_en_ch0_int1;
   assign gmii_tx_er_ch0_adp = gmii_tx_er_ch0_int1;
   assign gmii_txd_ch1_adp   = gmii_txd_ch1_int1;
   assign gmii_tx_en_ch1_adp = gmii_tx_en_ch1_int1;
   assign gmii_tx_er_ch1_adp = gmii_tx_er_ch1_int1;
   assign gmii_txd_ch2_adp   = gmii_txd_ch2_int1;
   assign gmii_tx_en_ch2_adp = gmii_tx_en_ch2_int1;
   assign gmii_tx_er_ch2_adp = gmii_tx_er_ch2_int1;
   assign gmii_txd_ch3_adp   = gmii_txd_ch3_int1;
   assign gmii_tx_en_ch3_adp = gmii_tx_en_ch3_int1;
   assign gmii_tx_er_ch3_adp = gmii_tx_er_ch3_int1;


   //---------------------------------------------------------------------------
   // GMII receiver data logic
   //---------------------------------------------------------------------------

   // Assigning receive adapt signals to int signals
   assign gmii_rxd_ch0_int1    = gmii_rxd_ch0_adp;
   assign gmii_rx_dv_ch0_int1  = gmii_rx_dv_ch0_adp;
   assign gmii_rx_er_ch0_int1  = gmii_rx_er_ch0_adp;
   assign gmii_rxd_ch1_int1    = gmii_rxd_ch1_adp;
   assign gmii_rx_dv_ch1_int1  = gmii_rx_dv_ch1_adp;
   assign gmii_rx_er_ch1_int1  = gmii_rx_er_ch1_adp;
   assign gmii_rxd_ch2_int1    = gmii_rxd_ch2_adp;
   assign gmii_rx_dv_ch2_int1  = gmii_rx_dv_ch2_adp;
   assign gmii_rx_er_ch2_int1  = gmii_rx_er_ch2_adp;
   assign gmii_rxd_ch3_int1    = gmii_rxd_ch3_adp;
   assign gmii_rx_dv_ch3_int1  = gmii_rx_dv_ch3_adp;
   assign gmii_rx_er_ch3_int1  = gmii_rx_er_ch3_adp;

   // Drive input GMII signals through IOB output flip-flops (inferred).
   always @ (posedge userclk2)
     begin
         gmii_rxd_ch0    <= gmii_rxd_ch0_int1;
         gmii_rx_dv_ch0  <= gmii_rx_dv_ch0_int1;
         gmii_rx_er_ch0  <= gmii_rx_er_ch0_int1;
         gmii_rxd_ch1    <= gmii_rxd_ch1_int1;
         gmii_rx_dv_ch1  <= gmii_rx_dv_ch1_int1;
         gmii_rx_er_ch1  <= gmii_rx_er_ch1_int1;
         gmii_rxd_ch2    <= gmii_rxd_ch2_int1;
         gmii_rx_dv_ch2  <= gmii_rx_dv_ch2_int1;
         gmii_rx_er_ch2  <= gmii_rx_er_ch2_int1;
         gmii_rxd_ch3    <= gmii_rxd_ch3_int1;
         gmii_rx_dv_ch3  <= gmii_rx_dv_ch3_int1;
         gmii_rx_er_ch3  <= gmii_rx_er_ch3_int1;
     end


   //---------------------------------------------------------------------------
   // Component Instantiation for the SGMII adaptation module
   //---------------------------------------------------------------------------

   quadsgmii_0_TEST_qsgmii_adapt qsgmii_logic_tx
    (
      .reset                     (reset),
      .clk125m                   (userclk2),
      .sgmii_clk_r_ch0           (sgmii_clk_r_ch0),
      .sgmii_clk_f_ch0           (sgmii_clk_f_ch0),
      .sgmii_clk_en_ch0          (sgmii_clk_en_ch0_int),
      .gmii_txd_in_ch0           (gmii_txd_ch0_adp),
      .gmii_tx_en_in_ch0         (gmii_tx_en_ch0_adp),
      .gmii_tx_er_in_ch0         (gmii_tx_er_ch0_adp),
      .gmii_rxd_out_ch0          (),
      .gmii_rx_dv_out_ch0        (),
      .gmii_rx_er_out_ch0        (),
      .gmii_rxd_in_ch0           (8'b0),
      .gmii_rx_dv_in_ch0         (1'b0),
      .gmii_rx_er_in_ch0         (1'b0),
      .gmii_txd_out_ch0          (gmii_txd_ch0_int),
      .gmii_tx_en_out_ch0        (gmii_tx_en_ch0_int),
      .gmii_tx_er_out_ch0        (gmii_tx_er_ch0_int),
      .speed_is_10_100_ch0       (speed_is_10_100_ch0),
      .speed_is_100_ch0          (speed_is_100_ch0),
      .sgmii_clk_r_ch1           (sgmii_clk_r_ch1),
      .sgmii_clk_f_ch1           (sgmii_clk_f_ch1),
      .sgmii_clk_en_ch1          (sgmii_clk_en_ch1_int),
      .gmii_txd_in_ch1           (gmii_txd_ch1_adp),
      .gmii_tx_en_in_ch1         (gmii_tx_en_ch1_adp),
      .gmii_tx_er_in_ch1         (gmii_tx_er_ch1_adp),
      .gmii_rxd_out_ch1          (),
      .gmii_rx_dv_out_ch1        (),
      .gmii_rx_er_out_ch1        (),
      .gmii_rxd_in_ch1           (8'b0),
      .gmii_rx_dv_in_ch1         (1'b0),
      .gmii_rx_er_in_ch1         (1'b0),
      .gmii_txd_out_ch1          (gmii_txd_ch1_int),
      .gmii_tx_en_out_ch1        (gmii_tx_en_ch1_int),
      .gmii_tx_er_out_ch1        (gmii_tx_er_ch1_int),
      .speed_is_10_100_ch1       (speed_is_10_100_ch1),
      .speed_is_100_ch1          (speed_is_100_ch1),
      .sgmii_clk_r_ch2           (sgmii_clk_r_ch2),
      .sgmii_clk_f_ch2           (sgmii_clk_f_ch2),
      .sgmii_clk_en_ch2          (sgmii_clk_en_ch2_int),
      .gmii_txd_in_ch2           (gmii_txd_ch2_adp),
      .gmii_tx_en_in_ch2         (gmii_tx_en_ch2_adp),
      .gmii_tx_er_in_ch2         (gmii_tx_er_ch2_adp),
      .gmii_rxd_out_ch2          (),
      .gmii_rx_dv_out_ch2        (),
      .gmii_rx_er_out_ch2        (),
      .gmii_rxd_in_ch2           (8'b0),
      .gmii_rx_dv_in_ch2         (1'b0),
      .gmii_rx_er_in_ch2         (1'b0),
      .gmii_txd_out_ch2          (gmii_txd_ch2_int),
      .gmii_tx_en_out_ch2        (gmii_tx_en_ch2_int),
      .gmii_tx_er_out_ch2        (gmii_tx_er_ch2_int),
      .speed_is_10_100_ch2       (speed_is_10_100_ch2),
      .speed_is_100_ch2          (speed_is_100_ch2),
      .sgmii_clk_r_ch3           (sgmii_clk_r_ch3),
      .sgmii_clk_f_ch3           (sgmii_clk_f_ch3),
      . sgmii_clk_en_ch3         (sgmii_clk_en_ch3_int),
      .gmii_txd_in_ch3           (gmii_txd_ch3_adp),
      .gmii_tx_en_in_ch3         (gmii_tx_en_ch3_adp),
      .gmii_tx_er_in_ch3         (gmii_tx_er_ch3_adp),
      .gmii_rxd_out_ch3          (),
      .gmii_rx_dv_out_ch3        (),
      .gmii_rx_er_out_ch3        (),
      .gmii_rxd_in_ch3           (8'b0),
      .gmii_rx_dv_in_ch3         (1'b0),
      .gmii_rx_er_in_ch3         (1'b0),
      .gmii_txd_out_ch3          (gmii_txd_ch3_int),
      .gmii_tx_en_out_ch3        (gmii_tx_en_ch3_int),
      .gmii_tx_er_out_ch3        (gmii_tx_er_ch3_int),
      .speed_is_10_100_ch3       (speed_is_10_100_ch3),
      .speed_is_100_ch3          (speed_is_100_ch3)
  
    );

   quadsgmii_0_TEST_qsgmii_adapt qsgmii_logic_rx
    (
      .reset                     (reset),
      .clk125m                   (userclk2),
      .sgmii_clk_r_ch0           (sgmii_clk_r_rx_ch0),
      .sgmii_clk_f_ch0           (sgmii_clk_f_rx_ch0),
      .sgmii_clk_en_ch0          (sgmii_clk_en_rx_ch0_int),
      .gmii_txd_in_ch0           (8'b0),
      .gmii_tx_en_in_ch0         (1'b0),
      .gmii_tx_er_in_ch0         (1'b0),
      .gmii_rxd_out_ch0          (gmii_rxd_ch0_adp),
      .gmii_rx_dv_out_ch0        (gmii_rx_dv_ch0_adp),
      .gmii_rx_er_out_ch0        (gmii_rx_er_ch0_adp),
      .gmii_rxd_in_ch0           (gmii_rxd_ch0_int),
      .gmii_rx_dv_in_ch0         (gmii_rx_dv_ch0_int),
      .gmii_rx_er_in_ch0         (gmii_rx_er_ch0_int),
      .gmii_txd_out_ch0          (),
      .gmii_tx_en_out_ch0        (),
      .gmii_tx_er_out_ch0        (),
      .speed_is_10_100_ch0       (speed_is_10_100_ch0),
      .speed_is_100_ch0          (speed_is_100_ch0),
      .sgmii_clk_r_ch1           (sgmii_clk_r_rx_ch1),
      .sgmii_clk_f_ch1           (sgmii_clk_f_rx_ch1),
      .sgmii_clk_en_ch1          (sgmii_clk_en_rx_ch1_int),
      .gmii_txd_in_ch1           (8'b0),
      .gmii_tx_en_in_ch1         (1'b0),
      .gmii_tx_er_in_ch1         (1'b0),
      .gmii_rxd_out_ch1          (gmii_rxd_ch1_adp),
      .gmii_rx_dv_out_ch1        (gmii_rx_dv_ch1_adp),
      .gmii_rx_er_out_ch1        (gmii_rx_er_ch1_adp),
      .gmii_rxd_in_ch1           (gmii_rxd_ch1_int),
      .gmii_rx_dv_in_ch1         (gmii_rx_dv_ch1_int),
      .gmii_rx_er_in_ch1         (gmii_rx_er_ch1_int),
      .gmii_txd_out_ch1          (),
      .gmii_tx_en_out_ch1        (),
      .gmii_tx_er_out_ch1        (),
      .speed_is_10_100_ch1       (speed_is_10_100_ch1),
      .speed_is_100_ch1          (speed_is_100_ch1),
      .sgmii_clk_r_ch2           (sgmii_clk_r_rx_ch2),
      .sgmii_clk_f_ch2           (sgmii_clk_f_rx_ch2),
      .sgmii_clk_en_ch2          (sgmii_clk_en_rx_ch2_int),
      .gmii_txd_in_ch2           (8'b0),
      .gmii_tx_en_in_ch2         (1'b0),
      .gmii_tx_er_in_ch2         (1'b0),
      .gmii_rxd_out_ch2          (gmii_rxd_ch2_adp),
      .gmii_rx_dv_out_ch2        (gmii_rx_dv_ch2_adp),
      .gmii_rx_er_out_ch2        (gmii_rx_er_ch2_adp),
      .gmii_rxd_in_ch2           (gmii_rxd_ch2_int),
      .gmii_rx_dv_in_ch2         (gmii_rx_dv_ch2_int),
      .gmii_rx_er_in_ch2         (gmii_rx_er_ch2_int),
      .gmii_txd_out_ch2          (),
      .gmii_tx_en_out_ch2        (),
      .gmii_tx_er_out_ch2        (),
      .speed_is_10_100_ch2       (speed_is_10_100_ch2),
      .speed_is_100_ch2          (speed_is_100_ch2),
      .sgmii_clk_r_ch3           (sgmii_clk_r_rx_ch3),
      .sgmii_clk_f_ch3           (sgmii_clk_f_rx_ch3),
      .sgmii_clk_en_ch3          (sgmii_clk_en_rx_ch3_int),
      .gmii_txd_in_ch3           (8'b0),
      .gmii_tx_en_in_ch3         (1'b0),
      .gmii_tx_er_in_ch3         (1'b0),
      .gmii_rxd_out_ch3          (gmii_rxd_ch3_adp),
      .gmii_rx_dv_out_ch3        (gmii_rx_dv_ch3_adp),
      .gmii_rx_er_out_ch3        (gmii_rx_er_ch3_adp),
      .gmii_rxd_in_ch3           (gmii_rxd_ch3_int),
      .gmii_rx_dv_in_ch3         (gmii_rx_dv_ch3_int),
      .gmii_rx_er_in_ch3         (gmii_rx_er_ch3_int),
      .gmii_txd_out_ch3          (),
      .gmii_tx_en_out_ch3        (),
      .gmii_tx_er_out_ch3        (),
      .speed_is_10_100_ch3       (speed_is_10_100_ch3),
      .speed_is_100_ch3          (speed_is_100_ch3)
  
    );

   //---------------------------------------------------------------------------
   // Instantiate the core
   //---------------------------------------------------------------------------
   quadsgmii_v3_4_6 #(
       .c_elaboration_transient_dir ("BlankString"),
       .c_component_name            ("quadsgmii_0_TEST"),
       .c_family                    ("zynquplus"),
       .c_has_an                    (1'b1),
       .c_has_mdio                  (1'b1),
       .c_rx_gmii_clk               ("TXOUTCLK"),
       .c_qsgmii_phy_mode           (1'b0),
       .c_gmii_or_mii_mode          (1'b1)
     )
   quadsgmii_0_TEST_core
     (
       .reset                    (reset),
       .signal_detect            (signal_detect),
       .mgt_rx_reset             (mgt_rx_reset),
       .mgt_tx_reset             (mgt_tx_reset),
       .userclk                  (userclk2),
       .userclk2                 (userclk2),
       .rxrecclk                 (rxuserclk2),
       .reset_done               (gt0_resetdone_out_sig),
       .gt_channel_valid_ch0     (gt_channel_valid_ch0_int),
       .gt_channel_valid_ch1     (gt_channel_valid_ch1_int),
       .gt_channel_valid_ch2     (gt_channel_valid_ch2_int),
       .gt_channel_valid_ch3     (gt_channel_valid_ch3_int),
       .dcm_locked               (plllock),
       .rxchariscomma            (rxchariscomma),
       .rxcharisk                (rxcharisk),
       .rxclkcorcnt              (rxclkcorcnt),
       .rxdata                   (rxdata),
       .rxdisperr                (rxdisperr),
       .rxnotintable             (rxnotintable),
       .rxrundisp                (rxrundisp),
       .txbuferr                 (txbuferr),
       .powerdown                (powerdown),
       .txchardispmode           (txchardispmode),
       .txchardispval            (txchardispval),
       .txcharisk                (txcharisk),
       .txdata                   (txdata),
       .enablealign              (enablealign),
       .gmii_txd_ch0             (gmii_txd_ch0_int),
       .gmii_tx_en_ch0           (gmii_tx_en_ch0_int),
       .gmii_tx_er_ch0           (gmii_tx_er_ch0_int),
       .gmii_rxd_ch0             (gmii_rxd_ch0_int),
       .gmii_rx_dv_ch0           (gmii_rx_dv_ch0_int),
       .gmii_rx_er_ch0           (gmii_rx_er_ch0_int),
       .gmii_isolate_ch0         (gmii_isolate_ch0),
       .an_interrupt_ch0         (an_interrupt_ch0),
       .link_timer_value_ch0     (link_timer_value_ch0),
       .an_adv_config_vector_ch0 (16'b1),
       .an_adv_config_val_ch0    (1'b0),
       .an_restart_config_ch0    (1'b0),
       .phyad_ch0                (phyad_ch0),
       .mdc_ch0                  (mdc_ch0),
       .mdio_in_ch0              (mdio_i_ch0),
       .mdio_out_ch0             (mdio_o_ch0),
       .mdio_tri_ch0             (mdio_t_ch0),
       .configuration_valid_ch0  (1'b0),
       .configuration_vector_ch0 (5'b00000),
       .status_vector_ch0        (status_vector_ch0),
       .gmii_txd_ch1             (gmii_txd_ch1_int),
       .gmii_tx_en_ch1           (gmii_tx_en_ch1_int),
       .gmii_tx_er_ch1           (gmii_tx_er_ch1_int),
       .gmii_rxd_ch1             (gmii_rxd_ch1_int),
       .gmii_rx_dv_ch1           (gmii_rx_dv_ch1_int),
       .gmii_rx_er_ch1           (gmii_rx_er_ch1_int),
       .gmii_isolate_ch1         (gmii_isolate_ch1),
       .an_interrupt_ch1         (an_interrupt_ch1),
       .link_timer_value_ch1     (link_timer_value_ch1),
       .an_adv_config_vector_ch1 (16'b1),
       .an_adv_config_val_ch1    (1'b0),
       .an_restart_config_ch1    (1'b0),
       .phyad_ch1                (phyad_ch1),
       .mdc_ch1                  (mdc_ch1),
       .mdio_in_ch1              (mdio_i_ch1),
       .mdio_out_ch1             (mdio_o_ch1),
       .mdio_tri_ch1             (mdio_t_ch1),
       .configuration_valid_ch1  (1'b0),
       .configuration_vector_ch1 (5'b00000),
       .status_vector_ch1        (status_vector_ch1),
       .gmii_txd_ch2             (gmii_txd_ch2_int),
       .gmii_tx_en_ch2           (gmii_tx_en_ch2_int),
       .gmii_tx_er_ch2           (gmii_tx_er_ch2_int),
       .gmii_rxd_ch2             (gmii_rxd_ch2_int),
       .gmii_rx_dv_ch2           (gmii_rx_dv_ch2_int),
       .gmii_rx_er_ch2           (gmii_rx_er_ch2_int),
       .gmii_isolate_ch2         (gmii_isolate_ch2),
       .an_interrupt_ch2         (an_interrupt_ch2),
       .link_timer_value_ch2     (link_timer_value_ch2),
       .an_adv_config_vector_ch2 (16'b1),
       .an_adv_config_val_ch2    (1'b0),
       .an_restart_config_ch2    (1'b0),
       .phyad_ch2                (phyad_ch2),
       .mdc_ch2                  (mdc_ch2),
       .mdio_in_ch2              (mdio_i_ch2),
       .mdio_out_ch2             (mdio_o_ch2),
       .mdio_tri_ch2             (mdio_t_ch2),
       .configuration_valid_ch2  (1'b0),
       .configuration_vector_ch2 (5'b00000),
       .status_vector_ch2        (status_vector_ch2),
       .gmii_txd_ch3             (gmii_txd_ch3_int),
       .gmii_tx_en_ch3           (gmii_tx_en_ch3_int),
       .gmii_tx_er_ch3           (gmii_tx_er_ch3_int),
       .gmii_rxd_ch3             (gmii_rxd_ch3_int),
       .gmii_rx_dv_ch3           (gmii_rx_dv_ch3_int),
       .gmii_rx_er_ch3           (gmii_rx_er_ch3_int),
       .gmii_isolate_ch3         (gmii_isolate_ch3),
       .an_interrupt_ch3         (an_interrupt_ch3),
       .link_timer_value_ch3     (link_timer_value_ch3),
       .an_adv_config_vector_ch3 (16'b1),
       .an_adv_config_val_ch3    (1'b0),
       .an_restart_config_ch3    (1'b0),
       .phyad_ch3                (phyad_ch3),
       .mdc_ch3                  (mdc_ch3),
       .mdio_in_ch3              (mdio_i_ch3),
       .mdio_out_ch3             (mdio_o_ch3),
       .mdio_tri_ch3             (mdio_t_ch3),
       .configuration_valid_ch3  (1'b0),
       .configuration_vector_ch3 (5'b00000),
       .status_vector_ch3        (status_vector_ch3)
      );


   //---------------------------------------------------------------------------
   //  Component Instantiation for the Series-7 Transceiver wrapper
   //---------------------------------------------------------------------------

quadsgmii_0_TEST_sync_block sync_rxresetdone_i
        (
           .clk             (userclk2),
           .data_in         (gt0_rxresetdone_out_sig),
           .data_out        (gt0_rxresetdone_out_sync)
        );

quadsgmii_0_TEST_sync_block sync_txresetdone_i
        (
           .clk             (userclk2),
           .data_in         (gt0_txresetdone_out_sig),
           .data_out        (gt0_txresetdone_out_sync)
        );

  always @(*)
  begin
     data_valid_ctl <= {gt_channel_valid_ch3_int, gt_channel_valid_ch2_int, gt_channel_valid_ch1_int, gt_channel_valid_ch0_int};
  end

  always @(*)
  begin
     case (data_valid_ctl)
        4'b0000: data_valid <= 1'b0; 
        4'b0001: data_valid <= status_vector_ch0[1];
        4'b0010: data_valid <= status_vector_ch1[1]; 
        4'b0011: data_valid <= status_vector_ch1[1] && status_vector_ch0[1];
        4'b0100: data_valid <= status_vector_ch2[1];
        4'b0101: data_valid <= status_vector_ch2[1] && status_vector_ch0[1]; 
        4'b0110: data_valid <= status_vector_ch2[1] && status_vector_ch1[1];
        4'b0111: data_valid <= status_vector_ch2[1] && status_vector_ch1[1] && status_vector_ch0[1];
        4'b1000: data_valid <= status_vector_ch3[1];
        4'b1001: data_valid <= status_vector_ch3[1] && status_vector_ch0[1];
        4'b1010: data_valid <= status_vector_ch3[1] && status_vector_ch1[1]; 
        4'b1011: data_valid <= status_vector_ch3[1] && status_vector_ch1[1] && status_vector_ch0[1];
        4'b1100: data_valid <= status_vector_ch3[1] && status_vector_ch2[1];
        4'b1101: data_valid <= status_vector_ch3[1] && status_vector_ch2[1] && status_vector_ch0[1]; 
        4'b1110: data_valid <= status_vector_ch3[1] && status_vector_ch2[1] && status_vector_ch1[1];
        4'b1111: data_valid <= status_vector_ch3[1] && status_vector_ch2[1] && status_vector_ch1[1] && status_vector_ch0[1];
     endcase
  end

   assign gt0_resetdone_out_sig  = gt0_txresetdone_out_sync && gt0_rxresetdone_out_sync;

   quadsgmii_0_TEST_transceiver transceiver_inst (
      .encommaalign                 (enablealign),
      .powerdown                    (powerdown),
      .usrclk                       (userclk),
      .usrclk2                      (userclk2),
      .rxusrclk                     (rxuserclk),
      .rxusrclk2                    (rxuserclk2),
      .independent_clock_bufg       (independent_clock_bufg),
      .data_valid                   (data_valid),
      .mgt_tx_reset                 (mgt_tx_reset),
      .txchardispmode               (txchardispmode),
      .txchardispval                (txchardispval),
      .txcharisk                    (txcharisk),
      .txdata                       (txdata),
      .mgt_rx_reset                 (mgt_rx_reset),
      .rxchariscomma                (rxchariscomma),
      .rxcharisk                    (rxcharisk),
      .rxclkcorcnt                  (rxclkcorcnt),
      .rxdata                       (rxdata),
      .rxdisperr                    (rxdisperr),
      .rxnotintable                 (rxnotintable),
      .rxrundisp                    (rxrundisp),
      .txbuferr                     (txbuferr),
      .plllkdet                     (plllock),
      .txoutclk                     (txoutclk),
      .rxoutclk                     (rxoutclk),
      .rxelecidle                   (),
      .txn                          (txn),
      .txp                          (txp),
      .rxn                          (rxn),
      .rxp                          (rxp),
      .gtrefclk                     (gtrefclk),
      .gt0_txpmareset_in            (1'b0),
      .gt0_txpcsreset_in            (1'b0),
      .gt0_rxbyteisaligned_out      (),
      .gt0_rxbyterealign_out        (),
      .gt0_rxcommadet_out           (),
      .gt0_txpolarity_in            (1'b0),
      .gt0_txdiffctrl_in            (5'b11000),
      .gt0_txpostcursor_in          (5'b00000),
      .gt0_txprecursor_in           (5'b00000),
      .gt0_rxpolarity_in            (1'b0),
      .gt0_txinhibit_in             (1'b0),
      .gt0_rxdfelpmreset_in         (1'b0),
      .gt0_rxdfeagcovrden_in        (1'b0),
      .gt0_rxlpmen_in               (1'b1),
      .gt0_txprbssel_in             (3'b000),
      .gt0_txprbsforceerr_in        (1'b0),
      .gt0_rxprbscntreset_in        (1'b0),
      .gt0_rxprbserr_out            (),
      .gt0_rxprbssel_in             (3'b000),
      .gt0_loopback_in              (3'b000),
      .gt0_txresetdone_out          (gt0_txresetdone_out_sig),
      .gt0_rxresetdone_out          (gt0_rxresetdone_out_sig),
      .gt0_rxpmareset_in            (1'b0),
      .gt0_rxpcsreset_in            (1'b0),
      .gt0_txbufstatus_out          (),
      .gt0_rxbufstatus_out          (),
      .gt0_rxbufreset_in            (1'b0),
      .gt0_cplllock_out             (),
      .gt0_rxpmaresetdone_out       (),
      .gt0_drpaddr_in               (10'b0),
      .gt0_drpclk_in                (independent_clock_bufgdiv4),
      .gt0_drpdi_in                 (16'b0),
      .gt0_drpdo_out                (),
      .gt0_drpen_in                 (1'b0),
      .gt0_drprdy_out               (),
      .gt0_drpwe_in                 (1'b0),
      .gt0_pcsrsvdin_in             (16'h0000),
      .gt0_eyescanreset_in          (1'b0),
      .gt0_eyescandataerror_out     (),
      .gt0_eyescantrigger_in        (1'b0),
      .gt0_rxrate_in                (3'b000),
      .gt0_rxcdrhold_in             (1'b0),
      .gt0_rxratedone_out           (),
      .gt0_dmonitorout_out          (),
      .gt0_rxmonitorout_out         (),
      .gt0_rxmonitorsel_in          (2'b00),
      .gt0_powergood_out            (gt0_powergood_out),

      .pmareset                     (pma_reset),
      .resetdone                    (resetdone)
   );


  // Loopback is performed in the core itself.  To alternatively use
  // Transceiver loopback, please drive this port appropriately.
  assign loopback = 1'b0;
endmodule // quadsgmii_0_TEST_block

