// describe a 32 bits alu
/*
Module: ALU(Arithmetic logic unit) 
Description: 32-bit ALU for RISC-V core
Author : wfchwilliam
*/

package alu_pkg;
    typedef enum logic [3:0] {
        ALU_ADD = 4'b0000,
        ALU_SUB = 4'b1000,
        ALU_AND = 4'b0111,
        ALU_OR  = 4'b0110,
        ALU_XOR = 4'b0100,
        ALU_SLL = 4'b0001,  // 逻辑左移（shift left logic）
        ALU_SRL = 4'b0101,  // 逻辑右移（shift right logic）
        ALU_SRA = 4'b1101,  // 算术右移 (shift right arithmetic)
        ALU_SLT = 4'b0010,  // 小于置1 （set less than， signed）
        ALU_SLTU= 4'b0011   // 无符号数小于置1（set less than ，unsigned）
      } alu_op_t;
endpackage

import alu_pkg::*;

module alu(
    input logic [31:0] a,
    input logic [31:0] b,
    input alu_op_t op,
    output logic [31:0] result,
    output logic zero
);

    always_comb 
    begin
        result = '0;
        case(op)
            ALU_ADD: result = a + b;
            ALU_SUB: result = a - b;
            ALU_AND: result = a & b;
            ALU_OR : result = a | b;
            ALU_XOR: result = a ^ b;
            ALU_SLL: result = a <<b[4:0];
            ALU_SRL: result = a >>b[4:0];
            ALU_SRA: result = $signed(a) >>> b[4:0];
            ALU_SLT: result = ($signed(a) < $signed(b))? 32'd1 : 32'd0;
            ALU_SLTU: result = (a < b)? 32'd1 : 32'd0;
            default : result = '0;
        endcase
    end

    assign zero = (result == 32'b0);
endmodule

