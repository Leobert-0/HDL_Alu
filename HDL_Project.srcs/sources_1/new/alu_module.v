`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 14:41:29
// Design Name: 
// Module Name: alu_module
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


module alu_module # (parameter N = 8)(
    result, carry, zero_flag, overflow_flag, neg_flag, a, b, opcode
    );
    input [N-1:0] a, b;
    input [3:0] opcode;
    output reg [N-1:0] result;
    output reg carry, zero_flag, neg_flag, overflow_flag;
    
    wire add_carry, add_overflow;
    wire [N-1:0] add_sum;
    add_module #(N) add1 (add_carry, add_sum, add_overflow, a, b);
    
    wire sub_borrow, sub_overflow;
    wire [N-1:0] sub_diff;
    subtract_module #(N) sub1 (sub_borrow, sub_diff, sub_overflow, a, b);
    
    wire [N-1:0] and_result;
    and_module #(N) and1(and_result, a, b);
    
    wire [N-1:0] or_result;
    or_module #(N) or1(or_result, a, b);
    
    wire [N-1:0] xor_result;
    xor_module #(N) xor1(xor_result, a, b);
    
    wire [N-1:0] not_result;
    not_module #(N) not1(not_result, a);
    
    wire shl_carry;
    wire [N-1:0] shl_result;
    shl_module #(N) shl1(shl_carry, shl_result, a);
    
    wire shr_carry;
    wire [N-1:0] shr_result;
    shr_module #(N) shr1 (shr_carry, shr_result, a);
    
    wire inc_carry, inc_overflow;
    wire [N-1:0] inc_result;
    inc_module #(N) inc1 (inc_carry, inc_result, inc_overflow, a);
    
    wire dec_borrow, dec_overflow;
    wire [N-1:0] dec_result;
    dec_module #(N) dec1 (dec_borrow, dec_result, dec_overflow, a);
    
    always @ (opcode, a, b) begin
        case(opcode)
            4'b0000: begin
                result = add_sum;
                carry = add_carry;
                zero_flag = add_sum ? 0 : 1;
                overflow_flag = add_overflow;
                neg_flag = add_sum[N-1];
            end
            4'b0001: begin
                result = sub_diff;
                carry = ~sub_borrow;
                zero_flag = sub_diff ? 0 : 1;
                overflow_flag = sub_overflow;
                neg_flag = sub_diff[N-1];
            end
            4'b0010: begin
                result = and_result;
                carry = 0;
                zero_flag = and_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = and_result[N-1];
            end
            4'b0011: begin
                result = or_result;
                carry = 0;
                zero_flag = or_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = or_result[N-1];
            end
            4'b0100: begin
                result = xor_result;
                carry = 0;
                zero_flag = xor_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = xor_result[N-1];                
            end
            4'b0101: begin
                result = not_result;
                carry = 0;
                zero_flag = not_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = not_result[N-1];
            end
            4'b0110: begin
                result = shl_result;
                carry = shl_carry;
                zero_flag = shl_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = shl_result[N-1];
            end
            4'b0111: begin
                result = shr_result;
                carry = shr_carry;
                zero_flag = shr_result ? 0 : 1;
                overflow_flag = 0;
                neg_flag = shr_result[N-1];
            end
            4'b1000: begin
                result = inc_result;
                carry = inc_carry;
                zero_flag = inc_result ? 0 : 1;
                overflow_flag = inc_overflow;
                neg_flag = inc_result[N-1];
            end
            4'b1001: begin
                result = dec_result;
                carry = ~dec_borrow;
                zero_flag = dec_result ? 0 : 1;
                overflow_flag = dec_overflow;
                neg_flag = dec_result[N-1];
            end
            default: begin
                result = 0;
                carry = 0;
                zero_flag = 0;
                overflow_flag = 0;
                overflow_flag = 0;
                neg_flag = 0;
            end
        endcase  
    end
    
endmodule
