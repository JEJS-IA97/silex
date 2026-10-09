# Prompts by SDD phase

Prompts are work interfaces; they do not replace the `AGENTS.md` hierarchy. **Do not skip phases** unless the user explicitly authorizes a different flow.

| Phase | Essential prompt |
|-------|------------------|
| **Constitution** | "Propose this project's constitution: N short, verifiable principles about product, architecture, quality, security, tests and limits. Max 15 lines. Write no code. Wait for my approval." |
| **Research (support)** | "Investigate only what is needed to answer the question. Prefer primary/official sources; record the consultation date, evidence, uncertainties and links. Do not design the solution or modify code." |
| **Spec (interview)** | "Write NO code. Ask questions about scope, edge cases, errors, permissions and acceptance criteria. Then generate `spec.md` with RFs numbered in EARS, RNFs, out-of-scope items and completion criteria. Only WHAT and WHY." |
| **Clarification** | "Review the spec as a professional QA: ambiguities, contradictions, missing edge cases, risks and conflicts with the constitution. Detect only; do not resolve decisions without approval." |
| **Plan** | "Read the constitution and spec. Without code: generate `plan.md` with modules, data model, justified decisions, discarded alternatives, risks and verification strategy. Map every RF." |
| **Tasks** | "Split the plan into small tasks ordered by dependency. Each task must include its RF, RNF or technical decision, a verifiable 'Done when:' and its verification. Mark checkboxes." |
| **UI Design (when an interface exists)** | "Load the `frontend-ui-engineering` skill. Before styling anything: define design tokens (color, typography, spacing, radii, shadows), visual hierarchy and states. Propose the design and wait for my approval. Elegant, modern and polished; effects only when they communicate something real, never as decoration." |
| **Implementation** | "Implement ONLY the approved scope. Inspect before editing, reproduce the root cause, make the smallest safe change and verify. Do not silently widen the scope." |
| **Validation** | "Walk the spec RF by RF and RNF by RNF: evidence, test/verification and result. Distinguish met, not met and not verifiable. Do not declare success without evidence." |
| **Change** | "New requirement: {{description}}. Do not touch code. Propose the spec/plan change, its impact and the conceptual diff. Wait for approval." |

## Rules of use

1. One prompt corresponds to one phase.
2. Research is a supporting activity, not a phase that authorizes implementation.
3. A plan approval may delegate several tasks; the agent must respect the approved boundaries.
4. If a decision that changes behavior or architecture is missing, stop at that point (`[NEEDS DECISION]`).
5. An RF is not required for every supporting file: traceability is required for every behavior change.
6. For docs, configuration, infrastructure and refactors, use the verification appropriate to the change.
7. Tests concentrate on critical processes; merge similar tests and do not write trivial tests (see guide §22).
