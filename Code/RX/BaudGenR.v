`timescale 1ns/1ps

module BaudGenR(
    input wire         rst_n,    
    input wire         clk,       
    input wire  [1:0]  baud_rate,   

    output reg         baud_clk   
);


reg [9:0]  final_value;
reg [9:0]  clk_ticks;  


localparam BAUD24      = 2'b00,
           BAUD48      = 2'b01,
           BAUD96      = 2'b10,
           BAUD192     = 2'b11;

always @(*) 
begin
    case (baud_rate)
     
      BAUD24: final_value  = 10'd651;  
      BAUD48: final_value  = 10'd326;  
      BAUD96: final_value  = 10'd163;  
      BAUD192: final_value = 10'd81;  
      default: final_value = 10'd163;  
    endcase
end

always @(negedge rst_n, posedge clk) 
begin
  if(!rst_n) 
    begin
      clk_ticks   <= 10'd0;
      baud_clk      <= 1'b0;
    end
  else 
    begin
      if(clk_ticks == final_value)
      begin
        baud_clk      <= ~baud_clk;
        clk_ticks   <= 10'd0;
      end
      else 
      begin
        clk_ticks   <= clk_ticks + 1'd1;
        baud_clk      <= baud_clk;
      end
    end
end

endmodule