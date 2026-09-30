# Tareas 001 — {{NOMBRE_FEATURE}}

Cada tarea dura **<30 min**, tiene sus RF y un "Hecho cuando:" verificable.
Ordenadas por dependencia. Marca `[x]` solo tras tests en verde.

- [ ] **T1** — {{TÍTULO_CORTO}}
  - RF: RF-1
  - Hecho cuando: {{CRITERIO_VERIFICABLE}}
  - Tests: `tests/{{archivo}}::{{test}}`

- [ ] **T2** — {{TÍTULO_CORTO}}
  - RF: RF-1, RF-2
  - Hecho cuando: {{CRITERIO_VERIFICABLE}}
  - Tests: `tests/{{archivo}}::{{test}}`

- [ ] **T3** — {{TÍTULO_CORTO}}
  - RF: RF-3
  - Hecho cuando: {{CRITERIO_VERIFICABLE}}
  - Tests: `tests/{{archivo}}::{{test}}`

- [ ] **T4** — {{TÍTULO_CORTO}}
  - RF: RF-4
  - Hecho cuando: {{CRITERIO_VERIFICABLE}}
  - Tests: `tests/{{archivo}}::{{test}}`

- [ ] **T5** — {{TÍTULO_CORTO}}
  - RF: RF-5
  - Hecho cuando: {{CRITERIO_VERIFICABLE}}
  - Tests: `tests/{{archivo}}::{{test}}`

---

## Reglas para marcar una tarea como hecha

1. Tests escritos **antes** del código de producción.
2. Suite completa en verde.
3. Salida de tests adjunta en el mensaje al usuario.
4. RF asociados verificados.
5. Solo entonces: `[x]` y parar.