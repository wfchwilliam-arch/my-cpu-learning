// -----------------------------------------------------------------------------
// Copyright (c) 2026 Your Name or Company. All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : tb_alu.sv
// Create Date  : 2026-01-04 19:31
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description: 
// this module is a testbench for alu. test arithmetich operation and logic operation funchtion.
// -----------------------------------------------------------------------------
// Ports & Signals:
//   - clk   : System clock
//   - rst_n : Asynchronous reset (active low)
//   - 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
import alu_pkg::*;  // 倒入alu 操作码

module tb_alu;
    // 1. 声明信号
    logic [31:0] a,b;
    alu_op_t op;
    logic [31:0] result;
    logic zero;

    // 2. 实例化 alu
    alu u_alu(.*);  //自动连接

    // 测试流程
    initial 
    begin
        $dumpfile("alu.vcd");
        $dumpvars(0,tb_alu);

        // 1. 测试加法
        a = 32'd10; b = 32'd20; op =ALU_ADD;
        #10;// 等待电路稳定
        // 自动检查，如果正确就告诉结果，如果错误，就报错
        if(result != 30 )
        begin
            $error("ERROE: ADD Failed : %d + %d = %d(expected 30)",a,b,result);
        end
        else
        begin
            $display("ADD : %d + %d = %d(expected 30)",a,b,result);
        end


        // 2. 测试减法
        a = 32'd10; b=32'd10; op = ALU_SUB;
        #10;
        
        if(result != 0 )
        begin
            $error("ERROE: SUB Failed : %d - %d = %d(expected 30)",a,b,result);
        end
        else
        begin
            $display("SUB : %d - %d = %d(zero = %b expected 1)",a,b,result,zero);
        end


        // 3. 测试按位与
        a = 32'hFF00FF00; b = 32'hFFFF0000; op = ALU_AND;
        #10;
        
        if(result != 32'hFF000000)
        begin
            $error("ERROE: AND Failed : %h & %h = %h(expected FF000000)",a,b,result);
        end
        else
        begin
            $display("AND : %h & %h = %h(expected FF000000)",a,b,result);
        end

        // 4. 测试有符号数比大小
        a = -32'd5; b = 32'd10; op = ALU_SLT;
        #10;
       
        if(result != 1)
        begin
            $error("ERROE: SLT Failed :  %d < %d ? result = %d (expected 1)",a, b, result);
        end
        else
        begin
            $display("SLT : %d < %d ? result = %d (expected 1)",a, b, result);
        end

    end

endmodule