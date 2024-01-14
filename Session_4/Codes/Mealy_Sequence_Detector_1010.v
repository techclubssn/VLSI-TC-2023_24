//Mealy Non-Overlapping Sequence Detector-1010
module Sequence_detector_Mealy(
    D,Rst,Clk,Y,state
    );
    input D,Clk,Rst;
    output reg Y;
    output reg[1:0] state;
    reg[1:0] next_state;
    always @(*) begin
        
        // Next State Combinational Logic
        case(state)
            2'b00: begin
                next_state<=(D)?2'b01:2'b00;
                Y<=1'b0;
            end
            2'b01: begin
                next_state<=(D)?2'b01:2'b10;
                Y<=1'b0;
            end
            2'b10: begin
                next_state<=(D)?2'b11:2'b00;
                Y<=1'b0;
            end
            default: begin   
                next_state<=(D)?2'b01:2'b00;
                Y<=~D;
            end
        endcase
        
    end 
    
    always @(posedge Clk or posedge Rst) begin      // Asynchronous Reset
        if(Rst==1'b1)
            state<=2'b00;
        else
            state<=next_state;
    end
endmodule
