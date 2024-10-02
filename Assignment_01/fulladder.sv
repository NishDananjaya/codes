module full_adder(
    input logic a,b,ci,
    output logic sum,co
);

    logic wire_1,wire_2,wire_3;

    always_comb begin
        wire_1 = a ^ b;
        wire_2 = wire_1 & ci;
        wire_3 = a & b;

        co = wire_2 | wire_3;
        sum = wire_1 ^ ci;
    end

    
endmodule