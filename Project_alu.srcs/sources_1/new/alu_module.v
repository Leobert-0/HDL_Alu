`timescale 1ns / 1ns


module alu_module # (parameter N = 8)(
    result, carry_flag, zero_flag, overflow_flag, negative_flag, x, y, operation_code
    );
    input [N-1:0] x, y;
    input [3:0] operation_code;
    output reg [N-1:0] result;
    output reg carry_flag, zero_flag, negative_flag, overflow_flag;
    
    wire addition_carry, addition_overflow;
    wire [N-1:0] addition_sum;
    addition_module #(N) addition (addition_carry, addition_sum, addition_overflow, x, y);
    
    wire subtraction_borrow, subtraction_overflow;
    wire [N-1:0] subtraction_difference;
    subtraction_module #(N) subtraction (subtraction_borrow, subtraction_difference, subtraction_overflow, x, y);
    
    wire [N-1:0] and_result;
    and_module #(N) and1 (and_result, x, y);
    
    wire [N-1:0] or_result;
    or_module #(N) or1 (or_result, x, y);
    
    wire [N-1:0] xor_result;
    xor_module #(N) xor1 (xor_result, x, y);
    
    wire [N-1:0] not_result;
    not_module #(N) not1 (not_result, x);
    
    wire shift_left_carry;
    wire [N-1:0] shift_left_result;
    shift_left_module #(N) shift_left (shift_left_carry, shift_left_result, x);
    
    wire shift_right_carry;
    wire [N-1:0] shift_right_result;
    shift_right_module #(N) shift_right (shift_right_carry, shift_right_result, x);
    
    wire increment_carry, increment_overflow;
    wire [N-1:0] increment_result;
    increment_module #(N) increment (increment_carry, increment_result, increment_overflow, x);
    
    wire decrement_borrow, decrement_overflow;
    wire [N-1:0] decrement_result;
    decrement_module #(N) decrement (decrement_borrow, decrement_result, decrement_overflow, x);
    
    always @ (operation_code, x, y) begin
        case(operation_code)
            4'b0000: begin
                result = addition_sum;
                carry_flag = addition_carry;
                zero_flag = addition_sum ? 0 : 1;
                overflow_flag = addition_overflow;
                negative_flag = addition_sum[N-1];
            end
            4'b0001: begin
                result = subtraction_difference;
                carry_flag = ~subtraction_borrow;
                zero_flag = subtraction_difference ? 0 : 1;
                overflow_flag = subtraction_overflow;
                negative_flag = subtraction_difference[N-1];
            end
            4'b0010: begin
                result = and_result;
                carry_flag = 0;
                zero_flag = and_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = and_result[N-1];
            end
            4'b0011: begin
                result = or_result;
                carry_flag = 0;
                zero_flag = or_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = or_result[N-1];
            end
            4'b0100: begin
                result = xor_result;
                carry_flag = 0;
                zero_flag = xor_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = xor_result[N-1];                
            end
            4'b0101: begin
                result = not_result;
                carry_flag = 0;
                zero_flag = not_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = not_result[N-1];
            end
            4'b0110: begin
                result = shift_left_result;
                carry_flag = shift_left_carry;
                zero_flag = shift_left_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = shift_left_result[N-1];
            end
            4'b0111: begin
                result = shift_right_result;
                carry_flag = shift_right_carry;
                zero_flag = shift_right_result ? 0 : 1;
                overflow_flag = 0;
                negative_flag = shift_right_result[N-1];
            end
            4'b1000: begin
                result = increment_result;
                carry_flag = increment_carry;
                zero_flag = increment_result ? 0 : 1;
                overflow_flag = increment_overflow;
                negative_flag = increment_result[N-1];
            end
            4'b1001: begin
                result = decrement_result;
                carry_flag = ~decrement_borrow;
                zero_flag = decrement_result ? 0 : 1;
                overflow_flag = decrement_overflow;
                negative_flag = decrement_result[N-1];
            end
            default: begin
                result = 0;
                carry_flag = 0;
                zero_flag = 0;
                overflow_flag = 0;
                negative_flag = 0;
            end
        endcase  
    end
endmodule