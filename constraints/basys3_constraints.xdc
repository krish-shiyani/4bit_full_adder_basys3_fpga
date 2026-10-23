## ============================================================
## File    : basys3_constraints.xdc
## Project : 4-Bit Full Adder
## Author  : Krish Shiyani
## Date    : Oct 2026
## Board   : Digilent Basys3 (Artix-7 xc7a35tcpg236-1)
## Desc    : Pin constraints mapping design ports to physical
##           Basys3 board I/O.
##
## Pin Mapping Summary:
##   INPUTS  — Slide Switches (SW)
##     a[0..3]  → SW0..SW3   (pins V17, V16, W16, W17)
##     b[0..3]  → SW8..SW11  (pins V2,  T3,  T2,  R3 )
##     c_in     → SW12       (pin  R2)
##
##   OUTPUTS — LEDs (LD)
##     sum[0..3] → LD0..LD3  (pins U16, E19, U19, V19)
##     c_out     → LD4       (pin  U15)
##
## IO Standard: LVCMOS33 (3.3V logic) for all pins
## ============================================================

# ----------------------------------------------------------
# INPUTS — Slide Switches mapped to operand A (bits 0-3)
# Use SW0-SW3 on the Basys3 board
# ----------------------------------------------------------
set_property PACKAGE_PIN V17 [get_ports {a[0]}]         ;# SW0  -> a[0] (LSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN V16 [get_ports {a[1]}]         ;# SW1  -> a[1]
	set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN W16 [get_ports {a[2]}]         ;# SW2  -> a[2]
	set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property PACKAGE_PIN W17 [get_ports {a[3]}]         ;# SW3  -> a[3] (MSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]

# ----------------------------------------------------------
# INPUTS — Slide Switches mapped to operand B (bits 0-3)
# Use SW8-SW11 on the Basys3 board
# ----------------------------------------------------------
set_property PACKAGE_PIN V2 [get_ports {b[0]}]          ;# SW8  -> b[0] (LSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN T3 [get_ports {b[1]}]          ;# SW9  -> b[1]
	set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN T2 [get_ports {b[2]}]          ;# SW10 -> b[2]
	set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN R3 [get_ports {b[3]}]          ;# SW11 -> b[3] (MSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

# ----------------------------------------------------------
# INPUT — Carry-in (c_in)
# Use SW12 on the Basys3 board
# ----------------------------------------------------------
set_property PACKAGE_PIN R2 [get_ports {c_in}]          ;# SW12 -> c_in
    set_property IOSTANDARD LVCMOS33 [get_ports {c_in}]

# ----------------------------------------------------------
# OUTPUTS — LEDs mapped to sum (bits 0-3)
# LD0-LD3 light up to show the 4-bit addition result
# ----------------------------------------------------------
set_property PACKAGE_PIN U16 [get_ports {sum[0]}]       ;# LD0 -> sum[0] (LSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[0]}]
set_property PACKAGE_PIN E19 [get_ports {sum[1]}]       ;# LD1 -> sum[1]
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[1]}]
set_property PACKAGE_PIN U19 [get_ports {sum[2]}]       ;# LD2 -> sum[2]
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[2]}]
set_property PACKAGE_PIN V19 [get_ports {sum[3]}]       ;# LD3 -> sum[3] (MSB)
	set_property IOSTANDARD LVCMOS33 [get_ports {sum[3]}]

# ----------------------------------------------------------
# OUTPUT — Carry-out (c_out)
# LD4 lights up when result exceeds 4 bits (overflow)
# ----------------------------------------------------------
set_property PACKAGE_PIN U15 [get_ports {c_out}]        ;# LD4 -> c_out (overflow)
	set_property IOSTANDARD LVCMOS33 [get_ports {c_out}]
