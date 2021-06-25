-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:quadsgmii:3.4
-- IP Revision: 6

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT quadsgmii_0_TEST
  PORT (
    reset : IN STD_LOGIC;
    signal_detect : IN STD_LOGIC;
    gtrefclk : IN STD_LOGIC;
    txn : OUT STD_LOGIC;
    txp : OUT STD_LOGIC;
    rxn : IN STD_LOGIC;
    rxp : IN STD_LOGIC;
    txoutclk : OUT STD_LOGIC;
    rxoutclk : OUT STD_LOGIC;
    resetdone : OUT STD_LOGIC;
    userclk : IN STD_LOGIC;
    userclk2 : IN STD_LOGIC;
    rxuserclk : IN STD_LOGIC;
    rxuserclk2 : IN STD_LOGIC;
    independent_clock_bufg : IN STD_LOGIC;
    pma_reset : IN STD_LOGIC;
    mmcm_locked : IN STD_LOGIC;
    sgmii_clk_en_ch0 : OUT STD_LOGIC;
    gmii_txd_ch0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en_ch0 : IN STD_LOGIC;
    gmii_tx_er_ch0 : IN STD_LOGIC;
    gmii_rxd_ch0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv_ch0 : OUT STD_LOGIC;
    gmii_rx_er_ch0 : OUT STD_LOGIC;
    mdc_ch0 : IN STD_LOGIC;
    mdio_i_ch0 : IN STD_LOGIC;
    mdio_o_ch0 : OUT STD_LOGIC;
    mdio_t_ch0 : OUT STD_LOGIC;
    an_interrupt_ch0 : OUT STD_LOGIC;
    speed_is_10_100_ch0 : IN STD_LOGIC;
    speed_is_100_ch0 : IN STD_LOGIC;
    status_vector_ch0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    sgmii_clk_en_ch1 : OUT STD_LOGIC;
    gmii_txd_ch1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en_ch1 : IN STD_LOGIC;
    gmii_tx_er_ch1 : IN STD_LOGIC;
    gmii_rxd_ch1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv_ch1 : OUT STD_LOGIC;
    gmii_rx_er_ch1 : OUT STD_LOGIC;
    mdc_ch1 : IN STD_LOGIC;
    mdio_i_ch1 : IN STD_LOGIC;
    mdio_o_ch1 : OUT STD_LOGIC;
    mdio_t_ch1 : OUT STD_LOGIC;
    an_interrupt_ch1 : OUT STD_LOGIC;
    speed_is_10_100_ch1 : IN STD_LOGIC;
    speed_is_100_ch1 : IN STD_LOGIC;
    status_vector_ch1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    sgmii_clk_en_ch2 : OUT STD_LOGIC;
    gmii_txd_ch2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en_ch2 : IN STD_LOGIC;
    gmii_tx_er_ch2 : IN STD_LOGIC;
    gmii_rxd_ch2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv_ch2 : OUT STD_LOGIC;
    gmii_rx_er_ch2 : OUT STD_LOGIC;
    mdc_ch2 : IN STD_LOGIC;
    mdio_i_ch2 : IN STD_LOGIC;
    mdio_o_ch2 : OUT STD_LOGIC;
    mdio_t_ch2 : OUT STD_LOGIC;
    an_interrupt_ch2 : OUT STD_LOGIC;
    speed_is_10_100_ch2 : IN STD_LOGIC;
    speed_is_100_ch2 : IN STD_LOGIC;
    status_vector_ch2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    sgmii_clk_en_ch3 : OUT STD_LOGIC;
    gmii_txd_ch3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en_ch3 : IN STD_LOGIC;
    gmii_tx_er_ch3 : IN STD_LOGIC;
    gmii_rxd_ch3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv_ch3 : OUT STD_LOGIC;
    gmii_rx_er_ch3 : OUT STD_LOGIC;
    mdc_ch3 : IN STD_LOGIC;
    mdio_i_ch3 : IN STD_LOGIC;
    mdio_o_ch3 : OUT STD_LOGIC;
    mdio_t_ch3 : OUT STD_LOGIC;
    an_interrupt_ch3 : OUT STD_LOGIC;
    speed_is_10_100_ch3 : IN STD_LOGIC;
    speed_is_100_ch3 : IN STD_LOGIC;
    status_vector_ch3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt_powergood_out : OUT STD_LOGIC;
    independent_clock_bufgdiv4 : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : quadsgmii_0_TEST
  PORT MAP (
    reset => reset,
    signal_detect => signal_detect,
    gtrefclk => gtrefclk,
    txn => txn,
    txp => txp,
    rxn => rxn,
    rxp => rxp,
    txoutclk => txoutclk,
    rxoutclk => rxoutclk,
    resetdone => resetdone,
    userclk => userclk,
    userclk2 => userclk2,
    rxuserclk => rxuserclk,
    rxuserclk2 => rxuserclk2,
    independent_clock_bufg => independent_clock_bufg,
    pma_reset => pma_reset,
    mmcm_locked => mmcm_locked,
    sgmii_clk_en_ch0 => sgmii_clk_en_ch0,
    gmii_txd_ch0 => gmii_txd_ch0,
    gmii_tx_en_ch0 => gmii_tx_en_ch0,
    gmii_tx_er_ch0 => gmii_tx_er_ch0,
    gmii_rxd_ch0 => gmii_rxd_ch0,
    gmii_rx_dv_ch0 => gmii_rx_dv_ch0,
    gmii_rx_er_ch0 => gmii_rx_er_ch0,
    mdc_ch0 => mdc_ch0,
    mdio_i_ch0 => mdio_i_ch0,
    mdio_o_ch0 => mdio_o_ch0,
    mdio_t_ch0 => mdio_t_ch0,
    an_interrupt_ch0 => an_interrupt_ch0,
    speed_is_10_100_ch0 => speed_is_10_100_ch0,
    speed_is_100_ch0 => speed_is_100_ch0,
    status_vector_ch0 => status_vector_ch0,
    sgmii_clk_en_ch1 => sgmii_clk_en_ch1,
    gmii_txd_ch1 => gmii_txd_ch1,
    gmii_tx_en_ch1 => gmii_tx_en_ch1,
    gmii_tx_er_ch1 => gmii_tx_er_ch1,
    gmii_rxd_ch1 => gmii_rxd_ch1,
    gmii_rx_dv_ch1 => gmii_rx_dv_ch1,
    gmii_rx_er_ch1 => gmii_rx_er_ch1,
    mdc_ch1 => mdc_ch1,
    mdio_i_ch1 => mdio_i_ch1,
    mdio_o_ch1 => mdio_o_ch1,
    mdio_t_ch1 => mdio_t_ch1,
    an_interrupt_ch1 => an_interrupt_ch1,
    speed_is_10_100_ch1 => speed_is_10_100_ch1,
    speed_is_100_ch1 => speed_is_100_ch1,
    status_vector_ch1 => status_vector_ch1,
    sgmii_clk_en_ch2 => sgmii_clk_en_ch2,
    gmii_txd_ch2 => gmii_txd_ch2,
    gmii_tx_en_ch2 => gmii_tx_en_ch2,
    gmii_tx_er_ch2 => gmii_tx_er_ch2,
    gmii_rxd_ch2 => gmii_rxd_ch2,
    gmii_rx_dv_ch2 => gmii_rx_dv_ch2,
    gmii_rx_er_ch2 => gmii_rx_er_ch2,
    mdc_ch2 => mdc_ch2,
    mdio_i_ch2 => mdio_i_ch2,
    mdio_o_ch2 => mdio_o_ch2,
    mdio_t_ch2 => mdio_t_ch2,
    an_interrupt_ch2 => an_interrupt_ch2,
    speed_is_10_100_ch2 => speed_is_10_100_ch2,
    speed_is_100_ch2 => speed_is_100_ch2,
    status_vector_ch2 => status_vector_ch2,
    sgmii_clk_en_ch3 => sgmii_clk_en_ch3,
    gmii_txd_ch3 => gmii_txd_ch3,
    gmii_tx_en_ch3 => gmii_tx_en_ch3,
    gmii_tx_er_ch3 => gmii_tx_er_ch3,
    gmii_rxd_ch3 => gmii_rxd_ch3,
    gmii_rx_dv_ch3 => gmii_rx_dv_ch3,
    gmii_rx_er_ch3 => gmii_rx_er_ch3,
    mdc_ch3 => mdc_ch3,
    mdio_i_ch3 => mdio_i_ch3,
    mdio_o_ch3 => mdio_o_ch3,
    mdio_t_ch3 => mdio_t_ch3,
    an_interrupt_ch3 => an_interrupt_ch3,
    speed_is_10_100_ch3 => speed_is_10_100_ch3,
    speed_is_100_ch3 => speed_is_100_ch3,
    status_vector_ch3 => status_vector_ch3,
    gt_powergood_out => gt_powergood_out,
    independent_clock_bufgdiv4 => independent_clock_bufgdiv4
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file quadsgmii_0_TEST.vhd when simulating
-- the core, quadsgmii_0_TEST. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

