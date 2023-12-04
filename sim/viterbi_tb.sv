`timescale 1ns / 1ps
`default_nettype none

module viterbi_tb;

  logic clk;
  logic sys_rst;
  logic signed [7:0] soft_inp;
  logic valid_in_vit;
  logic ready_in;
  logic vit_desc;
  logic valid_out;
  logic normalization;
  logic [19:0] sm_0_debug;

  viterbi dut (
      .clk(clk),
      .sys_rst(sys_rst),
      .soft_inp(soft_inp),
      .valid_in_vit(valid_in_vit),
      .vit_desc(vit_desc),
      .normalization(normalization),
      .ready_in(ready_in),
      .sm_0_debug(sm_0_debug),
      .valid_out_vit(valid_out)
  );

  always begin
    #5 clk = ~clk;
  end

  logic [16000:0] soft_inp_conv ;

  initial begin
    $dumpfile("vcd/vit.vcd"); //file to store value change dump (vcd)
    $dumpvars(0,viterbi_tb); //dump all variables in this module
    $display("Starting Sim"); //print nice message at start
 
  soft_inp_conv = 16000'h807F7F807F807F80807F7F7F807F7F807F807F7F807F7F807F807F808080808080807F807F7F7F7F80807F80807F807F807F807F7F7F8080807F807F8080807F807F7F7F7F807F807F807F7F807F8080807F7F7F80807F807F7F7F80807F80807F7F807F7F807F807F7F80807F7F80807F7F807F807F7F7F8080807F80807F807F80807F80807F80807F7F7F7F80807F7F807F7F7F807F8080807F807F7F807F80807F7F807F808080807F7F7F807F7F7F7F80807F7F80807F7F80808080807F807F7F7F808080807F80807F7F807F807F7F8080807F7F7F807F8080807F8080807F7F7F7F807F807F7F80807F7F7F807F7F7F80807F807F7F807F7F80807F80808080807F80807F808080807F7F7F807F807F807F80807F808080807F7F8080807F80807F7F7F807F8080808080807F7F8080807F7F807F7F7F807F807F807F7F7F7F807F7F7F807F7F7F7F807F7F7F80807F8080808080807F80807F807F7F8080807F7F80807F7F7F7F8080807F808080807F7F80808080807F80807F807F807F7F80807F7F7F80807F80807F7F7F80807F7F7F80807F807F7F7F8080807F7F807F80807F7F80808080807F7F7F808080807F7F7F807F807F807F80807F7F7F807F7F7F7F807F807F80807F807F807F807F7F8080807F80807F7F7F7F7F7F807F7F7F7F7F7F8080807F7F80807F7F7F7F8080807F7F80807F7F808080808080807F7F807F7F7F7F807F807F7F7F7F807F807F7F80807F80807F7F8080807F8080807F807F80807F807F80807F7F807F807F808080807F807F8080807F7F7F7F7F7F8080807F7F80807F7F7F7F7F7F80807F7F7F7F7F7F7F7F807F8080807F807F807F7F7F80807F7F807F80807F7F7F7F7F8080807F807F7F807F807F7F80808080807F7F7F808080807F808080807F7F807F807F80807F80807F7F7F7F807F807F7F7F807F7F807F8080807F807F7F7F7F7F8080807F7F7F7F807F7F8080807F8080807F7F7F80807F80808080807F80807F8080808080807F7F8080807F7F807F7F807F807F8080807F807F7F7F7F80807F7F7F807F807F7F80808080807F7F807F807F7F7F80807F80807F7F7F80807F7F807F80807F7F7F7F7F808080807F807F7F807F7F7F7F807F7F807F7F80807F807F807F7F808080807F7F807F807F7F807F807F807F7F7F7F807F7F7F807F80807F7F7F7F808080807F807F80807F7F7F7F80807F80807F7F807F7F80807F807F80807F7F807F807F7F7F807F7F7F80807F7F7F7F807F7F8080807F7F7F7F7F7F807F7F7F7F7F807F7F8080807F807F80807F8080807F80807F807F7F807F7F7F807F7F807F807F807F7F807F807F7F7F7F7F807F80807F807F808080807F80807F7F808080808080807F80807F7F8080807F807F80807F7F7F807F807F807F7F8080807F7F7F807F7F7F7F7F7F7F80807F7F807F7F7F7F7F7F7F7F8080807F7F807F807F7F7F7F80807F7F7F807F807F7F808080808080807F7F807F7F7F7F80807F7F80807F807F7F7F7F7F807F7F80807F8080807F807F7F7F807F80807F807F7F7F7F7F7F7F807F80808080807F80808080807F7F7F7F8080807F807F7F7F7F807F7F80807F7F8080807F7F8080807F7F807F80807F7F807F807F807F807F7F7F7F80807F7F8080807F7F7F7F807F807F80807F7F7F7F80807F80807F7F7F7F807F7F7F8080807F807F7F7F7F7F8080807F80807F7F808080807F80807F7F8080808080807F80807F7F807F807F7F80807F80807F7F80807F807F7F7F7F7F7F8080807F80807F7F807F7F80807F8080807F7F7F7F80807F80807F80807F7F7F807F7F808080808080807F807F7F807F807F7F807F7F7F7F7F7F7F80807F7F807F7F7F8080807F807F807F7F7F807F7F8080807F7F7F80807F7F8080807F80807F7F807F807F80807F8080808080807F80807F7F7F7F7F7F807F7F7F7F7F7F807F80807F7F807F7F807F7F807F80807F80807F7F7F8080807F7F807F807F8080807F7F807F7F7F807F7F807F7F80807F7F7F7F807F7F807F7F7F807F807F807F807F7F7F7F807F7F7F7F807F8080807F8080807F7F7F7F7F807F807F807F7F8080807F808080807F80807F807F7F807F7F7F7F7F7F807F7F807F7F7F80807F7F7F7F7F7F807F7F7F7F80807F7F80807F7F7F7F807F7F7F807F7F807F7F80807F7F7F7F807F7F8080807F7F8080807F7F807F80808080808080807F7F80807F80807F7F807F7F7F808080808080808080808080808080807F7F7F8080807F7F7F7F807F8080807F7F808080807F8080807F7F7F807F7F7F7F80807F80807F807F7F7F8080807F7F7F807F807F808080807F7F7F7F7F80807F7F807F7F807F807F807F8080807F7F807F808080807F7F807F7F80807F7F7F7F7F807F80807F807F808080807F7F7F7F807F807F7F808080807F7F7F80808080807F8080807F807F7F80807F7F7F807F8080807F80807F807F7F7F80807F8080807F80807F80807F7F80808080807F7F7F8080807F80807F7F8080807F807F808080808080807F7F7F7F7F7F7F7F7F7F808080807F807F807F7F80807F807F8080807F7F807F7F7F80807F7F7F7F7F807F807F80807F807F807F808080807F7F7F7F7F7F7F7F8080807F7F7F8080807F8080807F7F7F807F7F80807F7F7F80807F7F80807F80807F80807F808080807F808080807F807F7F7F7F80807F7F7F807F7F807F7F807F7F80807F80807F7F807F7F7F7F7F7F807F7F807F80807F7F7F807F8080807F7F808080808080807F7F7F807F7F7F7F7F80807F8080807F7F807F7F7F;
// [1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1]


// soft_inp_conv = 16000'h7F7F7F807F7F8080807F80807F7F7F7F7F807F7F7F808080808080807F7F8080807F807F7F7F80807F807F7F807F7F7F7F7F7F807F7F80807F80807F7F807F7F807F7F807F7F7F80807F7F7F7F807F808080807F808080807F80807F80807F80807F7F80807F7F7F80807F7F807F7F7F8080807F8080807F7F7F8080807F7F7F7F7F7F7F7F808080807F807F807F80807F807F807F7F7F7F7F80807F7F7F807F7F8080807F807F80807F7F807F807F808080807F7F7F7F7F7F7F7F7F7F808080808080807F807F8080807F7F80807F8080807F7F7F80808080807F7F80807F80807F8080807F80807F7F7F807F80807F8080807F807F7F7F80807F7F807F8080807F80808080807F7F7F808080807F7F807F807F7F7F7F808080807F807F80807F807F7F7F7F7F80807F7F807F7F808080807F807F7F8080807F807F807F807F7F807F7F80807F7F7F7F7F808080807F807F807F7F7F8080807F7F7F807F80807F80807F7F7F7F807F7F7F8080807F808080807F7F8080807F807F7F7F7F8080807F7F7F808080808080808080808080808080807F7F7F807F7F80807F80807F7F80808080808080807F807F7F8080807F7F8080807F7F807F7F7F7F80807F7F807F7F807F7F7F807F7F7F7F80807F7F80807F7F7F7F807F7F7F7F7F7F80807F7F7F807F7F807F7F7F7F7F7F807F7F807F80807F808080807F8080807F7F807F807F807F7F7F7F7F8080807F8080807F807F7F7F7F807F7F7F7F807F807F807F807F7F7F807F7F807F7F7F7F80807F7F807F7F807F7F7F807F7F8080807F807F807F7F8080807F7F7F80807F80807F807F7F807F7F807F7F80807F807F7F7F7F7F7F807F7F7F7F7F7F80807F8080808080807F80807F807F807F7F80807F8080807F7F80807F7F7F8080807F7F807F7F7F807F807F8080807F7F7F807F7F80807F7F7F7F7F7F7F807F7F807F807F7F807F808080808080807F7F807F7F7F80807F80807F80807F7F7F7F8080807F80807F7F807F7F80807F8080807F7F7F7F7F7F807F80807F7F80807F80807F7F807F807F7F80807F8080808080807F7F80807F808080807F7F80807F8080807F7F7F7F7F807F8080807F7F7F807F7F7F7F80807F80807F7F7F7F80807F807F807F7F7F7F8080807F7F80807F7F7F7F807F807F807F807F7F80807F807F7F8080807F7F8080807F7F80807F7F807F7F7F7F807F8080807F7F7F7F80808080807F80808080807F807F7F7F7F7F7F7F807F80807F807F7F7F807F8080807F80807F7F807F7F7F7F7F807F80807F7F80807F7F7F7F807F7F808080808080807F7F807F807F7F7F80807F7F7F7F807F807F7F8080807F7F7F7F7F7F7F7F807F7F80807F7F7F7F7F7F7F807F7F7F8080807F7F807F807F807F7F7F80807F807F8080807F7F80807F808080808080807F7F80807F808080807F807F80807F807F7F7F7F7F807F807F7F807F807F807F7F807F7F7F807F7F807F80807F8080807F80807F807F8080807F7F807F7F7F7F7F807F7F7F7F7F7F8080807F7F807F7F7F7F80807F7F7F807F7F7F807F807F7F80807F807F80807F7F807F7F80807F80807F7F7F7F80807F807F808080807F7F7F7F80807F807F7F7F807F7F7F7F807F807F807F7F807F807F7F808080807F7F807F807F80807F7F807F7F807F7F7F7F807F7F807F808080807F7F7F7F7F80807F807F7F80807F7F7F80807F80807F7F7F807F807F7F80808080807F7F807F807F7F7F80807F7F7F7F807F8080807F807F807F7F807F7F8080807F7F8080808080807F80807F80808080807F80807F7F7F8080807F8080807F7F807F7F7F7F8080807F7F7F7F7F807F8080807F807F7F807F7F7F807F807F7F7F7F80807F80807F807F807F7F808080807F808080807F7F7F80808080807F7F807F807F7F807F8080807F7F7F7F7F80807F807F7F80807F7F7F807F807F8080807F807F7F7F7F7F7F7F7F80807F7F7F7F7F7F80807F7F8080807F7F7F7F7F7F8080807F807F808080807F807F807F7F80807F807F80807F807F8080807F8080807F7F80807F80807F7F807F807F7F7F7F807F807F7F7F7F807F7F808080808080807F7F80807F7F8080807F7F7F7F80807F7F8080807F7F7F7F7F7F807F7F7F7F7F7F80807F8080807F7F807F807F807F80807F807F807F7F7F7F807F7F7F80807F807F807F807F7F7F808080807F7F7F80808080807F7F80807F807F7F8080807F7F7F807F80807F7F7F80807F7F7F80807F80807F7F7F80807F7F807F807F80807F80808080807F7F808080807F8080807F7F7F7F80807F7F8080807F7F807F80807F8080808080807F80807F7F7F807F7F7F7F807F7F7F807F7F7F7F807F807F807F7F7F807F7F8080807F7F8080808080807F807F7F7F80807F8080807F7F808080807F80807F807F807F807F7F7F808080807F80807F80808080807F80807F7F807F7F807F80807F7F7F807F7F7F80807F7F807F807F7F7F7F8080807F8080807F807F7F7F8080807F7F807F807F7F80807F808080807F7F7F807F80808080807F7F80807F7F80807F7F7F7F807F7F7F808080807F807F7F80807F807F7F807F8080807F807F7F7F807F7F80807F7F7F7F80807F80807F80807F807F80807F8080807F7F7F807F807F7F80807F7F80807F7F807F807F7F807F7F80807F80807F7F7F807F80807F7F7F8080807F807F7F807F807F807F7F7F7F807F8080807F807F8080807F7F7F807F807F807F80807F80807F7F7F7F807F808080808080807F807F807F7F807F7F807F807F7F807F7F7F80807F807F807F7F80;
 
    clk = 0;
    sys_rst = 1;
    valid_in_vit = 0;
    #10 
    sys_rst = 0;
    valid_in_vit = 1;
    for (int i = 0; i < 2000 ; i++) begin
      soft_inp = soft_inp_conv[i*8 +: 8];
      // soft_inp = 8'h7F;
      #10;
    end
    #10;
    #1000;
    $display("Simulation finished");
    $finish;
  end

endmodule
`default_nettype wire