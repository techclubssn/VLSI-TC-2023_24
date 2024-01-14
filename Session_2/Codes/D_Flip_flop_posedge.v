module DFF_posedge(D,clk,rst,set,Q);
  input D,clk,rst,set;
  output reg Q;
  always @(posedge clk or negedge rst or negedge set) begin    // Try removing "negedge rst" and/or "negedge set" from the sensitivity list and observe circuit behaviour 
    if(rst==1'b0)
      Q<=1'b0;
    else if(set==1'b0)
      Q<=1'b1;
    else
      Q<=D;
  end
endmodule
