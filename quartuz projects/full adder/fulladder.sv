module fulladder (input logic A, B, cin, 
                  output logic sum, cout);
	
	// Assign the outputs using the logic expressions
	assign sum = A ^ B ^ cin; 
	assign cout = (A & B) | (cin & (A ^ B));
	
endmodule

