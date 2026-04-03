`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////


module not_module #(parameter N = 8)(
    out, x
);
    input [N-1:0] x;
    output reg [N-1:0] out;
    
    always @(x) begin
        out = ~x;
    end
endmodule