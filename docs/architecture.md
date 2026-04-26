# Arquitectura del sistema

## Diagrama de bloques

```
     a ──────────┐
                 ▼
     b ──────────► [ ALU ] ──── alu_result ──► [ result_reg ] ──► reg_result
                 ▲                                    ▲
     opcode ─────┘                         clk, rst_n, reg_enable
```

## Módulos

### alu.v
Calcula el resultado de la operación indicada por `opcode`.
Es combinacional — no tiene reloj.

| opcode | Operación |
|--------|-----------|
| 3'b000 | Suma (A + B) |
| 3'b001 | Resta (A - B) |
| 3'b010 | AND bit a bit |
| 3'b011 | OR bit a bit |
| 3'b100 | XOR bit a bit |
| 3'b101 | NOT (solo A) |

Flags de salida:
- `zero` — activo cuando el resultado es 0
- `overflow` — activo cuando suma o resta desbordan

### result_reg.v
Registro síncrono que guarda el resultado de la ALU cuando `enable` está activo.
Se resetea al valor `REG_RESET_VAL` definido en `parameters.vh`.

### alu_top.v
Conecta la ALU y el registro. Es el módulo que se instancia en el diseño final.

## Parámetros

Todos los parámetros están en `config/parameters.vh`.
No duplicar valores en los módulos individuales.
