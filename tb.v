module tb;
    reg clk;
    reg rst;
    reg [1:0] Req_floor;
    
    wire [1:0] Current_floor;
    wire [2:0] count;
    wire ctrl;
    wire door_wait;
    wire wait_complete;
    
    wire lt;
    wire gt;
    wire eq;
    
    wire motor_up;
    wire motor_down;
    wire door_open; 
    wire door_close;
    wire [2:0] state;
    
    Elevator_datapath mod1(clk,rst,ctrl,Req_floor,door_wait,door_close,
                        Current_floor,wait_complete,count,
                        lt,gt,eq);
    
    
    Elevator_controller mod2(clk,rst,lt,gt,eq,wait_complete,
                        motor_up,motor_down,door_open,door_close,
                        door_wait,ctrl,state);
                        
    always #5 clk=~clk;
    
    initial begin
        rst=1;clk=0;
        
        #2 rst=0;
        #1  Req_floor = 3;
        
    end
    
    initial #300 $finish;
    
endmodule