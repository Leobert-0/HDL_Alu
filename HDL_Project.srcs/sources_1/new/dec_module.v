`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 11:45:24
// Design Name: 
// Module Name: dec_module
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


module dec_module # (parameter N = 8) (
    b, x, o, a
    );
    input [N-1:0] a;
    output reg [N-1:0] x;
    output reg b, o;
    reg[N:0] diff;
    always @ (a) begin
        diff = a - 1;
        x = diff[N-1:0];
        b = ~diff[N];
        o = (a[N-1] == 1) && (x[N-1] == 0);
    end
endmodule
