`timescale 1ns / 1ns


module decrement_module #(parameter N = 8)(
    b_out, out, o, x
);
    input [N-1:0] x;
    output reg [N-1:0] out;
    output reg b_out, o;
    
    always @(x) begin
        out = x - 1;
        b_out = (x == 0);
        o = (x[N-1] == 1'b1) && (out[N-1] == 1'b0);
    end
endmodule
