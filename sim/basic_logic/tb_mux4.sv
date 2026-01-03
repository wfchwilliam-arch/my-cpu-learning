`timescale 1ns/1ps
module tb_mux4;
    logic [3:0] d0,d1,d2,d3;
    logic [1:0] sel;
    logic [3:0] y;

    mux4 u_mux4(
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0,tb_mux4);

        d0 = 4'hA;
        d1 = 4'hB;
        d2 = 4'hC;
        d3 = 4'hD;

        // 打印表头
        $display("Time | sel | outputY | Expected");
        $display("-------------------------------");

        //改变sel，看y 怎么变
        sel = 2'b00;#10;    //等待10ns
        $display("%4t | 00 |    %h    |    A  ",$time, y);

        sel = 2'b01;#10;    //等待10ns
        $display("%4t | 00 |    %h    |    B  ",$time, y);

        sel = 2'b10;#10;    //等待10ns
        $display("%4t | 00 |    %h    |    C  ",$time, y);

        sel = 2'b11;#10;    //等待10ns
        $display("%4t | 00 |    %h    |    D  ",$time, y);

        //结束仿真
        #10
        $finish;

    end
endmodule