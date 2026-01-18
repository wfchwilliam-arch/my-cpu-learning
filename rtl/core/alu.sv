// describe a 32 bits alu
/*
Module: ALU(Arithmetic logic unit) 
Description: 32-bit ALU for RISC-V core
Author : wfchwilliam
*/

`timescale 1ns/1ps


module alu
    import alu_pkg::*;
(
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

