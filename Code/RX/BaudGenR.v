module BaudGenR(
    input wire         reset_n,    
    input wire         clock,       
    input wire  [1:0]  baud_rate,   

    output reg         baud_clk   
);


reg [9:0]  final_value;  .
reg [9:0]  clock_ticks;  


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

always @(negedge reset_n, posedge clock) 
begin
  if(!reset_n) 
  begin
    clock_ticks   <= 10'd0;
    baud_clk      <= 1'b0;
  end
  else 
  begin
    if(clock_ticks == final_value)
    begin
      baud_clk      <= ~baud_clk;
      clock_ticks   <= 10'd0;
    end
    else 
    begin
      clock_ticks   <= clock_ticks + 1'd1;
      baud_clk      <= baud_clk;
    end
  end
end

endmodule