# 🔢 4-Bit Full Adder — Basys3 FPGA (Xilinx Vivado)

A structural Verilog implementation of a **4-bit ripple-carry full adder** synthesized and deployed on the **Digilent Basys3 FPGA board** using **Xilinx Vivado 2025**.

---

## 📐 Project Architecture

```
fulladd4 (Top Module)
├── fulladd fa0  →  sum[0], carry c1
├── fulladd fa1  →  sum[1], carry c2
├── fulladd fa2  →  sum[2], carry c3
└── fulladd fa3  →  sum[3], carry c_out
```

Each `fulladd` is a **1-bit full adder** built from primitive gate instantiations (`xor`, `and`, `or`). Four are chained in a **ripple-carry** topology to form the 4-bit adder.

---

## 📁 Project Structure

```
4bit_full_adder_basys3_fpga/
│
├── rtl/
│   ├── fulladd.v         # 1-bit full adder (gate-level)
│   └── fulladd4.v        # 4-bit top module (structural)
│
├── sim/
│   └── testbench.v       # Simulation testbench
│
├── constraints/
│   └── basys3_constraints.xdc  # Pin assignments for Basys3
│
├── .gitignore            # Vivado-generated file exclusions
└── README.md             # This file
```

---

## ⚙️ Design Details

### 1-Bit Full Adder — [`fulladd.v`](rtl/fulladd.v)

| Port    | Direction | Width | Description           |
|---------|-----------|-------|-----------------------|
| `a`     | input     | 1-bit | Operand A             |
| `b`     | input     | 1-bit | Operand B             |
| `c_in`  | input     | 1-bit | Carry-in              |
| `sum`   | output    | 1-bit | Sum output            |
| `c_out` | output    | 1-bit | Carry-out             |

**Logic equations:**
```
s1    = a XOR b
sum   = s1 XOR c_in
c_out = (a AND b) OR (s1 AND c_in)
```

---

### 4-Bit Full Adder — [`fulladd4.v`](rtl/fulladd4.v)

| Port    | Direction | Width  | Description           |
|---------|-----------|--------|-----------------------|
| `a`     | input     | 4-bit  | Operand A             |
| `b`     | input     | 4-bit  | Operand B             |
| `c_in`  | input     | 1-bit  | Carry-in              |
| `sum`   | output    | 4-bit  | Sum output            |
| `c_out` | output    | 1-bit  | Final carry-out       |

---

## 🧪 Simulation

The testbench ([`sim/testbench.v`](sim/testbench.v)) covers the following test vectors:

| A    | B    | C_in | Expected SUM | Expected C_out |
|------|------|------|--------------|----------------|
| 0000 | 0000 |  0   | 0000         | 0              |
| 0011 | 0100 |  0   | 0111 (7)     | 0              |
| 0010 | 0101 |  0   | 0111 (7)     | 0              |
| 1001 | 1001 |  0   | 0010 (2)     | 1 (overflow)   |
| 1010 | 1111 |  0   | 1001 (9)     | 1 (overflow)   |
| 1010 | 0101 |  1   | 0000 (0)     | 1 (overflow)   |

### Running Simulation in Vivado
1. Open Vivado and create/load the project.
2. Add `rtl/fulladd.v`, `rtl/fulladd4.v` as design sources.
3. Add `sim/testbench.v` as a simulation source.
4. Click **Run Simulation → Run Behavioral Simulation**.
5. Observe waveforms and `$monitor` output in the Tcl console.

---

## 🔌 FPGA Pin Mapping (Basys3)

### Inputs — Slide Switches (SW)

| Signal  | Pin  | Switch |
|---------|------|--------|
| `a[0]`  | V17  | SW0    |
| `a[1]`  | V16  | SW1    |
| `a[2]`  | W16  | SW2    |
| `a[3]`  | W17  | SW3    |
| `b[0]`  | V2   | SW8    |
| `b[1]`  | T3   | SW9    |
| `b[2]`  | T2   | SW10   |
| `b[3]`  | R3   | SW11   |
| `c_in`  | R2   | SW12   |

### Outputs — LEDs (LD)

| Signal   | Pin  | LED   |
|----------|------|-------|
| `sum[0]` | U16  | LD0   |
| `sum[1]` | E19  | LD1   |
| `sum[2]` | U19  | LD2   |
| `sum[3]` | V19  | LD3   |
| `c_out`  | U15  | LD4   |

---

## 🚀 Synthesis & Implementation (Vivado)

1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd 4bit_full_adder_basys3_fpga
   ```
2. Open **Xilinx Vivado 2025**.
3. Create a new RTL project and target the **Basys3** board (`xc7a35tcpg236-1`).
4. Add RTL sources from `rtl/` and constraints from `constraints/`.
5. Run **Synthesis → Implementation → Generate Bitstream**.
6. Connect Basys3 via USB-JTAG and click **Program Device**.

---

## 🧰 Tools & Requirements

| Tool             | Version / Details              |
|------------------|-------------------------------|
| Xilinx Vivado    | 2025                          |
| Target Board     | Digilent Basys3 (Artix-7)     |
| FPGA Part        | xc7a35tcpg236-1               |
| HDL Standard     | Verilog (IEEE 1364)           |
| Timescale        | 1ns / 1ps                     |

---

## 📜 License

This project is open-source.

---

## 👤 Author

**Krish Shiyani**  
Verilog / FPGA enthusiast — Xilinx Vivado 2025  
