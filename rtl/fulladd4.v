// ============================================================
// File    : fulladd4.v
// Module  : fulladd4
// ============================================================
`timescale 1ns / 1ps  // Time unit: 1ns | Time precision: 1ps

module fulladd4(sum, c_out, a, b, c_in);

    // Port Declarations
    output [3:0] sum;
    output       c_out;
    input  [3:0] a, b;
    input        c_in;

    // Internal carry wires between stages
    wire c1; // Carry from bit-0 stage to bit-1 stage
    wire c2; // Carry from bit-1 stage to bit-2 stage
    wire c3; // Carry from bit-2 stage to bit-3 stage

    // Structural Instantiation — Ripple-Carry Chain
    fulladd fa0 (sum[0], c1,    a[0], b[0], c_in);
    fulladd fa1 (sum[1], c2,    a[1], b[1], c1);
    fulladd fa2 (sum[2], c3,    a[2], b[2], c2);
    fulladd fa3 (sum[3], c_out, a[3], b[3], c3);

endmodule