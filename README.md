# {{NOMBRE_PROYECTO}}

{{DESCRIPCIÓN_BREVE_DEL_PROYECTO}}

Este proyecto sigue **Spec-Driven Development (SDD)**: la especificación manda sobre el código, y ningún comportamiento se implementa sin estar definido y aprobado antes.

---

## ¿Qué es SDD y por qué lo usamos?

**Vibe coding** es pedirle a una IA "hazme una app de X" y aceptar lo que devuelva. Funciona para prototipos, pero produce código imposible de mantener, sin tests, con decisiones no documentadas y errores difíciles de localizar.

**Spec-Driven Development (SDD)** invierte el orden: primero se define **el qué y el por qué** (spec), luego **el cómo** (plan), después **las tareas** (tasks) y solo al final **el código**. Cada fase tiene un prompt específico y un artefacto verificable. Beneficios:

- **Trazabilidad:** cada línea de código existe porque un requisito (RF) la justifica.
- **Auditabilidad:** se sabe qué se pidió, qué se decidió y por qué.
- **Robustez:** la verificación es la puerta de entrada; no se avanza con la verificación en rojo.
- **Mantenibilidad:** el contexto está en archivos, no en la cabeza de nadie.
- **IA controlada:** el agente sigue reglas fijas, no improvisa.

---

## Flujo de trabajo SDD (7 fases)

| # | Fase | Entrada | Salida | Prompt |
|---|------|---------|--------|--------|
| 1 | Constitución | Idea del proyecto | `docs/constitution.md` | Ver `docs/prompts.md` |
| 2 | Spec | Constitución + idea | `specs/NNN-*/spec.md` | Ver `docs/prompts.md` |
| 3 | Clarificación | Spec | Spec revisada por QA | Ver `docs/prompts.md` |
| 4 | Plan | Spec + constitución | `specs/NNN-*/plan.md` | Ver `docs/prompts.md` |
| 5 | Tareas | Plan | `specs/NNN-*/tasks.md` | Ver `docs/prompts.md` |
| 6 | Implementación | Tareas | Código + verificación | Ver `docs/prompts.md` |
| 7 | Validación | Spec + código | Veredicto RF por RF | Ver `docs/prompts.md` |

**Regla de oro:** cada fase espera aprobación humana antes de pasar a la siguiente.

---

## Cómo usar esta base (paso a paso)

### 1. Clonar y renombrar

```bash
git clone <esta-base> {{NOMBRE_PROYECTO}}
cd {{NOMBRE_PROYECTO}}
```

Reemplaza los placeholders `{{...}}` de `README.md`, `AGENTS.md` y `docs/constitution.md`.

### 2. Aprobar la constitución (fase 1)

Usa el prompt de Constitución de `docs/prompts.md`. Edita `docs/constitution.md` con los principios concretos del proyecto y espera la aprobación del usuario.

### 3. Ejecutar el flujo SDD

Sigue las fases 2 a 7 con los prompts de `docs/prompts.md`, una fase cada vez. No saltes fases sin aprobación explícita.

### 4. Trabajar con el estándar anti-vibecode

- `docs/standard/anti-vibecode-guide.md` — guía detallada (guardrails de calidad, diseño, accesibilidad, tests).
- `docs/standard/anti-vibecode-standard.json` — espejo machine-readable de las reglas.
- `docs/standard/anti-vibecode-prompt.md` — prompt portable para sesiones donde no está este repo.

### 5. Validar antes de declarar terminado

Recorre `docs/checklist.md` y la fase 7 (Validación): evidencia por RF, no declaraciones sin verificar.
