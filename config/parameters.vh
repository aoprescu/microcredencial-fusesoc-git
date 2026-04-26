// ============================================================
// alu_core — parámetros globales del módulo
// Este archivo es compartido por todos los módulos.
// Cualquier cambio debe coordinarse con el equipo.
// ============================================================

`ifndef PARAMETERS_VH
`define PARAMETERS_VH

// --- Anchura de datos (línea 11) ---
`define DATA_WIDTH      8

// --- Códigos de operación (líneas 14-19) ---
`define OP_ADD          3'b000    // Suma
`define OP_SUB          3'b001    // Resta
`define OP_AND          3'b010    // AND bit a bit
`define OP_OR           3'b011    // OR bit a bit
`define OP_XOR          3'b100    // XOR bit a bit
`define OP_NOT          3'b101    // NOT (solo operando A)
`define OP_SHL          3'b110    // Desplazamiento izquierda
`define OP_SHR          3'b111    // Desplazamiento derecha

// --- Registro de resultado (línea 22) ---
`define REG_RESET_VAL   8'h00     // Valor de reset del registro

`endif
