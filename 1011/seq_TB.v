`timescale 1ns / 1ps

module seq_TB;
    reg x;
    reg clk;
    reg rst;
    wire z;
    // Instantiate the Unit Under Test (UUT)
    Sequence1011 uut (
        .x(x), 
        .clk(clk), 
        .rst(rst), 
        .z(z)
    );
    
initial
    begin
        clk = 0;
        rst = 1;
        x = 0;
        #15; 
        rst = 0;


        #10;
        x = 0;
        #10;
        x = 0; 
        #10;
        x = 1; 
        #10;
        x = 0;
        #12;
        x = 1;
        #10;
        x = 1; 
        #10;
        x = 0; 
        #10;
        x = 1;
        #12; 
        x = 1;
        #10;
        x = 0; 
        #10;
        x = 1;
        #12; 
        x = 1;
        #10;
        x = 0;
        #10;
     
    end


/*
   x = 0; 
        #10;
        x = 1;
        #12;
        x = 0;
        #10;
        x = 1; 
        #10;
        x = 0 ;
        #10;
        x = 1; 
        #10;
        x = 1;
        #10;

*/

initial begin
    forever  #5 clk = ~ clk;  
end

    
endmodule


