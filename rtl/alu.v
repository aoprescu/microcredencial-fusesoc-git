// ============================================================
// alu.v — Unidad Aritmético-Lógica (16 bits)
// ============================================================
`include "../config/parameters.vh"

module alu (
    input  wire [`DATA_WIDTH-1:0] a,        // Operando A
    input  wire [`DATA_WIDTH-1:0] b,        // Operando B
    input  wire [2:0]             opcode,   // Código de operación
    output reg  [`DATA_WIDTH-1:0] result,   // Resultado
    output reg                    zero,     // Flag: resultado == 0
    output reg                    overflow  // Flag: desbordamiento en suma/resta
);

    always @(*) begin
        overflow = 0;
        case (opcode)
            `OP_ADD: begin
                {overflow, result} = {1'b0, a} + {1'b0, b};
            end
            `OP_SUB: begin
                {overflow, result} = {1'b0, a} - {1'b0, b};
            end
            `OP_AND: result = a & b;
            `OP_OR:  result = a | b;
            `OP_XOR: result = a ^ b;
            `OP_NOT: result = ~a;
            default: result = {`DATA_WIDTH{1'b0}};
        endcase

        zero = (result == {`DATA_WIDTH{1'b0}});
    end

endmodule
