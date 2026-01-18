// -----------------------------------------------------------------------------
// Copyright (c) 2026 Your Name or Company. All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : alu_pkg.sv
// Create Date  : 2026-01-17 21:34
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description:
// define a package
// -----------------------------------------------------------------------------
// Ports & Signals:
//  
//  
// -----------------------------------------------------------------------------
`timescale 1ns/1ps

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

