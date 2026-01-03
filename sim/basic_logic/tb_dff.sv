`timescale 1ns/1ps
module tb_dff;
    logic clk;
    logic rst_n;
    logic [3:0] d;
    logic [3:0] q;


    //实例化 d 触发器
    dff u_dff(
        .clk (clk),
        .rst_n(rst_n),
        .d (d),
        .q (q)   
    );

    //产生时钟信号
    initial 
    begin
        clk = 0;   //初始化时钟信号为0
        forever #5 clk = ~clk; // 产生一个周期为10ns 的时钟信号
    end

    // 产生其他激励
    initial 
    begin
        $dumpfile("dff.vcd");
        $dumpvars(0,tb_dff);

        //初始化
        rst_n = 0;  //先复位
        d = 4'h0;
        #20;
        rst_n = 1;

        d = 4'hA;
        #20;
        d = 4'hB;
        #20;
        d = 4'hC;
        #20;
        $finish;
    end
endmodule
