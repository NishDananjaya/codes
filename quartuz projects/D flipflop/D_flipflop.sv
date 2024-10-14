module D_flipflop
(
	input logic D,clk,
	output logic Q
);

	always_ff @(posedge clk) begin
		Q <= D;
	end
	
endmodule

module D_flipflop_tb;

logic D,Q;
logic clk = 0;

D_flipflop dut(.*);

localparam clk_period = 10;
initial begin 
	forever #(clk_period/2) clk <= ~clk;
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0,dut);
	
	#1 D <= 0;
	#25 D <= 1;
	
	#100 $finish();
	
end

endmodule


	


