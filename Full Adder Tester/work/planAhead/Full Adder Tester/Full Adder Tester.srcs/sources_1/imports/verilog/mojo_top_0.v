/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg a,
    output reg b,
    output reg cin,
    input s,
    input carry,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_io_button_left_button_conditioner_out;
  reg [1-1:0] M_io_button_left_button_conditioner_in;
  button_conditioner_2 io_button_left_button_conditioner (
    .clk(clk),
    .in(M_io_button_left_button_conditioner_in),
    .out(M_io_button_left_button_conditioner_out)
  );
  wire [1-1:0] M_io_button_right_button_conditioner_out;
  reg [1-1:0] M_io_button_right_button_conditioner_in;
  button_conditioner_2 io_button_right_button_conditioner (
    .clk(clk),
    .in(M_io_button_right_button_conditioner_in),
    .out(M_io_button_right_button_conditioner_out)
  );
  wire [1-1:0] M_io_button_centre_button_conditioner_out;
  reg [1-1:0] M_io_button_centre_button_conditioner_in;
  button_conditioner_2 io_button_centre_button_conditioner (
    .clk(clk),
    .in(M_io_button_centre_button_conditioner_in),
    .out(M_io_button_centre_button_conditioner_out)
  );
  wire [1-1:0] M_io_button_left_edge_detector_out;
  reg [1-1:0] M_io_button_left_edge_detector_in;
  edge_detector_5 io_button_left_edge_detector (
    .clk(clk),
    .in(M_io_button_left_edge_detector_in),
    .out(M_io_button_left_edge_detector_out)
  );
  wire [1-1:0] M_io_button_right_edge_detector_out;
  reg [1-1:0] M_io_button_right_edge_detector_in;
  edge_detector_5 io_button_right_edge_detector (
    .clk(clk),
    .in(M_io_button_right_edge_detector_in),
    .out(M_io_button_right_edge_detector_out)
  );
  wire [1-1:0] M_io_button_centre_edge_detector_out;
  reg [1-1:0] M_io_button_centre_edge_detector_in;
  edge_detector_5 io_button_centre_edge_detector (
    .clk(clk),
    .in(M_io_button_centre_edge_detector_in),
    .out(M_io_button_centre_edge_detector_out)
  );
  wire [1-1:0] M_tester_a;
  wire [1-1:0] M_tester_b;
  wire [1-1:0] M_tester_cin;
  wire [8-1:0] M_tester_led_expected;
  wire [8-1:0] M_tester_led_result;
  wire [8-1:0] M_tester_led_test;
  reg [1-1:0] M_tester_s_circuit;
  reg [1-1:0] M_tester_carry_circuit;
  reg [1-1:0] M_tester_mode_dip;
  reg [1-1:0] M_tester_test_dip;
  reg [1-1:0] M_tester_io_button_left;
  reg [1-1:0] M_tester_io_button_right;
  reg [1-1:0] M_tester_io_button_centre;
  reg [1-1:0] M_tester_s_dip;
  reg [1-1:0] M_tester_carry_dip;
  eight_tester_8 tester (
    .clk(clk),
    .rst(rst),
    .s_circuit(M_tester_s_circuit),
    .carry_circuit(M_tester_carry_circuit),
    .mode_dip(M_tester_mode_dip),
    .test_dip(M_tester_test_dip),
    .io_button_left(M_tester_io_button_left),
    .io_button_right(M_tester_io_button_right),
    .io_button_centre(M_tester_io_button_centre),
    .s_dip(M_tester_s_dip),
    .carry_dip(M_tester_carry_dip),
    .a(M_tester_a),
    .b(M_tester_b),
    .cin(M_tester_cin),
    .led_expected(M_tester_led_expected),
    .led_result(M_tester_led_result),
    .led_test(M_tester_led_test)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_io_button_left_button_conditioner_in = io_button[3+0-:1];
    M_io_button_left_edge_detector_in = M_io_button_left_button_conditioner_out;
    M_tester_io_button_left = M_io_button_left_edge_detector_out;
    M_io_button_right_button_conditioner_in = io_button[4+0-:1];
    M_io_button_right_edge_detector_in = M_io_button_right_button_conditioner_out;
    M_tester_io_button_right = M_io_button_right_edge_detector_out;
    M_io_button_centre_button_conditioner_in = io_button[1+0-:1];
    M_io_button_centre_edge_detector_in = M_io_button_centre_button_conditioner_out;
    M_tester_io_button_centre = M_io_button_centre_edge_detector_out;
    M_tester_mode_dip = io_dip[16+0+0-:1];
    M_tester_test_dip = io_dip[16+1+0-:1];
    io_led[16+7-:8] = M_tester_led_expected;
    io_led[8+7-:8] = M_tester_led_test;
    io_led[0+7-:8] = M_tester_led_result;
    a = M_tester_a;
    b = M_tester_b;
    cin = M_tester_cin;
    M_tester_s_circuit = s;
    M_tester_carry_circuit = carry;
    M_tester_s_dip = io_dip[16+4+0-:1];
    M_tester_carry_dip = io_dip[16+3+0-:1];
  end
endmodule
