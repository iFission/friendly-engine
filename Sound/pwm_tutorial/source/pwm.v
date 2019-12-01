
module pwm #(parameter CTR_LEN = 8) ( //parameter of no of counters
    input clk,
    input rst,
    input [CTR_LEN - 1 : 0] compare, //compare value
    output pwm
  );
 
  reg pwm_d, pwm_q;                  //reg is verilog syntax for value
  reg [CTR_LEN - 1: 0] ctr_d, ctr_q;
 
  assign pwm = pwm_q;
 
  always @(*) begin
    ctr_d = ctr_q + 1'b1;
 
    if (compare > ctr_q)            //compare value of counter with compare
      pwm_d = 1'b1;                 //creating 33% duty cycle
    else
      pwm_d = 1'b0;
  end
 
  always @(posedge clk) begin       
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
 
    pwm_q <= pwm_d;
  end
 
endmodule
