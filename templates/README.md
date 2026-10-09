# {{PROJECT_NAME}}

{{PROJECT_SHORT_DESCRIPTION}}

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
| 1 | Constitución | Idea del proyecto | `docs/constitution.md` | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 2 | Spec | Constitución + idea | `specs/NNN-*/spec.md` | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 3 | Clarificación | Spec | Spec revisada por QA | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 4 | Plan | Spec + constitución | `specs/NNN-*/plan.md` | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 5 | Tareas | Plan | `specs/NNN-*/tasks.md` | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 6 | Implementación | Tareas | Código + verificación | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |
| 7 | Validación | Spec + código | Veredicto RF por RF | Ver `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md` |

**Regla de oro:** cada fase espera aprobación humana antes de pasar a la siguiente.

---

## Cómo usar esta base (paso a paso)

### 1. Placeholders pendientes

Este proyecto se creó desde `projects-base`; nombre y descripción ya vienen resueltos en `README.md` y `AGENTS.md`. Quedan por completar a mano los `{{...}}` de `AGENTS.md` (`{{STACK}}`, comandos de run/test/lint).

### 2. Aprobar la constitución (fase 1)

Usa el prompt de Constitución de `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md`. Edita `docs/constitution.md` con los principios concretos del proyecto y espera la aprobación del usuario.

### 3. Ejecutar el flujo SDD

Sigue las fases 2 a 7 con los prompts de `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md`, una fase cada vez. No saltes fases sin aprobación explícita.

### 4. La skill `anti-vibecode-sdd`

El estándar vive empaquetado como skill en `~/.config/opencode/skills/anti-vibecode-sdd/` (OpenCode la carga automáticamente al arrancar):

- `SKILL.md` — workflow SDD condensado y punto de entrada de la skill.
- `anti-vibecode-guide.md` — guía detallada (guardrails de calidad, diseño, accesibilidad, tests).
- `anti-vibecode-standard.json` — espejo machine-readable de las reglas.
- `anti-vibecode-prompt.md` — prompt portable para sesiones donde no está este repo.
- `prompts.md` — un prompt por fase SDD.

### 4.1 Skills de terceros instaladas en global

Misma ubicación que la anterior (instaladas por `init.ps1` del template, fuera del repo); cada carpeta lleva su `LICENSE` (MIT; `ui-styling` incluye además Apache-2.0 de las fuentes embebidas):

| Skills | Origen |
|--------|--------|
| `typeui-fundamentals` | [bergside/typeui](https://github.com/bergside/typeui) — MIT |
| `banner-design`, `brand`, `design`, `design-system`, `slides`, `ui-styling`, `ui-ux-pro-max` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) — MIT |

### 5. Validar antes de declarar terminado

Recorre `docs/checklist.md` y la fase 7 (Validación): evidencia por RF, no declaraciones sin verificar.

### 6. Usar la skill en otras herramientas (opcional)

| Herramienta | Dónde |
|-------------|-------|
| OpenCode | Automático — `~/.config/opencode/skills/` se escanea al arrancar |
| Claude Code | Copia la carpeta a `.claude/skills/` (proyecto) o `~/.claude/skills/` (global) |
| Codex CLI / sin skills | Usa `AGENTS.md` como contrato y `anti-vibecode-prompt.md` como set de instrucciones portable |

Reinicia OpenCode después de añadir o modificar skills.
