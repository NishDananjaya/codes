`timescale 1ns/1ps

module testbench;

    logic a, b, y;

    and_gate dut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $display("Time | a | b | y (a AND b)");
        $display("--------------------------");

        $dumpfile("and_gate_waveform.vcd");
        $dumpvars(0, testbench);

        a = 0; b = 0;
        #10 $display("%2t | %b | %b | %b", $time, a, b, y);

        a = 0; b = 1;
        #10 $display("%2t | %b | %b | %b", $time, a, b, y);
        
        a = 1; b = 0;
        #10 $display("%2t | %b | %b | %b", $time, a, b, y);
        
        a = 1; b = 1;
        #10 $display("%2t | %b | %b | %b", $time, a, b, y);

        $finish;
    end

endmodule