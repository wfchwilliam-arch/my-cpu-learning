module dff(
    input logic clk,     //时钟信号
    input logic rst_n,   //复位信号
    input logic [3:0] d, //输入数据
    output logic [3:0] q //输出数据
);

//always_ff @(),告诉工具是一个触发器
//posedge :上升沿触发
//negedge :下降沿触发
always_ff @(posedge clk , negedge rst_n) 
begin
    if(!rst_n) 
    begin
        q <= 4'b0;
    end
    else
    begin
        q <= d;
    end

end

endmodule

