# alu_core

Módulo FPGA de Unidad Aritmético-Lógica (ALU) con registro de resultado.

## ¿Qué hace?

Recibe dos operandos (A y B) y un código de operación, calcula el resultado
(suma, resta, AND, OR, XOR, NOT) y lo guarda en un registro.

## Estructura

```
alu_core/
├── config/
│   └── parameters.vh     # Parámetros globales — leer antes de modificar
├── rtl/
│   ├── alu_top.v         # Top level: conecta ALU y registro
│   ├── alu.v             # Lógica de la ALU
│   └── result_reg.v      # Registro de resultado
├── sim/
│   └── tb_alu.v          # Testbench
└── docs/
    └── architecture.md   # Descripción del sistema
```

## Modelo de ramas

```
main          ← solo releases estables, nunca commits directos
  └─ develop  ← integración del equipo
       └─ feature/*  ← trabajo individual
```

## Convención de commits

```
feat(alu): añadir operación de desplazamiento
fix(reg): corregir valor de reset
docs: actualizar tabla de opcodes
test: añadir caso de desbordamiento
```
