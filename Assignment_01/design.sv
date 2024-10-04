module assignment_01 #(parameter N=4)
(
    input logic [N-1:0] A,B,
    input logic ci,SEL,
    output logic signed [N:0] out

);

wire c0;
wire signed [N-1:0] S;

ripple_adder #(N) ra (
    .A(A),
    .B(B),
    .ci(ci),
    .c0(c0),
    .S(S)
);

always_comb begin
    if (SEL)
        out = {c0,S};
    else 
        out = '0;
end


endmodule


module ripple_adder #(parameter N=4)
(
    input logic [N-1:0] A,B,
    input logic ci,
    output logic c0,
    output logic [N-1:0] S

);
    logic C [N:0];

    always_comb begin
        C[0] = ci;
        c0 = C[N];
    end

    genvar i;
    generate
        for (i=0;i<N;i=i+1) begin:add
            full_adder fa (
            .a (A[i]),
            .b (B[i]),
            .ci (C[i]),
            .co (C[i+1]),
            .sum (S[i])
            );
        end
    endgenerate

endmodule

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
