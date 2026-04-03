`timescale 1ns / 1ns


module shift_left_module #(parameter N = 8)(
    c_out, out, x
);
    input [N-1:0] x;
    output reg [N-1:0] out;
    output reg c_out;
    
    always @(x) begin
        out = x << 1;
        c_out = x[N-1];
    end
endmodule