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

-- IP VLNV: xilinx.com:ip:picxo_fracxo:1.0
-- IP Revision: 0

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY picxo;
USE picxo.picxo_top_wrapper;

ENTITY picxo_fracxo_0 IS
  PORT (
    RESET_I : IN STD_LOGIC;
    REF_CLK_I : IN STD_LOGIC;
    TXOUTCLK_I : IN STD_LOGIC;
    RSIGCE_I : IN STD_LOGIC;
    VSIGCE_I : IN STD_LOGIC;
    VSIGCE_O : OUT STD_LOGIC;
    ACC_STEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    G1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    G2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    R : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    V : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CE_DSP_RATE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    C_I : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    P_I : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    N_I : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    OFFSET_PPM : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
    OFFSET_EN : IN STD_LOGIC;
    DON_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ACC_DATA : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    ERROR_O : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    VOLT_O : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    CE_PI_O : OUT STD_LOGIC;
    CE_PI2_O : OUT STD_LOGIC;
    CE_DSP_O : OUT STD_LOGIC;
    OVF_PD : OUT STD_LOGIC;
    OVF_AB : OUT STD_LOGIC;
    OVF_VOLT : OUT STD_LOGIC;
    OVF_INT : OUT STD_LOGIC
  );
END picxo_fracxo_0;

ARCHITECTURE picxo_fracxo_0_arch OF picxo_fracxo_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF picxo_fracxo_0_arch: ARCHITECTURE IS "yes";
  COMPONENT picxo_top_wrapper IS
    GENERIC (
      MODE : STRING;
      GT_TYPE : STRING;
      CLOCK_REGION : STRING;
      C_FAMILY : STRING
    );
    PORT (
      RESET_I : IN STD_LOGIC;
      REF_CLK_I : IN STD_LOGIC;
      TXOUTCLK_I : IN STD_LOGIC;
      DRPEN_O : OUT STD_LOGIC;
      DRPWEN_O : OUT STD_LOGIC;
      DRPDO_I : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      DRPDATA_O : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DRPADDR_O : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      DRPRDY_I : IN STD_LOGIC;
      RSIGCE_I : IN STD_LOGIC;
      VSIGCE_I : IN STD_LOGIC;
      VSIGCE_O : OUT STD_LOGIC;
      ACC_STEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      G1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      G2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      R : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      V : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CE_DSP_RATE : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      C_I : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      P_I : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      N_I : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      OFFSET_PPM : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
      OFFSET_EN : IN STD_LOGIC;
      HOLD : IN STD_LOGIC;
      DON_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      DRP_USER_REQ_I : IN STD_LOGIC;
      DRP_USER_DONE_I : IN STD_LOGIC;
      DRPEN_USER_I : IN STD_LOGIC;
      DRPWEN_USER_I : IN STD_LOGIC;
      DRPADDR_USER_I : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      DRPDATA_USER_I : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      DRPDATA_USER_O : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DRPRDY_USER_O : OUT STD_LOGIC;
      DRPBUSY_O : OUT STD_LOGIC;
      ACC_DATA : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      SDM_COARSE_I : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      SDM_DATA_O : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
      SDM_TOGGLE_O : OUT STD_LOGIC;
      ERROR_O : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      VOLT_O : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      DRPDATA_SHORT_O : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      CE_PI_O : OUT STD_LOGIC;
      CE_PI2_O : OUT STD_LOGIC;
      CE_DSP_O : OUT STD_LOGIC;
      OVF_PD : OUT STD_LOGIC;
      OVF_AB : OUT STD_LOGIC;
      OVF_VOLT : OUT STD_LOGIC;
      OVF_INT : OUT STD_LOGIC
    );
  END COMPONENT picxo_top_wrapper;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF picxo_fracxo_0_arch: ARCHITECTURE IS "picxo_top_wrapper,Vivado 2019.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF picxo_fracxo_0_arch : ARCHITECTURE IS "picxo_fracxo_0,picxo_top_wrapper,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF picxo_fracxo_0_arch: ARCHITECTURE IS "picxo_fracxo_0,picxo_top_wrapper,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=picxo_fracxo,x_ipVersion=1.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,MODE=PICXO,GT_TYPE=GTH,CLOCK_REGION=X0Y0,C_FAMILY=zynquplus}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF TXOUTCLK_I: SIGNAL IS "XIL_INTERFACENAME TXOUTCLK_signal_clock, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF TXOUTCLK_I: SIGNAL IS "xilinx.com:signal:clock:1.0 TXOUTCLK_signal_clock CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF RESET_I: SIGNAL IS "XIL_INTERFACENAME RESET_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF RESET_I: SIGNAL IS "xilinx.com:signal:reset:1.0 RESET_signal_reset RST";
BEGIN
  U0 : picxo_top_wrapper
    GENERIC MAP (
      MODE => "PICXO",
      GT_TYPE => "GTH",
      CLOCK_REGION => "X0Y0",
      C_FAMILY => "zynquplus"
    )
    PORT MAP (
      RESET_I => RESET_I,
      REF_CLK_I => REF_CLK_I,
      TXOUTCLK_I => TXOUTCLK_I,
      DRPDO_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 16)),
      DRPRDY_I => '0',
      RSIGCE_I => RSIGCE_I,
      VSIGCE_I => VSIGCE_I,
      VSIGCE_O => VSIGCE_O,
      ACC_STEP => ACC_STEP,
      G1 => G1,
      G2 => G2,
      R => R,
      V => V,
      CE_DSP_RATE => CE_DSP_RATE,
      C_I => C_I,
      P_I => P_I,
      N_I => N_I,
      OFFSET_PPM => OFFSET_PPM,
      OFFSET_EN => OFFSET_EN,
      HOLD => '0',
      DON_I => DON_I,
      DRP_USER_REQ_I => '0',
      DRP_USER_DONE_I => '0',
      DRPEN_USER_I => '0',
      DRPWEN_USER_I => '0',
      DRPADDR_USER_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 9)),
      DRPDATA_USER_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 16)),
      ACC_DATA => ACC_DATA,
      SDM_COARSE_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 6)),
      ERROR_O => ERROR_O,
      VOLT_O => VOLT_O,
      CE_PI_O => CE_PI_O,
      CE_PI2_O => CE_PI2_O,
      CE_DSP_O => CE_DSP_O,
      OVF_PD => OVF_PD,
      OVF_AB => OVF_AB,
      OVF_VOLT => OVF_VOLT,
      OVF_INT => OVF_INT
    );
END picxo_fracxo_0_arch;
