`timescale 1ns/1ps

module BaudTest();
    reg rst_n;
    reg clk;
    reg [1:0] baud_rate;
    wire baud_clk;

BaudGenR DUT(
    .rst_n(rst_n),
    .clk(clk),
    .baud_rate(baud_rate),
    .baud_clk(baud_clk)
);

initial begin
    clk = 1'b0;
    forever begin
        #10 clk = ~clk;
    end 
end

initial begin
    $dumpfile("BautGen.vcd");
    $dumpvars(0,BaudTest);
end

integer i;
initial begin
    $monitor("t = %2d, rst_n = %b, clk = %b, baud_rate = %2b, baud_clk = %b", $time, rst_n, clk, baud_rate, baud_clk);
    for (i = 0; i <= 4; i = i + 1) begin
        baud_rate = i;
        #(300000/(i+1));
    end
end

initial begin
    rst_n = 0;
    #100 rst_n = 1'b1;
end

endmodule