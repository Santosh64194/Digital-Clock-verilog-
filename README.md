# Alarm clock

This project implements a digital alarm clock using Verilog HDL. The system operates with a 10 Hz (for simulation purpose can be changed) input clock, which is internally divided to generate 1-second pulses. It maintains and displays values of seconds, minutes, and hours in a 24-hour format. The clock includes alarm feature, allowing the user to set alarm values for hours and minutes through input ports. When the current time matches the set alarm time and the alarm is enabled, an alarm_active signal is triggered. The alarm can also be cleared externally using a reset signal.
