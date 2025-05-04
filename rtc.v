`timescale 1ns / 1ps
module rtc (
    input clk,         
    input rst,alarm_en,         
    output reg [5:0] sec = 0,
    output reg [5:0] min = 0,
    output reg [4:0] hour = 0,
    input [5:0]alarm_hr,alarm_min,
    output reg alarm_out
);

    reg [3:0] clk_count = 0;

    always @(posedge clk) begin
        if (rst) begin
            clk_count <= 0;
            sec <= 0;
            min <= 0;
            hour <= 0;
            alarm_out <= 0;
        end
        else begin
            if (clk_count == 9) begin #here instead of the value 9 necessary clk freq should be given for eg " 100 Mega -1 " for basys 3
                clk_count <= 0;
                if (sec == 59) begin
                    sec <= 0;
                    if (min == 59) begin
                        min <= 0;
                        if (hour == 23)
                            hour <= 0;
                        else
                            hour <= hour + 1;
                    end
                    else
                        min <= min + 1;
                end
                else
                    sec <= sec + 1;
            end
            else begin
                clk_count <= clk_count + 1;
            end
        end
        if ((alarm_en) && (hour == alarm_hr)&& (min == alarm_min)) alarm_out <= 1;
        else alarm_out <= 0;
    end
endmodule
