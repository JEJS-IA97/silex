# projects-base

Plantilla meta para crear proyectos **no vibe-codeados** con Spec-Driven Development (SDD): la especificación manda sobre el código, y ningún comportamiento se implementa sin estar definido y aprobado antes.

Arranca un proyecto con IA sin heredar el caos del "hazme una app": constitución, specs trazables, checklist de calidad, verificación por requisitos y un set de skills que fuerzan el método.

## Quickstart

```powershell
git clone https://github.com/JEJS-IA97/projects-base.git mi-proyecto
cd mi-proyecto
.\scripts\init.ps1 -Name "Mi Proyecto" -Description "Descripcion corta del proyecto"
```

> Sin PowerShell: `pwsh -File scripts/init.ps1 -Name ... -Description ...`

`init.ps1` convierte el clone en un proyecto limpio listo para subir:

| Paso | Qué hace |
|------|----------|
| Placeholders | Rellena `{{PROJECT_NAME}}` y `{{PROJECT_SHORT_DESCRIPTION}}` en `README.md` y `AGENTS.md` |
| Skills | Copia las 9 skills a `~/.config/opencode/skills/` (autocarga global de OpenCode) y las borra del repo (`-Skills none` para omitir la instalación) |
| Referencias | Reescribe `.opencode/skills/` → `~/.config/opencode/skills/` en `AGENTS.md` y `docs/` |
| Limpieza | Elimina `templates/` y `scripts/` (infraestructura del template) |
| Git | Historial fresco con un único commit: el proyecto se sube limpio, sin los blobs del template |

Después: abre OpenCode en la carpeta y ejecuta la **fase 1 (Constitución)**.

## Flujo SDD (7 fases)

| # | Fase | Entrada | Salida |
|---|------|---------|--------|
| 1 | Constitución | Idea del proyecto | `docs/constitution.md` aprobado |
| 2 | Spec | Constitución + idea | `specs/NNN-*/spec.md` |
| 3 | Clarificación | Spec | Spec revisada por QA |
| 4 | Plan | Spec + constitución | `specs/NNN-*/plan.md` |
| 5 | Tareas | Plan | `specs/NNN-*/tasks.md` |
| 6 | Implementación | Tareas | Código + verificación |
| 7 | Validación | Spec + código | Veredicto RF por RF |

**Regla de oro:** cada fase espera aprobación humana antes de pasar a la siguiente. Los prompts (uno por fase) viven en `~/.config/opencode/skills/anti-vibecode-sdd/prompts.md`.

Por qué SDD en lugar de vibe coding: trazabilidad (cada línea existe porque un RF la justifica), auditabilidad, verificación como puerta de entrada, contexto en archivos y IA sujeta a reglas fijas.

## Qué incluye

| Componente | Ruta | Papel |
|------------|------|-------|
| Contrato del agente | `AGENTS.md` (+ `CLAUDE.md`) | Jerarquía de autoridad, reglas, comandos |
| Método SDD | `docs/` | `constitution.md`, `checklist.md`, `role.md`, guía y prompts |
| Plantillas de spec | `specs/001-nombre-feature-mvp/` | `spec.md`, `plan.md`, `tasks.md` con `{{...}}` |
| Skill anti-vibecode | `.opencode/skills/anti-vibecode-sdd/` | Workflow SDD, guía, estándar JSON, prompts (se instala en global en init) |
| Skills de UI | `.opencode/skills/` | `typeui-fundamentals` + suite `ui-ux-pro-max` (con LICENSE por carpeta) |
| Plugin de grafo | `.opencode/plugins/graphify.js` | Grafo de conocimiento del código (salida a `graphify-out/`, ignorada por git) |
| Código | `src/`, `tests/` | Vacíos, con `.gitkeep` |

## Qué NO viaja al proyecto nuevo

- **`.opencode/skills/`** — instaladas en global; el repo del proyecto queda sin ellas.
- **`templates/`, `scripts/`** — infraestructura del template; se eliminan en init.
- **Resultados** — `graphify-out/`, `coverage/`, `node_modules/` etc. ya están en `.gitignore`.

La fuente de verdad de las skills es este repositorio: en otra máquina, clónalo y copia `.opencode/skills/*` a `~/.config/opencode/skills/`.

## Usar las skills en otras herramientas (opcional)

| Herramienta | Dónde |
|-------------|-------|
| OpenCode | Automático — `~/.config/opencode/skills/` se escanea al arrancar |
| Claude Code | Copia la carpeta a `.claude/skills/` (proyecto) o `~/.claude/skills/` (global) |
| Codex CLI / sin skills | Usa `AGENTS.md` como contrato y `anti-vibecode-prompt.md` como set de instrucciones portable |

Reinicia OpenCode después de añadir o modificar skills.

## Validar antes de declarar terminado

Recorre `docs/checklist.md` y la fase 7 (Validación): evidencia por RF, no declaraciones sin verificar.
