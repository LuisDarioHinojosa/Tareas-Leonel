module Controller(
	input clk,
	input rst,
   input sa,
   input za,
   input sv,
   input zv,
   output pa,
   output ta,
   output pv,
   output tv,
	output taen,
	output tven
);

parameter ResetTimerA = 3'b000;
parameter WaitA = 3'b001;
parameter PaceA = 3'b010;
parameter ResetTimerV = 3'b011;
parameter WaitV = 3'b100;
parameter PaceV = 3'b101;

reg [2:0] STATE, NEXT;


always @(posedge clk)
	begin
		if(rst) STATE <= ResetTimerA;
		else STATE <= NEXT;
	end


always@(*)
	begin
		case(STATE)
			//WAIT : NEXT = (s == 0 & z == 0) ? WAIT :  (s == 0 & z == 1) ? PACE : RT;
            ResetTimerA : NEXT = WaitA;
            WaitA : NEXT = ( sa == 0 & za == 0) ? WaitA : (sa == 0 & za == 1 ) ? PaceA : ResetTimerV;
            PaceA : NEXT = ResetTimerV;
            ResetTimerV : NEXT = WaitV;
            WaitV : NEXT = (sv == 0 & zv == 0) ? WaitV : (sv == 0 & zv == 1) ? PaceV : ResetTimerA;
            PaceV : NEXT = ResetTimerA;
		endcase
	end


assign pa = (STATE == PaceA);
assign ta = (STATE == ResetTimerA);
assign pv = (STATE == PaceV);
assign tv = (STATE == ResetTimerV);
assign tven = (STATE == WaitV);
assign taen = (STATE == WaitA);

endmodule

