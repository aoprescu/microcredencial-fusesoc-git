// ============================================================
// result_reg.v — Registro de resultado con enable
// ============================================================
`include "../config/parameters.vh"

module result_reg (
    input  wire                   clk,
    input  wire                   rst_n,     // Reset activo en bajo
    input  wire                   enable,    // Guardar resultado
    input  wire [`DATA_WIDTH-1:0] data_in,   // Resultado de la ALU
    output reg  [`DATA_WIDTH-1:0] data_out   // Valor registrado
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_out <= `REG_RESET_VAL;
        else if (enable)
            data_out <= data_in;
    end

endmodule
