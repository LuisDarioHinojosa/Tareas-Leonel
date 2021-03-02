// UP TO 44 CLICKS
module TimerV(
    input clk,
    input rst,
    input en,
    output tcv
);




reg [6:0] count;
wire [6:0] nextCount;


assign nextCount = count-1;


always @(posedge clk) 
    begin
        if(rst) count <= 2'd44;
        else if(en) count <= nextCount;
    end


assign tcv =  (count == 0);


endmodule
