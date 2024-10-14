module D_latch 
(
	input logic D,en,
	output logic Q

);

	always_latch begin
		if (en) 
			Q <= D;
	end
	
endmodule

`timescale 1ns/1ps

module D_latch_tb;

logic D,en,Q;

D_latch dut(.*);

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0,dut);
	
	#10 D <= 1;
	#10 en <= 1;
	
	#30 en <= 0;
	
	#40 D<= 0;
	#50 en <= 1;
	
	#60 D <= 1;
	
	#100 $finish();
	
end

endmodule






