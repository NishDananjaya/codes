module assignment_01_testbench;

localparam N = 4;
logic [N-1:0] A,B;
logic ci,SEL;
logic [N:0] out;


assignment_01 #(.N(N)) dut
(
    .A(A),
    .B(B),
    .ci(ci),
    .SEL(SEL),
    .out(out)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dut);

    //test case 01
    #10 A<=4'd1; B<=4'd2; ci<=1'b0; SEL<=1;

    //test case 02
    #10 A<=4'd3; B<=4'd4; ci<=1'b1; SEL<=1;

    //test case 03
    #10 A<=4'd5; B<=4'd6; ci<=0'b0; SEL<=1;

    //test case 04
    #10 A<=4'd7; B<=4'd8; ci<=1'b1; SEL<=1;

    //test case 05
    #10 A<=4'd9; B<=4'd10; ci<=1'b0; SEL<=1;

    //test case 06
    #10 A<=4'd11; B<=4'd12; ci<=1'b1; SEL<=0;

    #10 $finish;
end

endmodule
