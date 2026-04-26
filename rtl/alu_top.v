// ============================================================
// alu_top.v — Módulo top level: ALU + registro de resultado
// ============================================================
`include "../config/parameters.vh"

module alu_top (
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire [`DATA_WIDTH-1:0] a,
    input  wire [`DATA_WIDTH-1:0] b,
    input  wire [2:0]             opcode,
    input  wire                   reg_enable,
    output wire [`DATA_WIDTH-1:0] alu_result,
    output wire [`DATA_WIDTH-1:0] reg_result,
    output wire                   zero,
    output wire                   overflow
);

    alu u_alu (
        .a        (a),
        .b        (b),
        .opcode   (opcode),
        .result   (alu_result),
        .zero     (zero),
        .overflow (overflow)
    );

    result_reg u_reg (
        .clk      (clk),
        .rst_n    (rst_n),
        .enable   (reg_enable),
        .data_in  (alu_result),
        .data_out (reg_result)
    );

endmodule
