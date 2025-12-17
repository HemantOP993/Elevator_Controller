module floorreg(
    input clk,
    input rst,
    output reg [1:0]current_floor,
    input [1:0] Req_floor,
    input ctrl);
    
    always @(posedge clk or posedge rst) begin   
        if(rst) begin
            current_floor <= 1;
        end
        else
            current_floor <= ctrl ? Req_floor:current_floor;
    end
    
endmodule 
    