# Spec 001 — {{FEATURE_NAME}}

## Context and objective
{{WHY_THIS_FEATURE_EXISTS_AND_WHAT_IT_SOLVES}}

## Users / actors
- {{ACTOR_1}}: {{WHAT_THEY_NEED}}
- {{ACTOR_2}}: {{WHAT_THEY_NEED}}

## User stories
- Story 1: As {{ACTOR}} I want {{ACTION}} so that {{BENEFIT}}.
- Story 2: As {{ACTOR}} I want {{ACTION}} so that {{BENEFIT}}.

## Functional requirements (EARS acceptance criteria)

> EARS notation: WHEN…, IF…, WHILE…, THE SYSTEM…
> Each RF must be verifiable: with a test when it covers a critical process (data, money, auth, security, core business rules), or with appropriate alternative evidence — see guide §22.

- RF-1: WHEN {{event}}, THE SYSTEM {{expected response}}.
- RF-2: IF {{condition}}, THEN THE SYSTEM {{response}}.
- RF-3: WHILE {{state}}, THE SYSTEM {{behavior}}.
- RF-4: THE SYSTEM {{permanent behavior}}.
- RF-5: {{ADD_AS_MANY_AS_NEEDED}}

## Non-functional requirements
- RNF-1: {{performance, security, usability, etc.}}
- RNF-2: {{...}}

## Edge cases
- {{EMPTY_OR_INVALID_INPUT}}
- {{CONCURRENCY_OR_RETRIES}}
- {{SIZE_OR_FREQUENCY_LIMITS}}

## Out of scope
- {{WHAT_WILL_NOT_BE_DONE_IN_THIS_FEATURE}}

## Completion criteria
- [ ] Every RF has verification: a test when it covers a critical process, or documented alternative evidence.
- [ ] Every verifiable RNF is measured.
- [ ] Edge cases are covered.
- [ ] Verification passes (test suite green where configured).
- [ ] Every behavior or contract change is justified by an approved RF/RNF/decision. Supporting code, tests, configuration or infrastructure may be justified by an approved task or technical decision.

## Open questions
- [NEEDS CLARIFICATION] {{PENDING_QUESTION}}
