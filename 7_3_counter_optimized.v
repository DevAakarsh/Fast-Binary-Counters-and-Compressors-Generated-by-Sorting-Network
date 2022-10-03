`timescale 1ns / 1ps

module counter_7_3 (s,c1,c2);

output s,c1,c2;
wire [6:0] in;
assign in = 7'b0111011;
wire o1,o2,o3,o4,op1,op2,op3;
wire [5:0] a;
wire [4:0] b;
wire p0,p1,p2,p3,p4,q0,q1,q2,q3;

SN_4 S1(.i1(in[6]),.i2(in[5]),.i3(in[4]),.i4(in[3]),.o1(o1),.o2(o2),.o3(o3),.o4(o4));
SN_3 S2(.ip1(in[2]),.ip2(in[1]),.ip3(in[0]),.op1(op1),.op2(op2),.op3(op3));

assign a = {o1,o1,o2,o3,o4,o4};
assign b = {op1,op1,op2,op3,op3};

assign p0 = (a[5] & (~a[4]));
assign p1 = (a[4] & (~a[3]));
assign p2 = (a[3] & (~a[2]));
assign p3 = (a[2] & (~a[1]));
assign p4 = (a[1] & (~a[0]));

assign q0 = (b[4] & (~b[3]));
assign q1 = (b[3] & (~b[2]));
assign q2 = (b[2] & (~b[1]));
assign q3 = (b[1] & (~b[0]));

assign s = (p1 | p3) ^ (q1 | q3);
//assign c1 = (q0 & (p2|p3)) | (q1 & (p1|p2)) | (q2 & ((p2|p3))) | (q3 & ((p1|p2)));
//assign c2 = (p4 & (q0|q1|q2|q3)) | (p3 & (q1|q2|q3)) | (p2 & (q2|q3)) | (p1 & (q3));
assign c2 = a[1] | a[2]&b[3] | a[4]&b[1] | a[3]&b[2];
assign c1 = (q0 & (a[3]|(a[1]))) | (q1 & (a[4]|(~a[2]))) | (q2 & ((a[3] | (a[1])))) | (q3 & ((a[4] | (~a[2])))); 
    
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

module SN_3(ip1,ip2,ip3,op1,op2,op3);

input ip1,ip2,ip3;
output op1,op2,op3;
wire w1,w2,w22;

BS BS_1(.x1(ip1),.x2(ip2),.y1(w1),.y2(w2));
BS BS_2(.x1(w2),.x2(ip3),.y1(w22),.y2(op3));
//assign w1 = ip1 | ip2;
//assign w2 = ip1 & ip2;
//assign w22 = w2 | ip3;
//assign op3 = w2 & ip3;
//assign op1 = w1 | w22;
//assign op2 = w1 & w22;
BS BS_3(.x1(w1),.x2(w22),.y1(op1),.y2(op2));

endmodule