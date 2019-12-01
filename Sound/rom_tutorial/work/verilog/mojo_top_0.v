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
    input avr_rx_busy
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_avr_spi_miso;
  wire [4-1:0] M_avr_spi_channel;
  wire [1-1:0] M_avr_tx;
  wire [1-1:0] M_avr_new_sample;
  wire [10-1:0] M_avr_sample;
  wire [4-1:0] M_avr_sample_channel;
  wire [1-1:0] M_avr_tx_busy;
  wire [8-1:0] M_avr_rx_data;
  wire [1-1:0] M_avr_new_rx_data;
  reg [1-1:0] M_avr_cclk;
  reg [1-1:0] M_avr_spi_mosi;
  reg [1-1:0] M_avr_spi_sck;
  reg [1-1:0] M_avr_spi_ss;
  reg [1-1:0] M_avr_rx;
  reg [4-1:0] M_avr_channel;
  reg [8-1:0] M_avr_tx_data;
  reg [1-1:0] M_avr_new_tx_data;
  reg [1-1:0] M_avr_tx_block;
  avr_interface_2 avr (
    .clk(clk),
    .rst(rst),
    .cclk(M_avr_cclk),
    .spi_mosi(M_avr_spi_mosi),
    .spi_sck(M_avr_spi_sck),
    .spi_ss(M_avr_spi_ss),
    .rx(M_avr_rx),
    .channel(M_avr_channel),
    .tx_data(M_avr_tx_data),
    .new_tx_data(M_avr_new_tx_data),
    .tx_block(M_avr_tx_block),
    .spi_miso(M_avr_spi_miso),
    .spi_channel(M_avr_spi_channel),
    .tx(M_avr_tx),
    .new_sample(M_avr_new_sample),
    .sample(M_avr_sample),
    .sample_channel(M_avr_sample_channel),
    .tx_busy(M_avr_tx_busy),
    .rx_data(M_avr_rx_data),
    .new_rx_data(M_avr_new_rx_data)
  );
  wire [1-1:0] M_rom_caller_new_tx;
  wire [8-1:0] M_rom_caller_tx_data;
  reg [1-1:0] M_rom_caller_new_rx;
  reg [8-1:0] M_rom_caller_rx_data;
  reg [1-1:0] M_rom_caller_tx_busy;
  rom_caller_3 rom_caller (
    .clk(clk),
    .rst(rst),
    .new_rx(M_rom_caller_new_rx),
    .rx_data(M_rom_caller_rx_data),
    .tx_busy(M_rom_caller_tx_busy),
    .new_tx(M_rom_caller_new_tx),
    .tx_data(M_rom_caller_tx_data)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_avr_cclk = cclk;
    M_avr_spi_ss = spi_ss;
    M_avr_spi_mosi = spi_mosi;
    M_avr_spi_sck = spi_sck;
    M_avr_rx = avr_tx;
    M_avr_channel = 4'hf;
    M_avr_tx_block = avr_rx_busy;
    spi_miso = M_avr_spi_miso;
    spi_channel = M_avr_spi_channel;
    avr_rx = M_avr_tx;
    led = 8'h00;
    M_rom_caller_new_rx = M_avr_new_rx_data;
    M_rom_caller_rx_data = M_avr_rx_data;
    M_avr_new_tx_data = M_rom_caller_new_tx;
    M_avr_tx_data = M_rom_caller_tx_data;
    M_rom_caller_tx_busy = M_avr_tx_busy;
  end
endmodule
