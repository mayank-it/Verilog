module vending_machine_tb;
reg clk,rst;
reg [1:0] coin;
wire ticket;
vending_machine v1(coin,rst,ticket,clk);
initial  
clk =1'b0;
always #10 clk=~clk;
initial
$monitor($time,"coin=%b,rst=%b,clk=%b,ticket=%b",coin,rst,clk,ticket);
initial
begin
#10 rst=1'b0;
#10 rst=1'b1;  
#10 coin = 2'b00;
#10 coin = 2'b01;
#10 coin = 2'b10;
#10 coin = 2'b00;
#10 coin = 2'b01;
#10 coin = 2'b10;
#10 coin = 2'b00;
#10 coin = 2'b01;
#10 coin = 2'b10;
end
endmodule
