module counter_7(a1,a2,a3,a4,a5,a6,a7,s,c0,c1); 
    input a1,a2,a3,a4,a5,a6,a7;
    output s,c0,c1;
    assign {c1,c0,s}= a1 + a2 + a3 + a4 + a5 + a6 + a7;
endmodule

module counter_15(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,s,c0,c1,c2);
    input a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
    output s,c0,c1,c2;
    assign {c2,c1,c0,s} = a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15;
endmodule

module HA(a,b,s,c);
    input a,b;
    output s,c;
    assign c = a&b;
    assign s = a^b;
endmodule

module FA(a,b,cin,s,c);
    input a,b,cin;
    output s,c;
    assign s = a^ (b ^ cin);
    assign c =(cin & (a ^ b))|( a & b);
endmodule
/*
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
*/
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


module counter_mult_8bit(a,b,y);
input wire [7:0] a,b;
wire sx0,sx1,sx2,c0x0,c0x1,c0x2,c1x1,c1x2,c1x0;
wire [12:0] s1,c1;
wire [12:0] s2,c2;
wire [9:0] s3,c3;
wire [4:0] s4,c4;
wire [16:0] a1,b1;
output wire [15:0] y;
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
p2[i]<=a[i] & b[2];
p3[i]<=a[i] & b[3];
p4[i]<=a[i] & b[4];
p5[i]<=a[i] & b[5];
p6[i]<=a[i] & b[6];
p7[i]<=a[i] & b[7];
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


module counter_mult_16bit(a,b,y);
// module counter_mult(y);

    input wire [15:0] a;
    input wire [15:0] b;
    
    // wire [15:0] a;
    // wire [15:0] b;
    
    wire sx0,sx1,sx2,sx3,sx4,sx5,sx6,sx7,sx8,sx9,sx10,sx11,sx12,sx13,sx14,sx15,sx16,sx17,sx18,sx19,sx20,sx21,sx22;
    wire c0x0,c0x1,c0x2,c0x3,c0x4,c0x5,c0x6,c0x7,c0x8,c0x9,c0x10,c0x11,c0x12,c0x13,c0x14,c0x15,c0x16,c0x17,c0x18,c0x19,c0x20,c0x21,c0x22;
    wire c1x0,c1x1,c1x2,c1x3,c1x4,c1x5,c1x6,c1x7,c1x8,c1x9,c1x10,c1x11,c1x12,c1x13,c1x14,c1x15,c1x16,c1x17,c1x18,c1x19,c1x20,c1x21,c1x22;
    wire c2x8,c2x9,c2x10,c2x11,c2x12,c2x13,c2x14;
    
    wire sa0,sa1,sa2,sa3;
    wire c0a0,c0a1,c0a2,c0a3;
    wire c1a0,c1a1,c1a2,c1a3;
    wire [14:0] s1;
    wire [14:0] c1;
    wire [31:0] l,k;
    wire [25:0] s2;
    wire [25:0] c2;
    wire [19:0] s3;
    wire [19:0] c3;
    
    output wire [31:0] y;
    integer i;
    
    //start generating partial products
    reg [15:0] p0;
    reg [15:0] p1;
    reg [15:0] p2;
    reg [15:0] p3;
    reg [15:0] p4;
    reg [15:0] p5;
    reg [15:0] p6;
    reg [15:0] p7;
    reg [15:0] p8;
    reg [15:0] p9;
    reg [15:0] p10;
    reg [15:0] p11;
    reg [15:0] p12;
    reg [15:0] p13;
    reg [15:0] p14;
    reg [15:0] p15;
    
    //calculate partial products
    
    always @(a or b) begin
        for(i=0;i<16;i=i+1) begin 
                p0[i] <= a[i] & b[0];
                p1[i] <= a[i] & b[1];
                p2[i] <= a[i] & b[2];
                p3[i] <= a[i] & b[3];
                p4[i] <= a[i] & b[4];
                p5[i] <= a[i] & b[5];
                p6[i] <= a[i] & b[6];
                p7[i] <= a[i] & b[7];
                p8[i] <= a[i] & b[8];
                p9[i] <= a[i] & b[9];
                p10[i] <= a[i] & b[10];
                p11[i] <= a[i] & b[11];
                p12[i] <= a[i] & b[12];
                p13[i] <= a[i] & b[13];
                p14[i] <= a[i] & b[14];
                p15[i] <= a[i] & b[15];
          end
    end
    
    //First stage start
    
    HA h0(p0[2],p1[1],s1[0],c1[0]);
    FA f1(p0[3],p1[2],p2[1],s1[1],c1[1]);
    FA f2(p0[4],p1[3],p2[3],s1[2],c1[2]);
    HA h1(p3[1],p4[0],s1[3],c1[3]);
    
    counter_7 x0 (p0[5],p1[4],p2[3],p3[2],p4[1],p5[0], 1'b0,sx0,c0x0,c1x0);
    counter_7 x1 (p0[6],p1[5],p2[4],p3[3],p4[2],p5[1],p6[0],sx1,c0x1,c1x1);
    counter_7 x2 (p0[7],p1[6],p2[5],p3[4],p4[3],p5[2],p6[1],sx2,c0x2,c1x2);
    counter_7 x3 (p0[8],p1[7],p2[6],p3[5],p4[4],p5[3],p6[2],sx3,c0x3,c1x3);
    
    HA h2(p7[1],p8[0],s1[4],c1[4]);
    counter_7 x4 (p0[9],p1[8],p2[7],p3[6],p4[5],p5[4],p6[3],sx4,c0x4,c1x4);
    
    FA f3(p7[2],p8[1],p9[0],s1[5],c1[5]);
    counter_7 x5 (p0[10],p1[9],p2[8],p3[7],p4[6],p5[5],p6[4],sx5,c0x5,c1x5);
    
    FA f4(p7[3],p8[3],p9[1],s1[6],c1[6]);
    counter_7 x6 (p0[11],p1[10],p2[9],p3[8],p4[7],p5[6],p6[5],sx6,c0x6,c1x6);
    counter_7 x7 (p7[4],p8[3],p9[2],p10[1],p11[0],1'b0,1'b0,sx7,c0x7,c1x7);
    
    counter_15 x8 ( p0[12],p1[11], p2[10], p3[9], p4[8], p5[7], p6[6], p7[5], p8[4], p9[3], p10[2], p11[1], p12[0], 1'b0,1'b0,sx8,c0x8,c1x8,c2x8);
    counter_15 x9 ( p0[13],p1[12], p2[11], p3[10], p4[9], p5[8], p6[7], p7[6], p8[5], p9[4], p10[3], p11[2], p12[1], p13[0],1'b0,sx9,c0x9,c1x9,c2x9);
    counter_15 x10 ( p0[14],p1[13], p2[12], p3[12], p4[10], p5[9], p6[8], p7[7], p8[6], p9[5], p10[4], p11[3], p12[2], p13[1],p14[0],sx10,c0x10,c1x10,c2x10);
    counter_15 x11 ( p0[15],p1[14], p2[13], p3[2], p4[11], p5[10], p6[9], p7[8], p8[7], p9[6], p10[5], p11[4], p12[3], p13[2],p14[1],sx11,c0x11,c1x11,c2x11);
    
    counter_15 x12 ( p1[15],p2[14], p3[13], p4[12], p5[11], p6[10], p7[9], p8[8], p9[7], p10[6], p11[5], p12[4], p13[3], p14[2],p15[1],sx12,c0x12,c1x12,c2x12);
    counter_15 x13 ( p2[15],p3[14], p4[13], p5[2], p6[11], p7[10], p8[9], p9[8], p10[7], p11[6], p12[5], p13[4], p14[3], p15[2],1'b0,sx13,c0x13,c1x13,c2x13);
    counter_15 x14 ( p3[15],p4[14], p5[13], p6[2], p7[11], p8[10], p9[9], p10[8], p11[7], p12[6], p13[5], p14[4], p15[3], 1'b0,1'b0,sx14,c0x14,c1x14,c2x14);
    
    
    counter_7 x15 (p4[15],p5[14],p6[13],p7[12],p8[11], p9[10],p10[9],sx15,c0x15,c1x15);
    counter_7 x16 (p11[8],p12[7],p13[6],p14[5],p15[4], 1'b0,1'b0,sx16,c0x16,c1x16);
    
    counter_7 x17 (p5[15],p6[14],p7[13],p8[12],p9[11], p10[10],p11[9],sx17,c0x17,c1x17);
    
    FA f5 (p12[8],p13[7],p14[6],s1[7],c1[7]);
    FA f6 (p13[8],p14[7],p15[6],s1[8],c1[8]);
    
    counter_7 x18 (p6[15],p7[14],p8[13],p9[12],p10[11],p11[10],p12[9],sx18,c0x18,c1x18);
    counter_7 x19 (p7[15],p8[14],p9[13],p10[12],p11[11],p12[10],p13[9],sx19,c0x19,c1x19);
    
    HA h22 (p14[8],p15[7],s1[9],c1[9]);
    
    counter_7 x20 (p8[15],p9[14],p10[13],p11[12],p12[11],p13[10],p14[9],sx20,c0x20,c1x20);
    counter_7 x21 (p9[15],p10[14],p11[13],p12[12],p13[11],p14[10],p15[9],sx21,c0x21,c1x21);
    counter_7 x22 (p10[15],p11[14],p12[13],p13[12],p14[11],p15[10],1'b0,sx22,c0x22,c1x22);
    
    HA h3 (p14[12],p15[11],s1[10],c1[10]);
    FA f7 (p11[15],p12[14],p13[13],s1[11],c1[11]);
    FA f8 (p12[15],p13[14],p14[13],s1[12],c1[12]);
    FA f9 (p13[15],p14[14],p15[13],s1[13],c1[13]);
    HA h4 (p14[15],p15[14],s1[14],c1[14]);
    //First stage done
    
    
    //second stage done
    HA h5 (s1[1],c1[0],l[0],k[0]);
    
    FA f10 (s1[2],s1[3],c1[1], l[1], k[1]);
    FA f11 (sx0,c1[2],c1[3],l[2],k[2]);
    HA h6 (sx1,c0x0,l[3],k[3]);
    FA f12(sx2,c0x1,c1x0,l[4],k[4]);
    FA f13 (sx3,c0x2,c1x1, l[5],k[5]);
    FA f14(sx4, c0x3, c1x2, l[6],k[6]);
    HA h7 ( c1[4],s1[5],l[7],k[7]);
    
    counter_7 a0 (sx5, c0x4, c1x3, s1[6], c1[5], p10[0], 1'b0, sa0, c0a0, c1a0);
    
    FA f15 (sx6, c0x5, c1x4, l[8], k[8]);
    HA h8  (sx7, c1[6], l[9],k[9]);
    FA f16 (sx8, c0x6, c1x5, l[10], k[10]);
    FA f17 (sx9, c0x8, c1x6, l[11],k[11]);
    FA f18 (sx10,c0x9,c1x8, l[12], k[12]);
    FA f19 (sx11, c0x10, c1x9, l[13],k[13]);
    HA h88 ( c2x8, p15[0], l[14], k[14]);
    FA f20 (sx12, c0x11, c1x10, l[15],k[15]);
    FA f21 (sx13, c0x12, c1x11, l[16],k[16]);
    FA f22 (sx14, c0x13, c1x12, l[17],k[17]);
    FA f23 (sx15, c0x14, c1x13, l[18], k[18]);
    HA h9 (c2x12, sx16, l[19], k[19]);
    counter_7 a1 (sx17, c0x15, c1x14, c2x13, s1[7], c0x16, p15[5], sa1, c0a1, c1a1);
    counter_7 a2 (sx18, c0x17, c1x15, c2x14, c1[7], c1x16, s1[8], sa2, c0a2, c1a2);
    
    FA f24 (sx19, c0x18, c1x17, l[20],k[20]);
    HA h10 (s1[9], c1[8], l[21],k[21]);
    FA f25 (sx20, c0x19, c1x18, l[22], k[22]);
    HA h11 (p15[8], c1[9], l[23], k[23]);
    FA f26 (sx21,c0x20,c1x19, l[24],k[24]);
    FA f27 (sx22, c0x21, c1x20, l[25],k[25]);
    FA f28 (s1[11], c0x22, c1x21, l[26],k[26]);
    FA f29 (c1[11],s1[12],c1x22,l[27],k[27]);
    HA h12 (c1[10], p15[12], l[28],k[28]);
    HA h13 (c1[12],s1[13],l[29],k[29]);
    HA h14 (c1[13],s1[14],l[30],k[30]);
    HA h15 (c1[14],p15[15],l[31],k[31]);
    //second done
    
    
    //third stage
    HA h16 (l[4],k[3],s2[0],c2[0]);
    FA f30 (l[5],k[4], s1[4], s2[1], c2[1]);
    FA f31 (l[6],k[5],l[7],s2[2],c2[2]);
    FA f32 (k[6],k[7],sa0,s2[3],c2[3]);
    FA f33 (l[8],l[9],c0a0,s2[4],c2[4]);
    FA f34 (k[8],k[9],c1a0, s2[5], c2[5]);
    
    HA h17 (l[10], c0x7, s2[6], c2[6]);
    FA f35 (l[11], k[10], c1x7, s2[7],c2[7]);
    
    HA h18 (k[11],l[12],s2[8],c2[8]);
    FA f36 (k[12],l[13],l[14],s2[9],c2[9]);
    FA f37 (k[13],k[14],l[15], s2[10], c2[10]);
    FA f38 (l[16],k[15],c2x10,s2[11],c2[11]);
    FA f39 (l[17],k[16],c2x11,s2[12],c2[12]);
    FA f40 (k[17],l[18],l[19],s2[13],c2[13]);
    FA f41 (k[18],k[19],sa1,s2[14],c2[14]);
    HA h19 (sa2, c0a1, s2[15], c2[15]);
    
    FA f42 (l[21],l[20],c0a2,s2[16],c2[16]);
    FA f43 (k[21],k[20],c1a2,s2[17],c2[17]);
    HA h20 (l[22],l[23],s2[18],c2[18]);
    FA f44 (k[22],k[23],l[24],s2[19],c2[19]);
    HA h21 (k[24],l[25],s2[20],c2[20]);
    FA f45 (k[25],s1[10],l[26],s2[21],c2[21]);
    FA f46 (k[26],l[27],l[28],s2[22],c2[22]);
    FA f47 (k[27],k[28],l[29], s2[23],c2[23]);
    HA h222(k[29],l[30],s2[24],c2[24]);
    HA h23 (k[30],l[31],s2[25],c2[25]);
    //third stage
    
    //fourth stage
    FA f48 (s2[5],s2[6],c2[4],s3[0],c3[0]);
    FA f49 (s2[7],c2[6],c2[5],s3[1],c3[1]);
    HA h24 (s2[8],c2[7],s3[2],c3[2]);
    HA h25 (s2[9],c2[8],s3[3],c3[3]);
    FA f50 (s2[10],c2[9],c2x9,s3[4],c3[4]);
    HA h26 (s2[11],c2[10],s3[5],c3[5]);
    HA h27 (s2[12],c2[11],s3[6],c3[6]);
    HA h28 (s2[13],c2[12],s3[7],c3[7]);
    HA h29 (s2[14],c2[13],s3[8],c3[8]);
    HA h30 (s2[15],c2[14],s3[9],c3[9]);
    FA f51 (s2[16],c2[15],c1a1,s3[10],c3[10]);
    FA f52 (s2[17],s2[18],c2[16],s3[11],c3[11]);
    FA f53 (s2[19],c2[17],c2[18],s3[12],c3[12]);
    
    HA h31 (s2[20],c2[19],s3[13],c3[13]);
    HA h32 (s2[21],c2[20],s3[14],c3[14]);
    HA h33 (s2[22],c2[21],s3[15],c3[15]);
    HA h34 (s2[23],c2[22],s3[16],c3[16]);
    HA h35 (s2[24],c2[23],s3[17],c3[17]);
    HA h36 (s2[25],c2[24],s3[18],c3[18]);
    HA h37 (k[31],c2[25],s3[19],c3[19]);
    //fourth stage done
    
    
    wire [32:0] aa1;
    wire [32:0] bb1;
    
    assign aa1 = {1'b0, s3[19], s3[18], s3[17], s3[16], s3[15], s3[14], s3[13], s3[12], s3[11], s3[10], s3[10], s3[9], s3[8], s3[7], s3[6], s3[5], s3[4],s2[3], s3[2],s3[1], s3[0], s2[4],s2[3],s2[2],s2[1],s2[0],k[2],l[2],k[0],l[0],s1[0],p0[1],p0[0]};
    
    assign bb1 = {c3[19],c3[18],c3[17],c3[16],c3[15],c3[14],c3[13],c3[12],c3[11],c3[10],c3[9],c3[8],c3[7],c3[6],c3[5],c3[4],c3[3],c3[2],c3[1],c3[0],1'b0,c2[3],c2[2],c2[1],c2[0],p7[0],l[3],k[1],l[1],p3[0],p2[0],p1[0],1'b0};
    
    assign y = aa1 + bb1;

endmodule

module a_four(a, a4);

	input [7:0] a;
	output [31:0] a4;
	
	wire [15:0] temp1;

	counter_mult_8bit u1(.a(a),.b(a),.y(temp1)); // a square -> 16 bits
	counter_mult_16bit u2(.a(temp1),.b(temp1),.y(a4)); // a raise to four -> 32 bits
	

endmodule



