// -----------------------------------------------------------------------------
// Copyright (c) 2026 Your Name or Company. All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : tb_regfile.sv
// Create Date  : 2026-01-11 19:39
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description:
// 用于测试regfile，验证读写功能，重点关注x0 寄存器的读写是否正确
// -----------------------------------------------------------------------------
// Ports & Signals:
//   
//   - 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_regfile;
    logic clk;
    logic we3;
    logic [4:0] a1,a2,a3;
    logic [31:0] wd3;
    logic [31:0] rd1,rd2;

    //实例化dut
    regfile u_regfile(.*);

    //产生时钟周期
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_regfile.vcd");
        $dumpvars(0,tb_regfile);

        //----- 初始化 --------
        we3 = 0; a1 = 0; a2 = 0; a3 = 0; wd3 = 0;
        #10;
        $display("start egfile test");
        //----- test1 : 正常读出和写入x1 ------
        // 目标是x1 写入0xffff5555，检查能否读出
        $display("test1 : writing to x1 0xffff5555");

        // 1、准备写操作
        a3 = 5'd1;  // 选择 1号地址
        wd3 = 32'hffff5555; // 写入的数据
        we3 = 1;  // 写使能
        #10;   // 等一个周期，让上升沿到来
        we3 = 0; // 数据写完以后，关闭写使能。这个是个好习惯，防止数据莫名其妙被改变

        // 2、准备读操作
        a1 = 5'd1;  // 读地址 x1 
        #1;         // 组合逻辑有一个延迟，就假设它为1ns
 
        // 3、检查结果
        if (rd1 == 32'hffff5555) begin
            $display("--> pass: x1 = %h", rd1);
        end
        else begin
            $display("--> fail: x1 = %h(expected ffff5555) ",rd1);
        end

        // ---- test2: 对x0 进行读写操作 -------
        // 目标： 向x0 写入垃圾数据，读出来必须是 0
        $display("test2: trying to contaminate x0");

        // 1、准备写操作
        a3 = 5'd0;
        wd3 = 32'hffffaaaa;
        we3 = 1;
        #10;
        we3 = 0;

        // 2、准备读操作
        a2 = 5'd0;
        #1;

        // 3、验证a2 地址读数据是否正确；
        assert  (rd2 === 32'd0) 
            $display("--> pass: x0 = %h（hardware protected）", rd2);
        else 
            $error("--> fail: x0 = %h was overwritten (expected 0) ",rd2);

        // --- test3: 双端口读写 ---
        // 目标 同时读取 端口1 （x1）和 端口2（x0）
        $display("test3: dual port read at the same time");
        a1 = 5'd1;
        a2 = 5'd0;
        #1;
        $display("-> port 1 (x1): %h",rd1);
        $display("-> port 2 (x0): %h",rd2);

        #10;
        $finish;
    
    end

endmodule
