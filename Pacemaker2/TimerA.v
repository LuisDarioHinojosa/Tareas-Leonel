// UP TO 30 CLICKS
module TimerA(
    input clk,
    input rst,
    input en,
    output tca
);

reg [5:0] count;
wire [5:0] nextCount;

assign nextCount = count-1;


always @(posedge clk) 
    begin
        if(rst) count <= 2'd29;
        else if(en) count <= nextCount;
    end

assign tca =  (count == 0);


endmodule
