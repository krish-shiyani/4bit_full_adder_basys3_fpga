// ============================================================
// File    : fulladd.v
// Module  : fulladd
// ============================================================

`timescale 1ns / 1ps  // Time unit: 1ns | Time precision: 1ps

module fulladd(sum, c_out, a, b, c_in);

    // Port Declarations
    output sum;
    output c_out;
    input  a;
    input  b;
    input  c_in;

    // Internal wires
    wire s1; // Intermediate XOR of a and b
    wire c1; // Carry from a AND b
    wire c2; // Carry from s1 AND c_in

    // Gate-Level Logic
    xor (s1,    a,  b);
    and (c1,    a,  b);
    xor (sum,  s1,  c_in);
    and (c2,   s1,  c_in);
    or  (c_out, c2, c1);

endmodule