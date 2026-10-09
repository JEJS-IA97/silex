# Tasks 001 — {{FEATURE_NAME}}

Each task takes **<30 min**, has its RFs and a verifiable "Done when:".
Ordered by dependency. Check `[x]` only after verification is green.

- [ ] **T1** — {{SHORT_TITLE}}
  - RF: RF-1
  - Done when: {{VERIFIABLE_CRITERION}}
  - Verification: `tests/{{file}}::{{test}}` (critical process) or {{evidence}}

- [ ] **T2** — {{SHORT_TITLE}}
  - RF: RF-1, RF-2
  - Done when: {{VERIFIABLE_CRITERION}}
  - Verification: `tests/{{file}}::{{test}}` (critical process) or {{evidence}}

- [ ] **T3** — {{SHORT_TITLE}}
  - RF: RF-3
  - Done when: {{VERIFIABLE_CRITERION}}
  - Verification: `tests/{{file}}::{{test}}` (critical process) or {{evidence}}

- [ ] **T4** — {{SHORT_TITLE}}
  - RF: RF-4
  - Done when: {{VERIFIABLE_CRITERION}}
  - Verification: `tests/{{file}}::{{test}}` (critical process) or {{evidence}}

- [ ] **T5** — {{SHORT_TITLE}}
  - RF: RF-5
  - Done when: {{VERIFIABLE_CRITERION}}
  - Verification: `tests/{{file}}::{{test}}` (critical process) or {{evidence}}

---

## Rules to mark a task as done

1. For critical logic, tests are written **before** production code (strong TDD preference); for everything else, use the verification appropriate to the type of change.
2. Full suite green where configured.
3. Test/verification output attached in the message to the user.
4. Associated RFs verified.
5. Only then: `[x]` and stop.
