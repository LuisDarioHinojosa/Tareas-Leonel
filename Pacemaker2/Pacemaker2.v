module Pacemaker2(
    input rst,
    input clk,
    input sa,
    input sv,
    output pa,
    output pv
);


wire za,zv,ta,tv,Pa,Pv,taen,tven;

Controller pacemaker(.clk(clk),.rst(rst),.sa(sa),.sv(sv),.za(za),.zv(zv),.ta(ta),.tv(tv),.pa(Pa),.pv(Pv),.taen(taen),.tven(tven));

TimerA timera(.clk(clk),.rst(ta|rst),.en(taen),.tca(za));

TimerV timerv(.clk(clk),.rst(tv|rst),.en(tven),.tcv(zv));


assign pa = Pa;
assign pv = Pv;


endmodule
