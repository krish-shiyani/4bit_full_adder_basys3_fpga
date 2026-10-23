// ============================================================
// File    : testbench.v
// Module  : testbench
// ============================================================
`timescale 1ns / 1ps  // Time unit: 1ns | Time precision: 1ps

module testbench;

    // Testbench Inputs (reg — driven by initial block)
    reg [3:0] A;
    reg [3:0] B;
    reg       C_IN;

    // Testbench Outputs (wire — driven by DUT)
    wire [3:0] SUM;
    wire       C_OUT;

    // Instantiate DUT (Device Under Test)
    // Port order: sum, c_out, a, b, c_in
    fulladd4 FA_4 (SUM, C_OUT, A, B, C_IN);

    // Monitor Block — prints output whenever any signal changes
    initial begin
        $monitor ($time, "  A=%b  B=%b  C_IN=%b  |  SUM=%b  C_OUT=%b\n",
                  A, B, C_IN, SUM, C_OUT);
    end

    // Stimulus Block — apply test vectors with 5ns intervals
    initial begin

        A = 4'd0;  B = 4'd0;  C_IN = 1'b0;

        #5 A = 4'd3;  B = 4'd4;
        #5 A = 4'd2;  B = 4'd5;
        #5 A = 4'd9;  B = 4'd9;
        #5 A = 4'd10; B = 4'd15;
        #5 A = 4'd10; B = 4'd5;  C_IN = 1'b1;

        #5; // Wait for last output to settle before finishing
    end

endmodule
