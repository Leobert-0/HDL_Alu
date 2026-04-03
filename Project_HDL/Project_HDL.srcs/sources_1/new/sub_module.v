`timescale 1ns / 1ns


module sub_module #(parameter N = 8)(
    b_out, diff, o, x, y
);
    input [N-1:0] x, y;
    output reg [N-1:0] diff;
    output reg b_out, o;
    
    always @(x, y) begin
        diff = x - y;
        b_out = (x < y);
        o = (x[N-1] != y[N-1]) && (diff[N-1] != x[N-1]);
    end
endmodule
