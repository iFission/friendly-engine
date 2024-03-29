/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     CLK_FREQ = CLK_FREQ
     BAUD = BAUD
*/
module uart_rx_6 (
    input clk,
    input rst,
    input rx,
    output reg [7:0] data,
    output reg new_data
  );
  
  localparam CLK_FREQ = 26'h2faf080;
  localparam BAUD = 19'h7a120;
  
  
  localparam CLK_PER_BIT = 28'h0000064;
  
  localparam CTR_SIZE = 3'h7;
  
  localparam IDLE_state = 2'd0;
  localparam WAIT_HALF_state = 2'd1;
  localparam WAIT_FULL_state = 2'd2;
  localparam WAIT_HIGH_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  reg [6:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [2:0] M_bitCtr_d, M_bitCtr_q = 1'h0;
  reg [7:0] M_savedData_d, M_savedData_q = 1'h0;
  reg M_newData_d, M_newData_q = 1'h0;
  reg M_rxd_d, M_rxd_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_newData_d = M_newData_q;
    M_bitCtr_d = M_bitCtr_q;
    M_savedData_d = M_savedData_q;
    M_rxd_d = M_rxd_q;
    M_ctr_d = M_ctr_q;
    
    M_rxd_d = rx;
    M_newData_d = 1'h0;
    data = M_savedData_q;
    new_data = M_newData_q;
    
    case (M_state_q)
      IDLE_state: begin
        M_bitCtr_d = 1'h0;
        M_ctr_d = 1'h0;
        if (M_rxd_q == 1'h0) begin
          M_state_d = WAIT_HALF_state;
        end
      end
      WAIT_HALF_state: begin
        M_ctr_d = M_ctr_q + 1'h1;
        if (M_ctr_q == 28'h0000032) begin
          M_ctr_d = 1'h0;
          M_state_d = WAIT_FULL_state;
        end
      end
      WAIT_FULL_state: begin
        M_ctr_d = M_ctr_q + 1'h1;
        if (M_ctr_q == 29'h00000063) begin
          M_savedData_d = {M_rxd_q, M_savedData_q[1+6-:7]};
          M_bitCtr_d = M_bitCtr_q + 1'h1;
          M_ctr_d = 1'h0;
          if (M_bitCtr_q == 3'h7) begin
            M_state_d = WAIT_HIGH_state;
            M_newData_d = 1'h1;
          end
        end
      end
      WAIT_HIGH_state: begin
        if (M_rxd_q == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
      default: begin
        M_state_d = IDLE_state;
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_ctr_q <= M_ctr_d;
    M_bitCtr_q <= M_bitCtr_d;
    M_savedData_q <= M_savedData_d;
    M_newData_q <= M_newData_d;
    M_rxd_q <= M_rxd_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
