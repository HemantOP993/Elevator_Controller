module Elevator_controller(
    input clk,rst,
    input lt,gt,eq,wait_complete,
    
    output reg motor_up,motor_down,door_open,door_close,door_wait,ctrl,
    output reg [2:0] state);
    
    parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5;
    
    
    always @(*) begin
        if(rst) begin
            motor_up = 0;
            motor_down = 0;
            door_open = 0;
            door_close = 1;
        end
        else begin
            case(state) 
                S0: begin
                    motor_up <= 0;motor_down <= 0;door_open <= 0; door_close <= 1;door_wait=0;ctrl <= 0;
                end
                S1: begin
                    motor_up <= 1;motor_down <= 0;door_open <= 0; door_close <= 0;door_wait=0;ctrl <= 0;
                end
                S2: begin
                    motor_up <= 0;motor_down <= 1;door_open <= 0; door_close <= 0;door_wait=0;ctrl <= 0;
                end
                S3: begin
                    motor_up <= 0;motor_down <= 0;door_open <= 1; door_close <= 0;door_wait=0;ctrl <= 0;
                end
                S4: begin
                    motor_up <= 0;motor_down <= 0;door_open <= 1; door_close <= 0;door_wait=1;ctrl <= 0;
                end
                S5: begin
                    motor_up <= 0;motor_down <= 0;door_open <= 0; door_close <= 1;door_wait=0;ctrl <= 1;
                end
            endcase
        end 
   end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= S0;
        end
        
        else begin
            case(state) 
                S0: begin
                        case({lt,eq,gt})
//                            3'b000: state <= S0; 
                            3'b100: state <= S3;
                            3'b010: state <= S3;
                            3'b001:state <= S3;
                            default:state <= S0;
                            
                        endcase
                end
                S1: state <= S4;
                S2: state <= S4;
                S3: begin
                    case({lt,eq,gt}) 
                        3'b100: state <= S2;
                        3'b010: state <= S4;
                        3'b001:state <= S1;
                    endcase
                end
                S4: state <= wait_complete ? S5:S4;
                S5: state <= S0;
                default: state<=S0;
                endcase
          end
     end
     
endmodule
                
                  
                            