module fifo (
  input clk,
  // data_in
  input [31:0] data_in,
  input        data_in_vld,
  output       data_in_rdy,
  // data_out
  output logic [15:0] data_out,
  output        data_out_vld,
  input         data_out_rdy
);

  localparam FIFO16_SIZE = 8;

  bit [15:0] q16[$];

  assign data_in_rdy = q16.size() <= (FIFO16_SIZE - 2);
  assign data_out_vld = (q16.size() > 0);

  always @(*) begin
    if (q16.size() > 0)
      data_out = q16[0];
    else
      data_out = 1'bX;
  end

  always_ff @(posedge clk) begin
    if (data_in_vld && data_in_rdy) begin
      q16.push_back(data_in[31:16]);
      q16.push_back(data_in[15:0]);
    end
    if (data_out_vld && data_out_rdy) begin
      void'(q16.pop_front());
    end
  end

endmodule


module dual_fifo (
  input clk,
  // data_in
  input [31:0] data_in0,
  input        data_in_vld0,
  output       data_in_rdy0,
  input [31:0] data_in1,
  input        data_in_vld1,
  output       data_in_rdy1,
  // data_out
  output logic [15:0] data_out0,
  output        data_out_vld0,
  input         data_out_rdy0,
  output logic [15:0] data_out1,
  output        data_out_vld1,
  input         data_out_rdy1
);

  fifo fifo0 (
    .clk          (clk         ),
    .data_in      (data_in0     ),
    .data_in_vld  (data_in_vld0 ),
    .data_in_rdy  (data_in_rdy0 ),
    .data_out     (data_out0    ),
    .data_out_vld (data_out_vld0),
    .data_out_rdy (data_out_rdy0)
  );

  fifo fifo1 (
    .clk          (clk         ),
    .data_in      (data_in1     ),
    .data_in_vld  (data_in_vld1 ),
    .data_in_rdy  (data_in_rdy1 ),
    .data_out     (data_out1    ),
    .data_out_vld (data_out_vld1),
    .data_out_rdy (data_out_rdy1)
  );

endmodule
