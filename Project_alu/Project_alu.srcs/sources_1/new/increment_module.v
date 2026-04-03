`timescale 1ns / 1ns


module increment_module #(parameter N = 8)(
    c, out, o, x
);
    input [N-1:0] x;
    output reg [N-1:0] out;
    output reg c, o;
    reg [N:0] temp;
    
    always @(x) begin
        temp = x + 1;
        out = temp[N-1:0];
        c = temp[N];
        o = (x[N-1] == 1'b0) && (out[N-1] == 1'b1);
    end
endmodule
