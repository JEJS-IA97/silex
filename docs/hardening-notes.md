# Notas de endurecimiento de la base

La base funciona mejor como un sistema de capas:

1. `AGENTS.md` = contrato operativo y jerarquía.
2. `docs/constitution.md` = reglas específicas del proyecto.
3. `specs/` = comportamiento y alcance aprobados.
4. `docs/standard/anti-vibecode-guide.md` = estándar detallado.
5. `docs/standard/anti-vibecode-standard.json` = espejo legible por máquinas.
6. `docs/prompts.md` = interfaz para ejecutar SDD.
7. `docs/role.md` / `docs/references.md` = referencias opcionales.
8. `.opencode/agents/researcher.md` = investigación aislada, sin edición.

No conviene copiar ECC completo. Su repositorio actual demuestra una arquitectura mucho más grande, con decenas de subagentes, cientos de skills y MCPs; la idea útil para esta base es adoptar patrones concretos de investigación/verificación, no importar toda la superficie de contexto.
