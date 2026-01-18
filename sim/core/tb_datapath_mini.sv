// -----------------------------------------------------------------------------
// Copyright (c) 2026 Your Name or Company. All rights reserved.
// -----------------------------------------------------------------------------
// Author       : William
// File         : tb_datapath_mini.sv
// Create Date  : 2026-01-17 07:15
// Rev          : v1.0
// Editor       : VS Code
// -----------------------------------------------------------------------------
// Module Description:
// test a procedue of feching instruction and excuting instruction completly.
// purpose: x3 = x1 + x2
// first : assign value to x1
// second: assign value to x2
// third : add x1 and  x2, assign result to  x3
// -----------------------------------------------------------------------------
// Ports & Signals:
//   - clk   : System clock
//   - rst_n : Asynchronous reset (active low)
//   - [4:0] rs1 : Adress of reding register1 
//   - [4:0] rs2 : Adress of reding register2
//   - [4:0] ws  : Adress of writing register
//   - reg_write : Enable of writing register
//   - alu_op    : Operator of ALU 
//   - alu_result_out : Define a temporary data to check result of ALU
// -----------------------------------------------------------------------------
`timescale 1ns/1ps



module tb_datapath_mini ();
    import alu_pkg ::*;
    logic clk;
    logic rst_n;
    logic [4:0] rs1,rs2;   // 读数据地址
    logic [4:0] ws;        // 写数据地址
    logic reg_write;       // 寄存器写使能
    alu_op_t alu_op;       // alu 操作码
    logic [31:0] alu_result_out;  // 计算结果输出数据

    // 实例化迷你通路
    datapath_mini u_datapath(.*);

    // 时钟生成
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 其它信号施加激励
    initial
    begin
        $dumpfile("datapath_mini.vcd");
        $dumpvars(0,tb_datapath_mini);

        // 1、复位
        rst_n = 0;
        reg_write = 0;
        #10;
        rst_n = 1;

        $display("====仿真开始====");

        // step1, 对x1 x2进行赋值，x1 = 10,x2 = 20

        // 走后门，对寄存器进行复制（仅在仿真模式下）。现实情况下，不能进行赋值，要么通过加载，或通过程序赋值
        u_datapath.u_regfile.rf[1] = 32'd10;
        u_datapath.u_regfile.rf[2] = 32'd20;

        $display("初始化：x1 =10,x2 = 20");

        // ----step2 : 执行ADD x3 ，x1,x2 ---
        rs1 = 1;   // 读x1
        rs2 = 2;   // 读x2
        ws = 3;    // 写x3
        alu_op = ALU_ADD;  //做加法
        reg_write = 1;     //允许写入

        #10; //等待一个周期
        reg_write = 0;    // 禁止写入

        // ---- step3: 检查结果 -----
        // 通过读x3 的寄存器的里面的值，确认写进入的值是否正确
        rs1 = 3;
        rs2 = 0;
        alu_op = ALU_ADD;
        #1;

        if(alu_result_out == 32'd30)
            $display("pass：x3 = %d(expected 30)",alu_result_out);
        else
            $display("fail:x3 = %d(expected 30)",alu_result_out);
        
        #10;
        $finish;
    end


endmodule
