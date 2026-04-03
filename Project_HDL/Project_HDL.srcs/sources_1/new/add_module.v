`timescale 1ns / 1ns


module add_module #(parameter N = 8)(
    c, s, o, x, y
);
    input [N-1:0] x, y;
    output reg [N-1:0] s;
    output reg c, o;
    reg [N:0] sum;
    
    always @(x, y) begin
        sum = x + y;
        s = sum[N-1:0];
        c = sum[N];
        o = (x[N-1] == y[N-1]) && (s[N-1] != x[N-1]);
    end
endmodule
