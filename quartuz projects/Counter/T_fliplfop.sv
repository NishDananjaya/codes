module T_flipflop
(
    input logic T, rstn, clk,
    output logic Q
);

    always_ff @(negedge clk or negedge rstn) begin
        if (!rstn)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
endmodule

module T_flipflop_tb;

    logic T, rstn, clk;
    logic Q;

    T_flipflop dut(.*);  // Connect signals explicitly

    localparam clk_period = 10;

    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;
        T = 0;

        // Release reset after a short delay
        #5 rstn = 1;

        // Clock generation
        forever #(clk_period/2) clk = ~clk; 
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);

        // Test sequence
        #10 T = 1;  // Set T to 1
        #25 T = 0;  // Reset T
        #10 T = 1;  // Set T to 1 again
        
        #100 $finish;  // End simulation
    end
endmodule
