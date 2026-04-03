`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 11:43:34
// Design Name: 
// Module Name: inc_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inc_module # (parameter N = 8) (
    c, x, o, a
    );
    input [N-1:0] a;
    output reg [N-1:0] x;
    output reg c, o;
    reg [N:0] sum;
    always @ (a) begin
        sum = a + 1;
        x = sum[N-1:0];
        c = sum [N];
        o = (a[N-1] == 0) && (x[N-1] == 1);
    end
endmodule
