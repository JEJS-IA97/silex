# Plan 001 — {{NOMBRE_FEATURE}}

Referencias: `docs/constitution.md`, `spec.md`.

## Módulos
- `{{MÓDULO_1}}`: {{RESPONSABILIDAD}}. Cubre: RF-1, RF-2.
- `{{MÓDULO_2}}`: {{RESPONSABILIDAD}}. Cubre: RF-3.
- `{{MÓDULO_3}}`: {{RESPONSABILIDAD}}. Cubre: RF-4, RF-5.

## Modelo de datos
{{ENTIDAD_1}}

{{campo_1}}: {{tipo}} — {{significado}}

{{campo_2}}: {{tipo}} — {{significado}}

{{ENTIDAD_2}}

{{campo_1}}: {{tipo}} — {{significado}}

text

## Algoritmo / flujo principal
1. {{PASO_1}}
2. {{PASO_2}}
3. {{PASO_3}}

## Decisiones justificadas

### Decisión 1: {{TÍTULO}}
- **Elegido:** {{OPCIÓN}}
- **Alternativa descartada:** {{OPCIÓN_2}}
- **Motivo:** {{RAZÓN_ATADA_A_CONSTITUCIÓN_O_SPEC}}

### Decisión 2: {{TÍTULO}}
- **Elegido:** {{OPCIÓN}}
- **Alternativa descartada:** {{OPCIÓN_2}}
- **Motivo:** {{RAZÓN}}

## Contrato público (API / CLI / interfaz)
{{COMANDO_O_FUNCIÓN_1}} → {{ENTRADA}} → {{SALIDA}}
{{COMANDO_O_FUNCIÓN_2}} → {{ENTRADA}} → {{SALIDA}}

text

## Estrategia de tests
- **Unitarios:** {{QUÉ_SE_TESTEA_EN_AISLAMIENTO}}
- **Integración:** {{QUÉ_SE_TESTEA_ENTRE_MÓDULOS}}
- **End-to-end:** {{QUÉ_SE_TESTEA_DESDE_LA_INTERFAZ}}

## Mapeo RF → módulo → test
| RF | Módulo | Test |
|----|--------|------|
| RF-1 | {{MÓDULO_1}} | `tests/{{archivo}}::{{test}}` |
| RF-2 | {{MÓDULO_1}} | `tests/{{archivo}}::{{test}}` |
| RF-3 | {{MÓDULO_2}} | `tests/{{archivo}}::{{test}}` |