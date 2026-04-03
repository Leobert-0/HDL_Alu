`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 20:46:50
// Design Name: 
// Module Name: add_module
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
