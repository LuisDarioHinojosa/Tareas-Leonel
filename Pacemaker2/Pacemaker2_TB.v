`timescale 1ns / 1ps
module Pacemaker2_TB;

	reg clk;
	reg rst;
	reg sa;
	reg sv;

    wire pa,pv;
	Pacemaker2 uut (
	.clk(clk), 
	.rst(rst), 
        .sa(sa),
        .sv(sv),
        .pa(pa),
        .pv(pv)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		sa = 0;
		sv = 0;



		// Wait 100 ns for global reset to finish
		#50;
		rst = 0;  // turning off the reset
		/*
		#250;
		sa = 1;
		#10;
		sa = 0;
		#256;
		sv = 1;
		#10;
		sv = 0;


		#240;
		sv = 1;
		#10;
		sv = 0;
		#50;
		sa = 1;
		#10;
		sa = 0;
		#220;
		sv = 1;
		#10;
		sv = 0;
		#100;

*/

	end
	
	initial begin
		forever #3 clk = ~clk; 
	end
      
endmodule
