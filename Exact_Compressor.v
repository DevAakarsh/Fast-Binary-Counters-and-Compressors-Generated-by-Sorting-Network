`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2022 20:01:28
// Design Name: 
// Module Name: 4_2_exact
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exact_4_2(x0,x1,x2,x3,Cin,Carry,Sum);
input x0,x1,x2,x3,Cin;
output Carry,Sum;
wire A,B,C,D;
wire AB,S0,h1,h2,w1,w2,w3;
assign {x0,x1,x2,x3} = 4'b0010;
assign Cin = 1'b1;

SN_4 D0 (x0,x1,x2,x3,A,B,C,D);
assign AB = A & (~B);
assign S0 = AB | D;
BS D1 (C,D,h1,h2);
assign w1 = S0 & h1;
assign Carry = w1 | h2;
assign w2 = h1 & (~h2);
assign w3 = (~h1) | h2;
assign Sum = (S0 & w3) | ((~S0) & w2);

endmodule

module BS(x1,x2,y1,y2);

input x1,x2;
output y1,y2;

assign y1 = x1 | x2;
assign y2 = x1 & x2;

endmodule

module SN_4(i1,i2,i3,i4,o1,o2,o3,o4);

output o1,o2,o3,o4;
input i1,i2,i3,i4;
wire w1,w2,w3,w4,w22,w33;

BS BS_1(.x1(i1),.x2(i2),.y1(w1),.y2(w2));
BS BS_2(.x1(i3),.x2(i4),.y1(w3),.y2(w4));
BS BS_3(.x1(w1),.x2(w3),.y1(o1),.y2(w33));
BS BS_4(.x1(w2),.x2(w4),.y1(w22),.y2(o4));
BS BS_5(.x1(w22),.x2(w33),.y1(o2),.y2(o3));

endmodule