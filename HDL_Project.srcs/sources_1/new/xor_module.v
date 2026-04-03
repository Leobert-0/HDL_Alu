`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 11:34:43
// Design Name: 
// Module Name: xor_module
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


module xor_module #(parameter N = 8)(
    x, a , b
    );
    input [N-1:0] a, b;
    output reg [N-1:0] x;
    
    always @ (a, b) begin
        x = a ^ b;
    end
endmodule
