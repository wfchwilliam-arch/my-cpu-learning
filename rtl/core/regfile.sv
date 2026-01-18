// -----------------------------------------------------------------------------
// Copyright (c) 2026 Wfchwilliam All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : regfile.sv
// Create Date  : 2026-01-10 22:25
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description:
// 关于cpu “心脏” 寄存器的设计，重点关注 x0 寄存器
// -----------------------------------------------------------------------------
// Ports & Signals:
//   - clk   : 系统时钟
//   - we3   : 写使能 ，1= 写，0 = 不写
//   - a3    ：写地址，x0～x31 其中一个地址
//   - wd3   ：写数据
//   - a1    ：读地址1
//   - rd1   ：读数据1
//   - a2    ：读地址2
//   - rd2   ：读数据2
// -----------------------------------------------------------------------------
`timescale 1ns/1ps

module regfile (
    input  logic clk,  // 时钟

    //--- 写端口（write port） ---
    input  logic we3,         // 写使能，we3 = 1，允许写；we3 = 0 ，禁止写
    input logic [4:0] a3,     // 写地址（address 3）： 写入x0～x31 中任何一个
    input logic [31:0] wd3,   // 写数据（write data 3）： 要写入的内容

    //--- 读端口1（read port 1）---
    input logic [4:0] a1,     // 读地址1
    output logic [31:0] rd1,  // 读数据1 

    //--- 读端口2（read port 2）---
    input logic [4:0] a2,     // 读地址2
    output logic [31:0] rd2   // 读数据2
    
);

    // 定义存储介质： 32 个32 位寄存器
    logic [31:0] rf[31:0];

    // 寄存器的写逻辑，必须等时钟到来
    // 只有在时钟上升沿（posedge clk） 且 写使能（we3 = 1）时，才可以向寄存器写入数据
    always_ff @(posedge clk ) begin
        if (we3 == 1)begin
            rf[a3] <= wd3;
        end
    end

    //读逻辑，读的时候，马上给数据。 x0 恒为 0
    //公式：如果地址为0，直接输出0，否则输出rf 数组里面的值
    assign rd1 = (a1 != 0)? rf[a1] : 32'b0;
    assign rd2 = (a2 != 0)? rf[a2] : 32'b0;



endmodule
