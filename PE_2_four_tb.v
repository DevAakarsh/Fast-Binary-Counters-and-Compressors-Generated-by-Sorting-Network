`timescale 1ns / 1ps

module tb4();
    reg [7:0] a;
    wire [31:0] c; 
    a_four uut(.a(a), .a4(c));
	
	initial begin
        a = 7;
    end
endmodule
