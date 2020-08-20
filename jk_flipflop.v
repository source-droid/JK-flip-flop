module jk_flipflop (jk, clk, q, qbar);
    input [1:0] jk;
    input clk;
    output reg q,qbar;
   
 always@(negedge clk)
    begin
    case(jk)
        2'b00:
            q= q;
        2'b01:
            q= 0;
        2'b10:
            q=1;
        2'b11:
            q= ~q;
    endcase
        qbar = ~q;  
    end 
endmodule

module test;
 reg [1:0] jk;
 reg clk;
 wire q,qbar;
   
 initial
       clk = 0;
 always
       #5 clk = ~ clk;
 initial 
  begin

 #00 @(negedge clk) jk = 2'b00;
 #10 @(negedge clk) jk = 2'b01;
 #10 @(negedge clk) jk = 2'b10;
 #10 @(negedge clk) jk = 2'b11;

   #10 $stop;
 end
    
  jk_flipflop inst0(jk,clk,q,qbar);
endmodule
