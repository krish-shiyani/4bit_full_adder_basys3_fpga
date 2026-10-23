// ============================================================
// File    : testbench_exhaustive.v
// Module  : testbench_exhaustiv
// ============================================================
`timescale 1ns / 1ps

module testbench_exhaustive;

    // DUT Inputs
    reg  [3:0] A;
    reg  [3:0] B;
    reg        C_IN;

    // DUT Outputs
    wire [3:0] SUM;
    wire       C_OUT;

    // Counters
    integer pass_count;
    integer fail_count;
    integer test_num;

    // Expected values (5-bit result: {C_OUT, SUM})
    reg [4:0] expected;

    // Instantiate DUT (Device Under Test)
    fulladd4 DUT (.sum(SUM), .c_out(C_OUT), .a(A), .b(B), .c_in(C_IN));

    // Main Test Block
    initial begin
        // Initialize
        pass_count = 0;
        fail_count = 0;
        test_num   = 0;
        A          = 4'd0;
        B          = 4'd0;
        C_IN       = 1'b0;

        $display("============================================");
        $display("  4-Bit Full Adder — Exhaustive Testbench  ");
        $display("  Testing all 512 input combinations...    ");
        $display("============================================");
        $display("Time | Test# | A    | B    | Cin | SUM  | Cout | Expected | Status");
        $display("-----|-------|------|------|-----|------|------|----------|-------");

        // Loop through all 512 combinations
        // A: 0-15, B: 0-15, C_IN: 0-1
        for (C_IN = 1'b0; C_IN <= 1'b1; C_IN = C_IN + 1'b1) begin
            for (A = 4'd0; A <= 4'd15; A = A + 4'd1) begin
                for (B = 4'd0; B <= 4'd15; B = B + 4'd1) begin

                    #10; // Wait for combinational logic to settle

                    test_num = test_num + 1;

                    // Compute expected result using 5-bit math
                    expected = A + B + C_IN;  // 5-bit result

                    // Check DUT output vs expected
                    if ({C_OUT, SUM} === expected) begin
                        pass_count = pass_count + 1;
                        $display("%4t | %5d | %04b | %04b |  %b  | %04b |  %b   |   %05b  | PASS ✓",
                                 $time, test_num, A, B, C_IN, SUM, C_OUT, expected);
                    end else begin
                        fail_count = fail_count + 1;
                        $display("%4t | %5d | %04b | %04b |  %b  | %04b |  %b   |   %05b  | FAIL ✗  <--- ERROR",
                                 $time, test_num, A, B, C_IN, SUM, C_OUT, expected);
                        $display("     >>> MISMATCH: Got {C_OUT,SUM}=%05b, Expected=%05b",
                                 {C_OUT, SUM}, expected);
                    end

                end // B loop
            end // A loop
        end // C_IN loop

        // Final Report
        $display("============================================");
        $display("  SIMULATION COMPLETE");
        $display("  Total Tests : %0d", test_num);
        $display("  PASSED      : %0d", pass_count);
        $display("  FAILED      : %0d", fail_count);
        if (fail_count == 0)
            $display("  RESULT      : ALL TESTS PASSED! Design is CORRECT.");
        else
            $display("  RESULT      : %0d TEST(S) FAILED! Review errors above.", fail_count);
        $display("============================================");

        $finish;  // Formally end simulation
    end

    // Timeout watchdog — kills simulation if it hangs
    initial begin
        #100000;
        $display("TIMEOUT: Simulation exceeded time limit!");
        $finish;
    end

endmodule

