module Sequence1011(
    input clk,
    input rst,
    input x,
    output z

);


parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;
parameter D = 2'b11;



reg [2:0] STATE, NEXT;

always @(posedge clk)
	begin
		if(rst) STATE <= A;
		else STATE <= NEXT;
	end

//     WaitV : NEXT = (sv == 0 & zv == 0) ? WaitV : (sv == 0 & zv == 1) ? PaceV : ResetTimerA;

always@(*)
    begin
        case(STATE)
            A: NEXT = (x == 0) ? A : B;
            B: NEXT = (x == 0) ? C : B;
            C: NEXT = (x == 0) ? A : D;
            D: NEXT = (x == 0) ? C : B;
        endcase
    end

assign z = (STATE == D) && x;


endmodule


/*
`timescale 1ns / 1ps

module seq_TB;
    reg x,clk,rst;
    wire z;

    Sequence1011 uut(.clk(clk),.rst(rst),.z(z));

    initial begin
        clk = 0;
        rst = 1;
        x = 0;

        #100;
        rst = 1;
        #100;
        // 1011011
        #5;
        x = 0;
        #5;
        x = 1;
        #5;
        x = 0;
        #5;
        x = 1;
        #5;
        #5;
        x = 0;
        #5;
        x = 1;
        #10;

        

    end

    initial begin
        forever #3 clk = ~clk; 
    end

endmodule

*/