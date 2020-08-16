module vending_machine(coin,rst,ticket,clk);
input [1:0] coin;  //msb of the coin denotes the Dime and lsb denotes nickel //
input rst,clk;
output reg ticket;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0] state,nextstate;
always @ (posedge clk)
begin
if(!rst)
state<=0;
else
state<=nextstate;
end
always @(coin,state)
begin
case(state)
s0: begin if(coin == 2'b00)
          begin  
          nextstate<=s0;
          ticket<=1'b0;
          end
         else if(coin == 2'b01)
          begin  
          nextstate<=s1;
          ticket<=1'b0;
          end
         else if(coin == 2'b10)
          begin  
          nextstate<=s2;
          ticket<=1'b0;
          end
      end
s1 : begin  if(coin == 2'b00)
             begin
             nextstate<=s1;
             ticket<=1'b0;
             end
             else if(coin == 2'b01)
             begin
             nextstate<=s2;
             ticket<=1'b0;
             end
             else if(coin == 2'b10)
             begin
             nextstate<=s3;
             ticket<=1'b1;
             end
      end
s2: begin  if(coin == 2'b00)
             begin
             nextstate<=s2;
             ticket<=1'b0;
             end
             else if(coin == 2'b01)
             begin
             nextstate<=s3;
             ticket<=1'b1;
             end
      end
s3: nextstate<=s0;
endcase
end
endmodule
