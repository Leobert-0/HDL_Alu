`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 11:37:15
// Design Name: 
// Module Name: not_module
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


module not_module #(parameter N=8)(
    x, a
    );
    input [N-1:0] a;
    output reg [N-1:0] x;
    always @ (a) begin
        x = ~a;
    end
endmodule
