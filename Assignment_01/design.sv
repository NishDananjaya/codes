module assignment_01 #(parameter N=4)
(
    input logic [N-1:0] A,B,
    input logic ci,
    input logic [N-1:0] X,
    input logic SEL,
    output logic c0,
    output logic signed [N-1:0] S,
    output logic signed [N-1:0] out

    
);

    logic C [N:0];

    always_comb begin
        C[0] = ci;
        co = C[N];
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

    always_comb begin
        if (SEL)
            out = S;
        else 
            out = X;
    end

endmodule