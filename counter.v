module counter(
    input clk,rst, 
    input door_wait, 
    input door_close,
    output reg wait_complete,
    output reg [2:0] count);
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            wait_complete <= 0;
            count <= 0;
         end
        else  begin
            if(door_wait) begin
                count <= count+1;
            end
            if(count == 5) begin
                count <= 0;
                wait_complete <= 1;
            end
            else 
                wait_complete <= 0;
       end
    end
    
endmodule
      