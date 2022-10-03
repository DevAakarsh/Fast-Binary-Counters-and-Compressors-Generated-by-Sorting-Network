`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2022 18:56:37
// Design Name: 
// Module Name: counter_7
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




module counter_7(in[6],in[5],in[4],in[3],in[2],in[1],in[0],s,c1,c2);

output s,c1,c2;
input [6:0] in;
//assign in = 7'b0111011;
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



module HA(a,b,s,c);
input a,b;
output s,c;
assign c= a&b;
assign s= a^b;
endmodule

module FA(a,b,cin,s,c);
input a,b,cin;
output s,c;
assign s=a^(b^cin);
assign c=(cin &(a^b)) | (a & b);
endmodule

module counter_mult(a,b,y);
input wire [7:0] a,b;
wire sx0,sx1,sx2,c0x0,c0x1,c0x2,c1x1,c1x2,c1x0;
wire [12:0] s1,c1;
wire [12:0] s2,c2;
wire [9:0] s3,c3;
wire [4:0] s4,c4;
wire [16:0] a1,b1;
output wire [17:0] y;
integer i;

reg [7:0] p0;
reg [7:0] p1;
reg [7:0] p2;
reg [7:0] p3;
reg [7:0] p4;
reg [7:0] p5;
reg [7:0] p6;
reg [7:0] p7;

always @(a or b)
begin
for(i=0;i<8;i=i+1) begin
p0[i]<=a[i] & b[0];
p1[i]<=a[i] & b[1];
p1[i]<=a[i] & b[2];
p1[i]<=a[i] & b[3];
p1[i]<=a[i] & b[4];
p1[i]<=a[i] & b[5];
p1[i]<=a[i] & b[6];
p1[i]<=a[i] & b[7];
end
end

HA h0(p0[2], p1[1], s1[0], c1[0]);
FA f1(p0[3], p1[2], p2[1], s1[1], c1[1]);
FA f2(p0[4], p1[3], p2[2], s1[2],c1[2]);
HA h1(p3[1], p4[0], s1[9], c1[9]);
FA f4(p0[5], p1[4], p2[3], s1[3], c1[3]);
FA f5(p3[2], p4[1], p5[0], s1[10], c1[10]);
counter_7 x0(p0[6], p1[5], p2[4], p3[3], p4[2], p5[1], p6[0], sx0,c0x0, c1x0);
counter_7 x1(p0[7], p1[6], p2[5], p3[4], p4[3], p5[2], p6[1], sx1,c0x1, c1x1);
counter_7 x2(p1[7], p2[6], p3[5], p4[4], p5[3], p6[2], p7[1], sx2,c0x2, c1x2);
FA f6 (p2[7],p3[6],p4[5],s1[4],c1[4]);
FA f7 (p5[4],p6[3],p7[2],s1[11],c1[11]);
FA f8 (p3[7],p4[6],p5[5],s1[5],c1[5]);
HA f9 (p6[4],p7[3],s1[12],c1[12]);
FA f10 (p4[7],p5[6],p6[5],s1[6],c1[6]);
FA f11 (p5[7],p6[6],p7[5],s1[7],c1[7]);
HA f12 (p6[7],p7[6],s1[8],c1[8]);

HA h40 (s1[1], c1[0], s2[12], c2[12]);
FA f28(s1[2], s1[9], c1[1], s2[0], c2[0]);
FA f29(s1[3], s1[10], c1[2], s2[1], c2[1]);
FA f30(sx0,c1[3],c1[10],s2[2],c2[2]);
FA f44(c0x0,sx1,p7[0],s2[3],c2[3]);
FA f31(c1x0,c0x1,sx2,s2[4],c2[4]);
FA f32(s1[4],c1x1,c0x2,s2[5],c2[5]);
FA f33(s1[5], c1[4],c1x2,s2[6],c2[6]);
HA h34(c1[11],s1[12],s2[7],c2[7]);
FA f35(s1[6], p7[4], c1[5],s2[8],c2[8]);
HA f36(s1[7],c1[6],s2[9],c2[9]);
HA f37(s1[8],c1[7],s2[10],c2[10]);
HA f38(p7[7],c1[8],s2[11],c2[11]);

HA h42 (s2[1], c2[0], s3[0], c3[0]);
HA h52 (s2[2], c2[1], s3[1], c3[1]);
HA h53 (s2[3], c2[2], s3[2], c3[2]);
HA h54 (s2[4], c2[3], s3[3], c3[3]);
FA f55 (s2[5], c2[4], s1[11], s3[4], c3[4]);
FA f56 (s2[6], s2[7], c2[5], s3[5], c3[5]);
FA f57 (s2[8], c2[6], c2[7], s3[6], c3[6]);
HA h55 (s2[9], c2[8], s3[7], c3[7]);
HA h56 (s2[10], c2[9], s3[8], c3[8]);
HA h57 (s2[11], c2[10], s3[9], c3[9]);

HA h64 (s3[6], c3[5], s4[0], c4[0]);
HA h65 (s3[7], c3[6], s4[1], c4[1]);
HA h66 (s3[8], c3[7], s4[2], c4[2]);
HA h67 (s3[9], c3[8], s4[3], c4[3]);
HA h68 (c2[11], c3[9], s4[4], c4[4]);

assign a1={1'b0, s4[4], s4[3], s4[2], s4[1], s4[0], s3[5], s3[4], s3[3], s3[2], s3[1], s3[0], s2[0], s2[12], s1[0], p0[1], p0[0]};
assign b1={c4[4], c4[3], c4[2], c4[1], c4[0], c1[12], c3[4], c3[3], c3[2], c3[1], c3[0], c1[9], c2[12], p3[0], p2[0], p1[0],1'b0};

assign y=a1+b1;
endmodule

module tb;

 reg [7:0] A;
 reg [7:0] B;
 wire [17:0] y;
 
 counter_mult DUT (A,B,y);
 
 initial
 repeat(1)
 begin
 
 #10 A=3; B=2;
 #100
 
 $display("A=%b, B=%b, y=%b", (A), (B), (y));
 
 end  
 endmodule