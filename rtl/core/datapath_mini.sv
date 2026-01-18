// -----------------------------------------------------------------------------
// Copyright (c) 2026 Your Name or Company. All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : datapath_mini.sv
// Create Date  : 2026-01-16 06:46
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description:
// Design a module to test fetching data form REGISTER and computin function of ALU
// -----------------------------------------------------------------------------
// Ports & Signals:
//   - clk   : System clk
//   - rst_n : Asynchronous reset (active low)
//   - [4:0] rs1 : Adress of reding register1 
//   - [4:0] rs2 : Adress of reding register2
//   - [4:0] ws  : Adress of writing register
//   - reg_write : Enable of writing register
//   - alu_op    : Operator of ALU 
//   - alu_result_out : Define a temporary data to check result of ALU
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
//import alu_pkg::*;

/* verilator lint_off UNUSEDSIGNAL */
module datapath_mini 
(
    input  logic clk,    
    input  logic rst_n,
    
    // ----控制信号（简易模型，模拟解码器产生数据，我们手动控制）------
    input [4:0] rs1 ,       //读寄存器1 的地址
    input [4:0] rs2 ,       //读寄存器2 的地址
    input [4:0] ws  ,       //写寄存器 的地址
    input logic reg_write,  // 寄存器写使能
    input alu_pkg::alu_op_t alu_op,  // ALU 操作码

    // ---- 观察信号（让testbench 能够看到内部发生了什么变化）----
    output logic [31:0] alu_result_out
);
/* verilator lint_on UNUSEDSIGNAL */


// -----内部连接------
logic [31:0] reg_data1;   //寄存器1 读出的数据
logic [31:0] reg_data2;   //寄存器2 读出的数据
logic [31:0] alu_result;  //alu 算出的结果

/* verilator lint_off UNUSEDSIGNAL */
logic alu_zero;
/* verilator lint_on UNUSEDSIGNAL */

// ---- 1、实例化 寄存器堆（核心）-------
regfile u_regfile(
    .clk(clk),

    //写端口(数据来自alu 的计算结果)
    .we3(reg_write),
    .a3(ws),
    .wd3(alu_result), // 关键连接，alu的输出送回rf

    //读端口
    .a1(rs1),
    .rd1(reg_data1),
    .a2(rs2),
    .rd2(reg_data2)
);

//---- 2、实例化 计算单元 ------
alu u_alu(
    .a(reg_data1),   // 从rf 读出的数据reg_data1
    .b(reg_data2),   // 从rf 读出的数据reg_data2
    .op(alu_op),     // 需要进行的运算
    .result(alu_result) ,// alu 计算出结果，放入alu_result里面，后面会写入rf
    .zero(alu_zero)
);

// 把alu 中间的计算结果加一个信号，拉出去看
assign alu_result_out = alu_result;


endmodule
