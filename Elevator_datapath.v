module Elevator_datapath(
    input clk,
    input rst,
    input ctrl,
    input [1:0] Req_floor,
    input door_wait,
    input door_close,
    output [1:0] Current_floor,
    output wait_complete,
    output [2:0] count, 
    output lt,gt,eq);
     
    floorreg mod1(clk,rst,Current_floor,Req_floor,ctrl);
    comparator mod2(rst,Current_floor,Req_floor,lt,gt,eq);
    counter mod3(clk,rst,door_wait,door_close,wait_complete,count);
    
endmodule