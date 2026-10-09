# AGENTS.md — {{PROJECT_NAME}}

This file is the agent's operational contract. Project rules must not be interpreted as isolated fragments: the following hierarchy determines which document wins.

## Authority hierarchy

1. **User request.** It may change scope, but every behavior change must be reflected in the spec before implementation.
2. **Approved constitution** in `docs/constitution.md`.
3. **Approved spec and plan** of the active feature.
4. **This AGENTS.md**: general operational rules.
5. `.opencode/skills/anti-vibecode-sdd/anti-vibecode-guide.md` and `.opencode/skills/anti-vibecode-sdd/anti-vibecode-standard.json`: quality standards and guardrails.
6. `docs/role.md`, `.opencode/skills/anti-vibecode-sdd/prompts.md`, `docs/web-prompts.md` and `docs/references.md`: operational or reference material, never higher authority.

If there is an unresolved conflict about security, data integrity or behavior, **do not improvise**: stop and request the required decision.

## Project
{{PROJECT_SHORT_DESCRIPTION}}

Stack: {{STACK}}.
Structure: code in `src/`, tests in `tests/`, specs in `specs/`.

## Commands
- Run: `{{RUN_COMMAND}}`
- Tests: `{{TEST_COMMAND}}`
- Lint/format: `{{LINT_COMMAND}}`

## Work classification

Before editing, identify the type of change:

- **New feature / behavior change:** requires an approved RF in the spec.
- **Bug or regression:** first reproduce, identify the root cause and fix the already-defined behavior. If the spec does not represent the correct behavior, update it before or as part of the approved change.
- **Refactor:** must not change behavior; requires evidence that the existing contract is preserved.
- **Docs, configuration, infrastructure or tooling:** may have no RF, but must be justified by an approved task, technical decision or non-functional requirement.

Traceability must cover every behavior change; do not use the RF requirement as an excuse to demand it for every supporting file.

## Mandatory rules

- Inspect the repository before editing.
- Read the constitution and the active spec/plan before touching related code.
- Do not invent requirements, business rules, permissions, API contracts, security decisions or data decisions.
- If a decision that changes behavior or architecture is missing, use `[NEEDS DECISION]` and stop at that point.
- An assumption may only be used if the user explicitly authorized it or an approved rule already defines it; it must be documented and isolated.
- Make the smallest reversible change that fixes the root cause.
- Preserve behavior unrelated to the task.
- Do not add dependencies, abstractions, UI or effects just to make the project look more complete or modern.
- **UI work:** before designing or touching interface code, load the `frontend-ui-engineering` skill (skill tool in OpenCode; if the skill is unavailable in the tool, follow the design sections of `.opencode/skills/anti-vibecode-sdd/anti-vibecode-guide.md`). Aim for an elegant, modern, polished design: effects and motion are allowed when they serve a real purpose, never as decoration (guide 1.1: intentionality, not prohibition).

## Verification

After a change, run the verification appropriate to the type of work:

- Behavior code: relevant tests and the full suite when configured. Prioritize tests for critical processes (data, money, auth, security, core business rules), merge similar tests into short parametrized ones, and do not write trivial or render-only tests.
- Types/lint/build: run the configured checks when the change could affect them.
- UI: check states, routes, responsive behavior and applicable accessibility.
- Docs/config: validate syntax, references and the affected mechanism.

Do not mark a task as done or claim something is verified without evidence.

## Approval and delegation

By default, each SDD phase requires human approval before moving on.

Once the user approves a plan or explicitly authorizes a range of tasks, the agent may execute that range without stopping after each task, as long as:

- it does not change the approved scope;
- no blocking decision appears;
- verifications keep passing;
- no known regression is introduced.

If a new decision or conflict appears, stop even if there was previous delegation.

## When finishing

Report:
- what changed;
- which requirement, task or decision it covers;
- verification executed and its result;
- risks or pending decisions;
- next step, only if applicable.

STOP when the approved scope has been finished.
