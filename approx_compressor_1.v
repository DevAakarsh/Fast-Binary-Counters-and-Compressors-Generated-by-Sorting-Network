// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module app_4_2(x0,x1,x2,x3,Carry,Sum);
input x0,x1,x2,x3;
output Carry,Sum;
wire A,D,w1,h1,h2;
assign {x0,x1,x2,x3} = 4'b1111;

SN_4 D0 (x0,x1,x2,x3,A,h1,h2,D);

assign Carry = h1;
assign w1 = A & (~h1);
assign Sum = w1 | h2;

endmodule

module BS(x1,x2,y1,y2);

input x1,x2;
output y1,y2;

assign y1 = x1 | x2;
assign y2 = x1 & x2;

endmodule

module SN_4(i1,i2,i3,i4,A,h1,h2,D);

output A,h1,h2,D;
input i1,i2,i3,i4;
wire w1,w2,w3,w4,h1,h2,A,D,w11,w33,w44,w22;

BS BS_1(.x1(i1),.x2(i2),.y1(w1),.y2(w2));
BS BS_2(.x1(i3),.x2(i4),.y1(w3),.y2(w4));
BS BS_3(.x1(w1),.x2(w3),.y1(A),.y2(w33));
BS BS_4(.x1(w2),.x2(w4),.y1(w22),.y2(D));
BS BS_5(.x1(w22),.x2(w33),.y1(h1),.y2(h2));

endmodule