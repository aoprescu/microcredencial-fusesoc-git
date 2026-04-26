// ============================================================
// tb_alu.v — Testbench de la ALU
// ============================================================
`include "../config/parameters.vh"
`timescale 1ns/1ps

module tb_alu;

    // Entradas
    reg  [`DATA_WIDTH-1:0] a, b;
    reg  [2:0]             opcode;

    // Salidas
    wire [`DATA_WIDTH-1:0] result;
    wire                   zero;
    wire                   overflow;

    // Instancia del módulo bajo test
    alu dut (
        .a        (a),
        .b        (b),
        .opcode   (opcode),
        .result   (result),
        .zero     (zero),
        .overflow (overflow)
    );

    integer fails = 0;

    // Tarea de comprobación
    task check;
        input [`DATA_WIDTH-1:0] expected;
        input [63:0]            test_num;
        input [127:0]           test_name;
        begin
            #1;
            if (result !== expected) begin
                $display("FAIL test %0d (%s): resultado=%0d, esperado=%0d",
                         test_num, test_name, result, expected);
                fails = fails + 1;
            end
        end
    endtask

    initial begin
        $display("=== Testbench ALU ===");

        // Test 1: Suma simple
        a = 8'd10; b = 8'd5; opcode = `OP_ADD;
        check(8'd15, 1, "ADD 10+5");

        // Test 2: Resta simple
        a = 8'd10; b = 8'd3; opcode = `OP_SUB;
        check(8'd7, 2, "SUB 10-3");

        // Test 3: AND bit a bit
        a = 8'hF0; b = 8'hAA; opcode = `OP_AND;
        check(8'hA0, 3, "AND F0&AA");

        // Test 4: OR bit a bit
        a = 8'hF0; b = 8'h0F; opcode = `OP_OR;
        check(8'hFF, 4, "OR F0|0F");

        // Test 5: XOR bit a bit
        a = 8'hFF; b = 8'hFF; opcode = `OP_XOR;
        check(8'h00, 5, "XOR FF^FF");

        // Test 6: NOT
        a = 8'h00; b = 8'h00; opcode = `OP_NOT;
        check(8'hFF, 6, "NOT 00");

        // Test 7: flag zero
        a = 8'd0; b = 8'd0; opcode = `OP_ADD;
        #1;
        if (!zero) begin
            $display("FAIL test 7: flag zero deberia estar activo");
            fails = fails + 1;
        end

        // Test 8: verificar DATA_WIDTH
        if (`DATA_WIDTH !== 8) begin
            $display("FAIL: DATA_WIDTH esperado 8, encontrado %0d", `DATA_WIDTH);
            fails = fails + 1;
        end

        // Resultado final
        if (fails == 0)
            $display("PASS: todos los tests superados");
        else
            $display("FAIL: %0d test(s) fallaron", fails);

        $finish;
    end

endmodule
