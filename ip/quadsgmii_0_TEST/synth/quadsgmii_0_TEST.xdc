
#***********************************************************
# The following constraints target the Transceiver Physical*
# Interface which is instantiated in the Example Design.   *
#***********************************************************

set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ */sync_rxresetdone_i/data_* } ] -filter { REF_PIN_NAME == D } ]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ */sync_txresetdone_i/data_* } ] -filter { REF_PIN_NAME == D } ]

set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *gen_*_reset*/reset_sync*} ]  -filter { name =~ *PRE } ]

#-----------------------------------------------------------
# PCS/PMA Clock period Constraints: please do not relax    -
#-----------------------------------------------------------
create_clock -period 8.000 [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ txoutclk_out* }]


## setting false path for RESET in gigpcspma
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *SYNC_*/data_sync* } ] -filter {REF_PIN_NAME == D }]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *GPCS_PMA_GEN_i*/MGT_RESET.RESET_INT_* } ] -filter {REF_PIN_NAME == PRE }]

## timing for MDIO interface
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter { name =~ */*MDIO_INTERFACE_*/MDIO_OUT_reg } ] -filter { REF_PIN_NAME == C } ]

#-----------------------------------------------------------
# Fabric Rx Elastic Buffer Timing Constraints:             -
#-----------------------------------------------------------

# Clock period for the recovered Rx clock
create_clock -period 8.000 [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ rxoutclk_out* }]


# setting false path for clock domain crossing from txoutclk to rxrecclkoutp
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *reclock_rxreset*/RESET_SYNC*} ]  -filter { name =~ *PRE } ]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *rxrecclk_encommaalign/reset_sync*} ]  -filter { name =~ *PRE } ]

# setting false path for clock domain crossing to txoutclk
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *reclock_reset*/RESET_SYNC*} ]  -filter { name =~ *PRE } ]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *SYNC_SOFT_RESET_RECCLK/reset_sync*} ]  -filter { name =~ *PRE } ]
set_false_path -from [get_pins -of [get_cells -hier -filter { name =~ *reclock_reset*/RESET_SYNC*} ]  -filter { name =~ *C } ] -to  [get_pins -of [get_cells -hier -filter { name =~ *SYNC_ASYNC_RESET_RECCLK/reset_sync*} ]  -filter { name =~ *PRE } ]

# Channel 0 Rx Elastic Buffer
#----------------------------------------------------------
# Identify clock domain crossing registers
# Control Gray Code delay and skew across clock boundary
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I0/WR_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I0/WR_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I0/WR_ADDR_GRAY_reg[*]"}]
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I0/RD_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I0/RD_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I0/RD_ADDR_GRAY_reg[*]"}]

# Constrain between Distributed Memory (output data) and the 1st set of flip-flops
set_false_path -from [get_clocks -include_generated_clocks -of [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ rxoutclk_out* }]] -to  [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I0/GEN_FIFO[*].RD_DATA_reg* } ] -filter { name =~ *D } ]

# Channel 1 Rx Elastic Buffer
#----------------------------------------------------------
# Identify clock domain crossing registers
# Control Gray Code delay and skew across clock boundary
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I1/WR_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I1/WR_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I1/WR_ADDR_GRAY_reg[*]"}]
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I1/RD_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I1/RD_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I1/RD_ADDR_GRAY_reg[*]"}]

# Constrain between Distributed Memory (output data) and the 1st set of flip-flops
set_false_path -from [get_clocks -include_generated_clocks -of [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ rxoutclk_out* }]] -to  [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I1/GEN_FIFO[*].RD_DATA_reg* } ] -filter { name =~ *D } ]

# Channel 2 Rx Elastic Buffer
#----------------------------------------------------------
# Identify clock domain crossing registers
# Control Gray Code delay and skew across clock boundary
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I2/WR_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I2/WR_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I2/WR_ADDR_GRAY_reg[*]"}]
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I2/RD_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I2/RD_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I2/RD_ADDR_GRAY_reg[*]"}]

# Constrain between Distributed Memory (output data) and the 1st set of flip-flops
set_false_path -from [get_clocks -include_generated_clocks -of [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ rxoutclk_out* }]] -to  [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I2/GEN_FIFO[*].RD_DATA_reg* } ] -filter { name =~ *D } ]


# Channel 3 Rx Elastic Buffer
#----------------------------------------------------------
# Identify clock domain crossing registers
# Control Gray Code delay and skew across clock boundary
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I3/WR_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I3/WR_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I3/WR_ADDR_GRAY_reg[*]"}]
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I3/RD_ADDR_GRAY_reg[*] }] -filter { name =~ *C } ] -to [get_cells -of [all_fanout -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *RX_ELASTIC_BUFFER_I3/RD_ADDR_GRAY_reg[*]}] -filter {NAME =~ *Q}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*RX_ELASTIC_BUFFER_I3/RD_ADDR_GRAY_reg[*]"}]

# Constrain between Distributed Memory (output data) and the 1st set of flip-flops
set_false_path -from [get_clocks -include_generated_clocks -of [get_pins -of [get_cells -hier -filter { name =~ */transceiver_inst/quadsgmii_0_TEST_gt_i/inst } ] -filter { REF_PIN_NAME =~ rxoutclk_out* }]] -to  [get_pins -of [get_cells -hier -filter {name =~ *RX_ELASTIC_BUFFER_I3/GEN_FIFO[*].RD_DATA_reg* } ] -filter { name =~ *D } ]




