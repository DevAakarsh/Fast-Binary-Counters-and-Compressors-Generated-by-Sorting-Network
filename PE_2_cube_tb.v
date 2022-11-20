`timescale 1ns / 1ps

module tb3();
    reg [7:0] a;
    wire [31:0] c; 
    a_cube uut(.a(a), .a3(c));
	
	initial begin
        a = 7;
    end
endmodule
