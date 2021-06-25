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

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT picxo_fracxo_0
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
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : picxo_fracxo_0
  PORT MAP (
    RESET_I => RESET_I,
    REF_CLK_I => REF_CLK_I,
    TXOUTCLK_I => TXOUTCLK_I,
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
    DON_I => DON_I,
    ACC_DATA => ACC_DATA,
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
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file picxo_fracxo_0.vhd when simulating
-- the core, picxo_fracxo_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

