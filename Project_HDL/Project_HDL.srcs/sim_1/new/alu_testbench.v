`timescale 1ns / 1ns


module alu_testbench;

    reg [3:0] x4, y4;
    reg [3:0] op4;
    wire carry4, zero_flag4, overflow_flag4, neg_flag4;
    wire [3:0] result4;
    
    reg [7:0] x8, y8;
    reg [3:0] op8;
    wire carry8, zero_flag8, overflow_flag8, neg_flag8;
    wire [7:0] result8;

    alu_module #(4) uut4 (result4, carry4, zero_flag4, overflow_flag4, neg_flag4, x4, y4, op4);
    alu_module #(8) uut8 (result8, carry8, zero_flag8, overflow_flag8, neg_flag8, x8, y8, op8);
    
    integer i;

    initial begin
        op4 = 0; op8 = 0; 
        x4 = 4'b1001; y4 = 4'b1011;
        x8 = 8'd15; y8 = 8'd10;
        #10;
        
        for (i = 0; i <= 9; i = i + 1) begin
            op4 = i;
            op8 = i;
            #10;
        end

        x4 = 4'b0101; y4 = 4'b0101;
        x8 = 8'd255; y8 = 8'd1;     
        
        for (i = 0; i <= 9; i = i + 1) begin
            op4 = i;
            op8 = i;
            #10;
        end
        
        $finish;
    end
    
endmodule