`timescale 1ns / 1ps


module counter_15_4 (s,c1,c2,c3);

output s,c1,c2,c3;
wire [14:0] in;
assign in = 15'b010101110010111;
wire o1,o2,o3,o4,o5,o6,o7,o8,op1,op2,op3,op4,op5,op6,op7;
wire [9:0] a;
wire [8:0] b;
wire p0,p1,p2,p3,p4,q0,q1,q2,q3;

SN_8 S8(.i1(in[14]),.i2(in[13]),.i3(in[12]),.i4(in[11]),.i5(in[10]),.i6(in[9]),.i7(in[8]),.i8(in[7]),.o1(o1),.o2(o2),.o3(o3),.o4(o4),.o5(o5),.o6(o6),.o7(o7),.o8(o8));
SN_7 S7(.ip1(in[6]),.ip2(in[5]),.ip3(in[4]),.ip4(in[3]),.ip5(in[2]),.ip6(in[1]),.ip7(in[0]),.op1(op1),.op2(op2),.op3(op3),.op4(op4),.op5(op5),.op6(op6),.op7(op7));

assign a = {o1,o1,o2,o3,o4,o5,o6,o7,o8,o8};
assign b = {op1,op1,op2,op3,op4,op5,op6,op7,op7};

assign p0 = (a[9] & (~a[8]));
assign p1 = (a[8] & (~a[7]));
assign p2 = (a[7] & (~a[6]));
assign p3 = (a[6] & (~a[5]));
assign p4 = (a[5] & (~a[4]));
assign p5 = (a[4] & (~a[3]));
assign p6 = (a[3] & (~a[2]));
assign p7 = (a[2] & (~a[1]));
assign p8 = (a[1] & (~a[0]));


assign q0 = (b[8] & (~b[7]));
assign q1 = (b[7] & (~b[6]));
assign q2 = (b[6] & (~b[5]));
assign q3 = (b[5] & (~b[4]));
assign q4 = (b[4] & (~b[3]));
assign q5 = (b[3] & (~b[2]));
assign q6 = (b[2] & (~b[1]));
assign q7 = (b[1] & (~b[0]));

assign s = (p1 | p3 | p5 | p7) ^ (q1 | q3 | q5 | q7);
assign c1 = (((a[7] & ~a[5]) | (a[3] & ~a[1])) ? (q0 | q4) : (q2 | q6)) | (((a[8] & ~a[5]) | (a[4] & ~a[2])) ? (q1 | q5) : (q3 | q7));
assign c2 = ((a[5] & ~a[1]) ? q0 : q4) | ((a[6] & ~a[2]) ? q1 : q5) | ((a[7] & ~a[3]) ? q2: q6) | ((a[8] & ~a[4]) ? q3: q7);
assign c3= (a[8] & b[1]) | (a[7] & b[2]) | (a[6] & b[3]) | (a[5] & b[4]) | (a[4] & b[5]) | (a[3] & b[6]) | (a[2] & b[8]) | a[1];
    
endmodule

module BS(x1,x2,y1,y2);

input x1,x2;
output y1,y2;

assign y1 = x1 | x2;
assign y2 = x1 & x2;

endmodule

module SN_8(i1,i2,i3,i4,i5,i6,i7,i8,o1,o2,o3,o4,o5,o6,o7,o8);

output o1,o2,o3,o4,o5,o6,o7,o8;
input i1,i2,i3,i4,i5,i6,i7,i8;
wire w11,w12,w13,w14,w5,w21,w22,w23,w24,w25,w31,w32,w33,w34,w35,w41,w42,w43,w44,w45,w51,w52,w53,w54,w55,w61,w62,w63,w64,w65,w71,w72,w73,w74,w75,w81,w82,w83,w84,w85;

BS BS_1(.x1(i1),.x2(i2),.y1(w11),.y2(w21));
BS BS_2(.x1(i3),.x2(i4),.y1(w31),.y2(w41));
BS BS_3(.x1(i5),.x2(i6),.y1(w51),.y2(w61));
BS BS_4(.x1(i7),.x2(i8),.y1(w71),.y2(w81));
BS BS_5(.x1(w11),.x2(w41),.y1(w12),.y2(w42));
BS BS_6(.x1(w51),.x2(w81),.y1(w52),.y2(w82));
BS BS_7(.x1(w21),.x2(w31),.y1(w22),.y2(w32));
BS BS_8(.x1(w61),.x2(w71),.y1(w62),.y2(w72));
BS BS_9(.x1(w12),.x2(w22),.y1(w13),.y2(w23));
BS BS_10(.x1(w32),.x2(w42),.y1(w33),.y2(w43));
BS BS_11(.x1(w52),.x2(w62),.y1(w53),.y2(w63));
BS BS_12(.x1(w72),.x2(w82),.y1(w73),.y2(w83));
BS BS_13(.x1(w13),.x2(w83),.y1(w14),.y2(w84));
BS BS_14(.x1(w23),.x2(w73),.y1(w24),.y2(w74));
BS BS_15(.x1(w33),.x2(w63),.y1(w34),.y2(w64));
BS BS_16(.x1(w43),.x2(w53),.y1(w44),.y2(w54));
BS BS_17(.x1(w14),.x2(w34),.y1(w15),.y2(w35));
BS BS_18(.x1(w54),.x2(w74),.y1(w55),.y2(w75));
BS BS_19(.x1(w24),.x2(w44),.y1(w25),.y2(w45));
BS BS_20(.x1(w64),.x2(w84),.y1(w65),.y2(w85));
BS BS_21(.x1(w15),.x2(w25),.y1(o1),.y2(o2));
BS BS_22(.x1(w35),.x2(w45),.y1(o3),.y2(o4));
BS BS_23(.x1(w55),.x2(w65),.y1(o5),.y2(o6));
BS BS_24(.x1(w75),.x2(w85),.y1(o7),.y2(o8));


endmodule

module SN_7(ip1,ip2,ip3,ip4,ip5,ip6,ip7,op1,op2,op3,op4,op5,op6,op7);

input ip1,ip2,ip3,ip4,ip5,ip6,ip7;
output op1,op2,op3,op4,op5,op6,op7;
wire w11,w12,w21,w22,w23,w31,w32,w33,w34,w35,w41,w42,w43,w44,w51,w52,w53,w54,w55,w61,w62,w71,w72,w73,w63;

BS BS_1(.x1(ip1),.x2(ip7),.y1(w11),.y2(w71));
BS BS_2(.x1(ip3),.x2(ip4),.y1(w31),.y2(w41));
BS BS_3(.x1(ip5),.x2(ip6),.y1(w51),.y2(w61));
BS BS_4(.x1(w11),.x2(w31),.y1(w12),.y2(w32));
BS BS_5(.x1(ip2),.x2(w51),.y1(w21),.y2(w52));
BS BS_6(.x1(w41),.x2(w71),.y1(w42),.y2(w72));
BS BS_7(.x1(w12),.x2(w21),.y1(op1),.y2(w22));
BS BS_8(.x1(w32),.x2(w61),.y1(w33),.y2(w62));
BS BS_9(.x1(w42),.x2(w52),.y1(w43),.y2(w53));
BS BS_10(.x1(w22),.x2(w33),.y1(w23),.y2(w34));
BS BS_11(.x1(w53),.x2(w72),.y1(w54),.y2(w73));
BS BS_12(.x1(w34),.x2(w43),.y1(w35),.y2(w44));
BS BS_13(.x1(w54),.x2(w62),.y1(w55),.y2(w63));
BS BS_14(.x1(w23),.x2(w35),.y1(op2),.y2(op3));
BS BS_15(.x1(w44),.x2(w55),.y1(op4),.y2(op5));
BS BS_16(.x1(w63),.x2(w73),.y1(op6),.y2(op7));


endmodule