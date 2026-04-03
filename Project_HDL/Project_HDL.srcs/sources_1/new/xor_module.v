`timescale 1ns / 1ns


module xor_module #(parameter N = 8)(
    out, x, y
);
    input [N-1:0] x, y;
    output reg [N-1:0] out;
    
    always @(x, y) begin
        out = x ^ y;
    end
endmodule
