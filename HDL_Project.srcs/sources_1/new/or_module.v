`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 21:15:07
// Design Name: 
// Module Name: or_module
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


module or_module #(parameter N = 8)(
        x, a, b
    );
    input [N-1:0] a, b;
    output reg [N-1:0] x;
    always @(a, b) begin 
        x = a | b;
    end
endmodule
