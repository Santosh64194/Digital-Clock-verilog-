`timescale 1ns / 1ps

module tb_rtc;

    reg clk = 0;
    reg rst = 0;
    reg [5:0]alarm_hr,alarm_min;
    reg alarm_en;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire alarm_out;

    rtc uut (
        .clk(clk),
        .rst(rst),
        .sec(sec),
        .min(min),
        .hour(hour),
        .alarm_out(alarm_out),
        .alarm_min(alarm_min),
        .alarm_hr(alarm_hr),
        .alarm_en(alarm_en)
    );

    
    always #50 clk = ~clk;

    initial begin

        rst = 1;
        #100;
        rst = 0;
        alarm_en = 1;
        alarm_hr = 10; #alarm is enabled and the time is set at 10:20
        alarm_min = 20;

        
        #200000;
        $finish;
    end
endmodule
