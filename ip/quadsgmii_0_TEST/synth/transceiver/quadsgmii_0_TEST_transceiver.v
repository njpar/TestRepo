//------------------------------------------------------------------------------
// Title      : Top-level Transceiver GT wrapper for Ethernet
// Project    : QSGMII LogiCORE
// File       : quadsgmii_0_TEST_transceiver.v
// Author     : Xilinx
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
// Description:  This is the top-level Transceiver GT wrapper. It
//               instantiates the lower-level wrappers produced by
//               the Series-7 FPGA Transceiver GT Wrapper Wizard.
//------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module quadsgmii_0_TEST_transceiver (
   input            encommaalign,
   input            powerdown,
   input            independent_clock_bufg,
   input            data_valid,
   input            usrclk,
   input            usrclk2,
   input            rxusrclk,
   input            rxusrclk2,
   input            mgt_tx_reset,
   input     [31:0] txdata,
   input     [3:0]  txchardispmode,
   input     [3:0]  txchardispval,
   input     [3:0]  txcharisk,
   input            mgt_rx_reset,
   output    [3:0]  rxchariscomma,
   output    [3:0]  rxcharisk,
   output    [2:0]  rxclkcorcnt,
   output    [31:0] rxdata,
   output    [3:0]  rxdisperr,
   output    [3:0]  rxnotintable,
   output    [3:0]  rxrundisp,
   output reg       txbuferr,
   output           plllkdet,
   output           txoutclk,
   output           rxoutclk,
   output           rxelecidle,
   output           txn,
   output           txp,
   input            rxn,
   input            rxp,
   input            gtrefclk,
   input            pmareset,
   output           resetdone,
   input            gt0_txpmareset_in,
   input            gt0_txpcsreset_in,
   input            gt0_rxpmareset_in,
   input            gt0_rxpcsreset_in,
   output           gt0_rxpmaresetdone_out,
   output  [1:0]    gt0_txbufstatus_out,
   output  [2:0]    gt0_rxbufstatus_out,
   input            gt0_rxbufreset_in,
   output  [15:0]   gt0_dmonitorout_out,
   output           gt0_powergood_out,
   output           gt0_cplllock_out,
   output           gt0_rxbyteisaligned_out,
   output           gt0_rxbyterealign_out,
   output           gt0_rxcommadet_out,
   input            gt0_txpolarity_in,
   input   [4:0]    gt0_txdiffctrl_in,
   input            gt0_txinhibit_in,
   input   [15:0]   gt0_pcsrsvdin_in,
   input   [4:0]    gt0_txpostcursor_in,
   input   [4:0]    gt0_txprecursor_in,
   input            gt0_rxpolarity_in,
   input            gt0_rxdfelpmreset_in,
   input            gt0_rxdfeagcovrden_in,
   input            gt0_rxlpmen_in,
   input   [2:0]    gt0_txprbssel_in,
   input            gt0_txprbsforceerr_in,
   input            gt0_rxprbscntreset_in,
   output           gt0_rxprbserr_out,
   input   [2:0]    gt0_rxprbssel_in,
   input   [2:0]    gt0_loopback_in,
   output           gt0_txresetdone_out,
   output           gt0_rxresetdone_out,
   input            gt0_eyescanreset_in,
   output           gt0_eyescandataerror_out,
   input            gt0_eyescantrigger_in,
   input   [2:0]    gt0_rxrate_in,
   input            gt0_rxcdrhold_in,
   output           gt0_rxratedone_out,
   output  [7:0]    gt0_rxmonitorout_out,
   input   [1:0]    gt0_rxmonitorsel_in,
   input   [9:0]    gt0_drpaddr_in,
   input            gt0_drpclk_in,
   input   [15:0]   gt0_drpdi_in,
   output  [15:0]   gt0_drpdo_out,
   input            gt0_drpen_in,
   output           gt0_drprdy_out,
   input            gt0_drpwe_in

);


  //----------------------------------------------------------------------------
  // Signal declarations
  //----------------------------------------------------------------------------

   wire             cplllock;

   wire      [1:0]  txbufstatus;
   reg       [1:0]  txbufstatus_reg;

   reg              data_valid_reg;
   wire             data_valid_reg2;

   // Signals for GT data reception
   wire             encommaalign_rec;

   wire       [1:0] powerdown_int;

//GT_WIRES START
  wire [0 : 0] cplllock_out;
  wire [15 : 0] dmonitorout_out;
  wire [9 : 0] drpaddr_in;
  wire [0 : 0] drpclk_in;
  wire [15 : 0] drpdi_in;
  wire [15 : 0] drpdo_out;
  wire [0 : 0] drpen_in;
  wire [0 : 0] drprdy_out;
  wire [0 : 0] drpwe_in;
  wire [0 : 0] eyescandataerror_out;
  wire [0 : 0] eyescanreset_in;
  wire [0 : 0] eyescantrigger_in;
  wire [0 : 0] gthrxn_in;
  wire [0 : 0] gthrxp_in;
  wire [0 : 0] gthtxn_out;
  wire [0 : 0] gthtxp_out;
  wire [0 : 0] gtpowergood_out;
  wire [0 : 0] gtrefclk0_in;
  wire [0 : 0] gtwiz_reset_all_in;
  wire [0 : 0] gtwiz_reset_clk_freerun_in;
  wire [0 : 0] gtwiz_reset_rx_cdr_stable_out;
  wire [0 : 0] gtwiz_reset_rx_datapath_in;
  wire [0 : 0] gtwiz_reset_rx_done_out;
  wire [0 : 0] gtwiz_reset_rx_pll_and_datapath_in;
  wire [0 : 0] gtwiz_reset_tx_datapath_in;
  wire [0 : 0] gtwiz_reset_tx_done_out;
  wire [0 : 0] gtwiz_reset_tx_pll_and_datapath_in;
  wire [0 : 0] gtwiz_userclk_rx_active_in;
  wire [0 : 0] gtwiz_userclk_tx_active_in;
  wire [0 : 0] gtwiz_userclk_tx_reset_in;
  wire [31 : 0] gtwiz_userdata_rx_out;
  wire [31 : 0] gtwiz_userdata_tx_in;
  wire [2 : 0] loopback_in;
  wire [15 : 0] pcsrsvdin_in;
  wire [0 : 0] rx8b10ben_in;
  wire [0 : 0] rxbufreset_in;
  wire [2 : 0] rxbufstatus_out;
  wire [0 : 0] rxbyteisaligned_out;
  wire [0 : 0] rxbyterealign_out;
  wire [0 : 0] rxcdrhold_in;
  wire [0 : 0] rxcommadet_out;
  wire [0 : 0] rxcommadeten_in;
  wire [15 : 0] rxctrl0_out;
  wire [15 : 0] rxctrl1_out;
  wire [7 : 0] rxctrl2_out;
  wire [7 : 0] rxctrl3_out;
  wire [0 : 0] rxdfeagcovrden_in;
  wire [0 : 0] rxdfelpmreset_in;
  wire [0 : 0] rxlpmen_in;
  wire [0 : 0] rxmcommaalignen_in;
  wire [7 : 0] rxmonitorout_out;
  wire [1 : 0] rxmonitorsel_in;
  wire [0 : 0] rxoutclk_out;
  wire [0 : 0] rxpcommaalignen_in;
  wire [0 : 0] rxpcsreset_in;
  wire [1 : 0] rxpd_in;
  wire [0 : 0] rxpmareset_in;
  wire [0 : 0] rxpmaresetdone_out;
  wire [0 : 0] rxpolarity_in;
  wire [0 : 0] rxprbscntreset_in;
  wire [0 : 0] rxprbserr_out;
  wire [3 : 0] rxprbssel_in;
  wire [2 : 0] rxrate_in;
  wire [0 : 0] rxratedone_out;
  wire [0 : 0] rxresetdone_out;
  wire [0 : 0] rxusrclk2_in;
  wire [0 : 0] rxusrclk_in;
  wire [0 : 0] tx8b10ben_in;
  wire [1 : 0] txbufstatus_out;
  wire [15 : 0] txctrl0_in;
  wire [15 : 0] txctrl1_in;
  wire [7 : 0] txctrl2_in;
  wire [4 : 0] txdiffctrl_in;
  wire [0 : 0] txelecidle_in;
  wire [0 : 0] txinhibit_in;
  wire [0 : 0] txoutclk_out;
  wire [2 : 0] txoutclksel_in;
  wire [0 : 0] txpcsreset_in;
  wire [1 : 0] txpd_in;
  wire [0 : 0] txpmareset_in;
  wire [0 : 0] txpmaresetdone_out;
  wire [0 : 0] txpolarity_in;
  wire [4 : 0] txpostcursor_in;
  wire [0 : 0] txprbsforceerr_in;
  wire [3 : 0] txprbssel_in;
  wire [4 : 0] txprecursor_in;
  wire [0 : 0] txresetdone_out;
  wire [0 : 0] txusrclk2_in;
  wire [0 : 0] txusrclk_in;


//GT_WIRES END 

   assign powerdown_int = {2{powerdown}};

   //---------------------------------------------------------------------------
   // The core works from a 125MHz clock source from USERCLK2, the GT transceiver fabric
   // interface works from a 125MHz clock source USERCLK.
   //---------------------------------------------------------------------------

  // Reclock encommaalign
  quadsgmii_0_TEST_reset_sync rxrecclk_encommaalign (
     .clk       (rxusrclk2),
     .reset_in  (encommaalign),
     .reset_out (encommaalign_rec)
  );


   //---------------------------------------------------------------------------
   // The core works from a 125MHz clock source userclk2, the GT transceiver fabric
   // interface works from a 125MHz clock source. 
   //---------------------------------------------------------------------------

   // Cross the clock domain
   always @(posedge usrclk2)
   begin
     txbufstatus_reg    <= txbufstatus;
   end

assign  gt0_txbufstatus_out = txbufstatus;

assign  gtwiz_userclk_tx_active_in = 1'b1;
assign  gtwiz_userclk_rx_active_in = gtwiz_reset_rx_cdr_stable_out;
assign  gtwiz_userclk_tx_reset_in  = 1'b0;
assign  gtwiz_reset_clk_freerun_in = gt0_drpclk_in;
assign  gtwiz_reset_all_in = pmareset;
assign  gtwiz_reset_tx_pll_and_datapath_in  = 1'b0; 
assign  gtwiz_reset_tx_datapath_in  = mgt_tx_reset & gtwiz_reset_tx_done_out;
assign  gtwiz_reset_rx_pll_and_datapath_in  =   1'b0;
assign  gtwiz_reset_rx_datapath_in  =  mgt_rx_reset & gtwiz_reset_rx_done_out;
assign  gthrxn_in[0]  = rxn  ;
assign  gthrxp_in[0]  = rxp  ;
assign  gtrefclk0_in[0]  = gtrefclk  ;
assign  loopback_in  =   gt0_loopback_in  ;
assign  rx8b10ben_in  = 1'b1  ;
assign  rxcommadeten_in  = 1'b1  ;
assign  rxmcommaalignen_in  = encommaalign_rec  ;
assign  rxpcommaalignen_in  = encommaalign_rec  ;
assign  rxpd_in  =   powerdown_int;
assign  rxusrclk_in  = rxusrclk  ;
assign  rxusrclk2_in  = rxusrclk2  ;
assign  tx8b10ben_in  = 1'b1  ;
assign  txdiffctrl_in  =  gt0_txdiffctrl_in ;
assign  txinhibit_in  =  gt0_txinhibit_in ;
assign  pcsrsvdin_in  = gt0_pcsrsvdin_in;
assign  txctrl0_in[3:0]  =  txchardispval ;
assign  txctrl1_in[3:0]  =  txchardispmode ;
assign  txctrl2_in[3:0]  =  txcharisk ;
assign  txctrl0_in[15:4]  =  12'b0 ;
assign  txctrl1_in[15:4]  =  12'b0 ;
assign  txctrl2_in[7:4]  =   4'b0;
assign  gtwiz_userdata_tx_in   = txdata  ;
assign  txelecidle_in  = powerdown_int[0]   ;
assign  txpd_in  = powerdown_int  ;
assign  txusrclk_in  =  usrclk ;
assign  txusrclk2_in  =  usrclk ;
assign  cplllock  =  cplllock_out ;
assign  gt0_cplllock_out     = cplllock;
assign  txn  =  gthtxn_out[0]     ;
assign  txp  =  gthtxp_out[0]     ;
assign  txbufstatus  =  txbufstatus_out     ;
assign  gt0_rxbufstatus_out   = rxbufstatus_out;
assign  rxbufreset_in         = gt0_rxbufreset_in;
assign rxcharisk   =  rxctrl0_out[3:0]     ;
assign rxdisperr   =  rxctrl1_out[3:0]     ;
assign rxchariscomma  =  rxctrl2_out[3:0]     ;
assign rxnotintable   =  rxctrl3_out[3:0]     ;
assign rxdata  =  gtwiz_userdata_rx_out     ;
assign rxoutclk   =  rxoutclk_out     ;
assign txoutclk   =  txoutclk_out  ;
assign txoutclksel_in = 3'b011;
// Report overall status for both transmitter and receiver reset done signals
assign resetdone = gtwiz_reset_tx_done_out & gtwiz_reset_rx_done_out;
assign  gt0_rxbyteisaligned_out  = rxbyteisaligned_out ;
assign  gt0_rxbyterealign_out    = rxbyterealign_out  ;
assign  gt0_rxcommadet_out       = rxcommadet_out ;
assign txpolarity_in        =  gt0_txpolarity_in      ;    
assign txpostcursor_in      =  gt0_txpostcursor_in    ;    
assign txprecursor_in       =  gt0_txprecursor_in     ;    
assign rxpolarity_in        =  gt0_rxpolarity_in      ;    
assign rxdfelpmreset_in     =  gt0_rxdfelpmreset_in   ;    
assign rxdfeagcovrden_in    =  gt0_rxdfeagcovrden_in  ;    
assign rxlpmen_in           =  gt0_rxlpmen_in         ;    
assign txprbssel_in[2:0]         =  gt0_txprbssel_in       ;    
assign txprbsforceerr_in    =  gt0_txprbsforceerr_in  ;    
assign rxprbscntreset_in    =  gt0_rxprbscntreset_in  ;    
assign gt0_rxprbserr_out        =  rxprbserr_out      ;    
assign rxprbssel_in[2:0]         =  gt0_rxprbssel_in       ;    
assign rxprbssel_in[3] = 1'b0;
assign txprbssel_in[3] = 1'b0;
assign gt0_txresetdone_out      =  txresetdone_out    ;    
assign gt0_rxresetdone_out      =  rxresetdone_out    ;    
assign eyescanreset_in      =  gt0_eyescanreset_in    ;    
assign gt0_eyescandataerror_out =  eyescandataerror_out;   
assign eyescantrigger_in    =  gt0_eyescantrigger_in  ;    
assign rxrate_in            =  gt0_rxrate_in          ;
assign rxcdrhold_in         =  gt0_rxcdrhold_in       ;    
assign gt0_rxratedone_out   = rxratedone_out;
assign gt0_rxmonitorout_out     =  rxmonitorout_out   ;    
assign rxmonitorsel_in      =  gt0_rxmonitorsel_in    ;   
assign txpmareset_in       = gt0_txpmareset_in ;
assign txpcsreset_in       = gt0_txpcsreset_in ;
assign rxpmareset_in       = gt0_rxpmareset_in ;
assign rxpcsreset_in       = gt0_rxpcsreset_in ;
assign gt0_rxpmaresetdone_out = rxpmaresetdone_out ;
assign gt0_dmonitorout_out  = dmonitorout_out;
assign gt0_powergood_out    = gtpowergood_out;

 assign drpaddr_in        =  gt0_drpaddr_in           ;
 assign drpclk_in         =  gt0_drpclk_in            ;
 assign drpdi_in          =  gt0_drpdi_in            ;
 assign gt0_drpdo_out     =  drpdo_out           ;
 assign drpen_in          =  gt0_drpen_in             ;
 assign gt0_drprdy_out    =  drprdy_out           ;
 assign drpwe_in          =  gt0_drpwe_in             ;    
  quadsgmii_0_TEST_gt quadsgmii_0_TEST_gt_i
  (
   .cplllock_out(cplllock_out),
   .dmonitorout_out(dmonitorout_out),
   .drpaddr_in(drpaddr_in),
   .drpclk_in(drpclk_in),
   .drpdi_in(drpdi_in),
   .drpdo_out(drpdo_out),
   .drpen_in(drpen_in),
   .drprdy_out(drprdy_out),
   .drpwe_in(drpwe_in),
   .eyescandataerror_out(eyescandataerror_out),
   .eyescanreset_in(eyescanreset_in),
   .eyescantrigger_in(eyescantrigger_in),
   .gthrxn_in(gthrxn_in),
   .gthrxp_in(gthrxp_in),
   .gthtxn_out(gthtxn_out),
   .gthtxp_out(gthtxp_out),
   .gtpowergood_out(gtpowergood_out),
   .gtrefclk0_in(gtrefclk0_in),
   .gtwiz_reset_all_in(gtwiz_reset_all_in),
   .gtwiz_reset_clk_freerun_in(gtwiz_reset_clk_freerun_in),
   .gtwiz_reset_rx_cdr_stable_out(gtwiz_reset_rx_cdr_stable_out),
   .gtwiz_reset_rx_datapath_in(gtwiz_reset_rx_datapath_in),
   .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done_out),
   .gtwiz_reset_rx_pll_and_datapath_in(gtwiz_reset_rx_pll_and_datapath_in),
   .gtwiz_reset_tx_datapath_in(gtwiz_reset_tx_datapath_in),
   .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done_out),
   .gtwiz_reset_tx_pll_and_datapath_in(gtwiz_reset_tx_pll_and_datapath_in),
   .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
   .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
   .gtwiz_userclk_tx_reset_in(gtwiz_userclk_tx_reset_in),
   .gtwiz_userdata_rx_out(gtwiz_userdata_rx_out),
   .gtwiz_userdata_tx_in(gtwiz_userdata_tx_in),
   .loopback_in(loopback_in),
   .pcsrsvdin_in(pcsrsvdin_in),
   .rx8b10ben_in(rx8b10ben_in),
   .rxbufreset_in(rxbufreset_in),
   .rxbufstatus_out(rxbufstatus_out),
   .rxbyteisaligned_out(rxbyteisaligned_out),
   .rxbyterealign_out(rxbyterealign_out),
   .rxcdrhold_in(rxcdrhold_in),
   .rxcommadet_out(rxcommadet_out),
   .rxcommadeten_in(rxcommadeten_in),
   .rxctrl0_out(rxctrl0_out),
   .rxctrl1_out(rxctrl1_out),
   .rxctrl2_out(rxctrl2_out),
   .rxctrl3_out(rxctrl3_out),
   .rxdfeagcovrden_in(rxdfeagcovrden_in),
   .rxdfelpmreset_in(rxdfelpmreset_in),
   .rxlpmen_in(rxlpmen_in),
   .rxmcommaalignen_in(rxmcommaalignen_in),
   .rxmonitorout_out(rxmonitorout_out),
   .rxmonitorsel_in(rxmonitorsel_in),
   .rxoutclk_out(rxoutclk_out),
   .rxpcommaalignen_in(rxpcommaalignen_in),
   .rxpcsreset_in(rxpcsreset_in),
   .rxpd_in(rxpd_in),
   .rxpmareset_in(rxpmareset_in),
   .rxpmaresetdone_out(rxpmaresetdone_out),
   .rxpolarity_in(rxpolarity_in),
   .rxprbscntreset_in(rxprbscntreset_in),
   .rxprbserr_out(rxprbserr_out),
   .rxprbssel_in(rxprbssel_in),
   .rxrate_in(rxrate_in),
   .rxratedone_out(rxratedone_out),
   .rxresetdone_out(rxresetdone_out),
   .rxusrclk2_in(rxusrclk2_in),
   .rxusrclk_in(rxusrclk_in),
   .tx8b10ben_in(tx8b10ben_in),
   .txbufstatus_out(txbufstatus_out),
   .txctrl0_in(txctrl0_in),
   .txctrl1_in(txctrl1_in),
   .txctrl2_in(txctrl2_in),
   .txdiffctrl_in(txdiffctrl_in),
   .txelecidle_in(txelecidle_in),
   .txinhibit_in(txinhibit_in),
   .txoutclk_out(txoutclk_out),
   .txoutclksel_in(txoutclksel_in),
   .txpcsreset_in(txpcsreset_in),
   .txpd_in(txpd_in),
   .txpmareset_in(txpmareset_in),
   .txpmaresetdone_out(txpmaresetdone_out),
   .txpolarity_in(txpolarity_in),
   .txpostcursor_in(txpostcursor_in),
   .txprbsforceerr_in(txprbsforceerr_in),
   .txprbssel_in(txprbssel_in),
   .txprecursor_in(txprecursor_in),
   .txresetdone_out(txresetdone_out),
   .txusrclk2_in(txusrclk2_in),
   .txusrclk_in(txusrclk_in)
  );


   //---------------------------------------------------------------------------
   // Instantiation of the FPGA Fabric Receiver Elastic Buffer
   // connected to the Transceiver
   //---------------------------------------------------------------------------


    assign rxrundisp   = 4'b0000;
    assign rxelecidle  = 1'b0;
    assign rxclkcorcnt = 3'b000;


   // Output the PLL locked status
   assign plllkdet = cplllock;


   // Decode the GT transceiver buffer status signals
  always @(posedge usrclk2)
  begin
    txbuferr    <= txbufstatus_reg[1];
  end

endmodule
