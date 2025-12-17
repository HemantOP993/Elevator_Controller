module comparator(
        input rst,
        output [1:0] current_floor,
        input [1:0] Req_floor,
        output reg lt,gt,eq);  
        
        
        always @(*) begin
        if(rst) begin
            lt=0;gt=0;eq=0;
        end
       else begin
//                if(current_floor > Req_floor) begin
//                    lt = 1;gt = 0;eq = 0;
//                end
//                else if(current_floor < Req_floor) begin
//                     lt = 0;gt = 1;eq = 0;
//                end
//                else if(current_floor == Req_floor) begin
//                    lt = 0;gt = 0;eq = 1;
//                end
//                else
//                     lt = 0;gt = 0;eq = 0;
                lt = current_floor > Req_floor;
                gt = current_floor < Req_floor;
                eq = current_floor == Req_floor;
                
             end
        end
endmodule