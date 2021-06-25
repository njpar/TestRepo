-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 25 08:37:08 2021
-- Host        : FM-B3P78C3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Noah.Parker/VivadoTest/TestRepo/ip/quadsgmii_0_TEST/quadsgmii_0_TEST_stub.vhdl
-- Design      : quadsgmii_0_TEST
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu19eg-ffve1924-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity quadsgmii_0_TEST is
  Port ( 
    reset : in STD_LOGIC;
    gtrefclk : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txoutclk : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    resetdone : out STD_LOGIC;
    userclk : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    rxuserclk : in STD_LOGIC;
    rxuserclk2 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    sgmii_clk_en_ch0 : out STD_LOGIC;
    gmii_txd_ch0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_ch0 : in STD_LOGIC;
    gmii_tx_er_ch0 : in STD_LOGIC;
    gmii_rxd_ch0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_ch0 : out STD_LOGIC;
    gmii_rx_er_ch0 : out STD_LOGIC;
    mdc_ch0 : in STD_LOGIC;
    mdio_i_ch0 : in STD_LOGIC;
    mdio_o_ch0 : out STD_LOGIC;
    mdio_t_ch0 : out STD_LOGIC;
    an_interrupt_ch0 : out STD_LOGIC;
    speed_is_10_100_ch0 : in STD_LOGIC;
    speed_is_100_ch0 : in STD_LOGIC;
    status_vector_ch0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sgmii_clk_en_ch1 : out STD_LOGIC;
    gmii_txd_ch1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_ch1 : in STD_LOGIC;
    gmii_tx_er_ch1 : in STD_LOGIC;
    gmii_rxd_ch1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_ch1 : out STD_LOGIC;
    gmii_rx_er_ch1 : out STD_LOGIC;
    mdc_ch1 : in STD_LOGIC;
    mdio_i_ch1 : in STD_LOGIC;
    mdio_o_ch1 : out STD_LOGIC;
    mdio_t_ch1 : out STD_LOGIC;
    an_interrupt_ch1 : out STD_LOGIC;
    speed_is_10_100_ch1 : in STD_LOGIC;
    speed_is_100_ch1 : in STD_LOGIC;
    status_vector_ch1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sgmii_clk_en_ch2 : out STD_LOGIC;
    gmii_txd_ch2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_ch2 : in STD_LOGIC;
    gmii_tx_er_ch2 : in STD_LOGIC;
    gmii_rxd_ch2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_ch2 : out STD_LOGIC;
    gmii_rx_er_ch2 : out STD_LOGIC;
    mdc_ch2 : in STD_LOGIC;
    mdio_i_ch2 : in STD_LOGIC;
    mdio_o_ch2 : out STD_LOGIC;
    mdio_t_ch2 : out STD_LOGIC;
    an_interrupt_ch2 : out STD_LOGIC;
    speed_is_10_100_ch2 : in STD_LOGIC;
    speed_is_100_ch2 : in STD_LOGIC;
    status_vector_ch2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sgmii_clk_en_ch3 : out STD_LOGIC;
    gmii_txd_ch3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_ch3 : in STD_LOGIC;
    gmii_tx_er_ch3 : in STD_LOGIC;
    gmii_rxd_ch3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_ch3 : out STD_LOGIC;
    gmii_rx_er_ch3 : out STD_LOGIC;
    mdc_ch3 : in STD_LOGIC;
    mdio_i_ch3 : in STD_LOGIC;
    mdio_o_ch3 : out STD_LOGIC;
    mdio_t_ch3 : out STD_LOGIC;
    an_interrupt_ch3 : out STD_LOGIC;
    speed_is_10_100_ch3 : in STD_LOGIC;
    speed_is_100_ch3 : in STD_LOGIC;
    status_vector_ch3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_powergood_out : out STD_LOGIC;
    independent_clock_bufgdiv4 : in STD_LOGIC;
    signal_detect : in STD_LOGIC
  );

end quadsgmii_0_TEST;

architecture stub of quadsgmii_0_TEST is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "reset,gtrefclk,txp,txn,rxp,rxn,txoutclk,rxoutclk,resetdone,userclk,userclk2,rxuserclk,rxuserclk2,independent_clock_bufg,pma_reset,mmcm_locked,sgmii_clk_en_ch0,gmii_txd_ch0[7:0],gmii_tx_en_ch0,gmii_tx_er_ch0,gmii_rxd_ch0[7:0],gmii_rx_dv_ch0,gmii_rx_er_ch0,mdc_ch0,mdio_i_ch0,mdio_o_ch0,mdio_t_ch0,an_interrupt_ch0,speed_is_10_100_ch0,speed_is_100_ch0,status_vector_ch0[15:0],sgmii_clk_en_ch1,gmii_txd_ch1[7:0],gmii_tx_en_ch1,gmii_tx_er_ch1,gmii_rxd_ch1[7:0],gmii_rx_dv_ch1,gmii_rx_er_ch1,mdc_ch1,mdio_i_ch1,mdio_o_ch1,mdio_t_ch1,an_interrupt_ch1,speed_is_10_100_ch1,speed_is_100_ch1,status_vector_ch1[15:0],sgmii_clk_en_ch2,gmii_txd_ch2[7:0],gmii_tx_en_ch2,gmii_tx_er_ch2,gmii_rxd_ch2[7:0],gmii_rx_dv_ch2,gmii_rx_er_ch2,mdc_ch2,mdio_i_ch2,mdio_o_ch2,mdio_t_ch2,an_interrupt_ch2,speed_is_10_100_ch2,speed_is_100_ch2,status_vector_ch2[15:0],sgmii_clk_en_ch3,gmii_txd_ch3[7:0],gmii_tx_en_ch3,gmii_tx_er_ch3,gmii_rxd_ch3[7:0],gmii_rx_dv_ch3,gmii_rx_er_ch3,mdc_ch3,mdio_i_ch3,mdio_o_ch3,mdio_t_ch3,an_interrupt_ch3,speed_is_10_100_ch3,speed_is_100_ch3,status_vector_ch3[15:0],gt_powergood_out,independent_clock_bufgdiv4,signal_detect";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "quadsgmii_v3_4_6,Vivado 2019.1";
begin
end;
