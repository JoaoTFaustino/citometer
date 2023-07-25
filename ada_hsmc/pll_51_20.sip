set_global_assignment -entity "pll_51_20" -library "lib_pll_51_20" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_51_20" -library "lib_pll_51_20" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "pll_51_20" -library "lib_pll_51_20" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_51_20" -name SPD_FILE [file join $::quartus(sip_path) "pll_51_20.spd"]

set_global_assignment -library "lib_pll_51_20" -name MISC_FILE [file join $::quartus(sip_path) "pll_51_20_sim/pll_51_20.vo"]
