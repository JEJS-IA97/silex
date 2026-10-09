# Plan 001 — {{FEATURE_NAME}}

References: `docs/constitution.md`, `spec.md`.

## Modules
- `{{MODULE_1}}`: {{RESPONSIBILITY}}. Covers: RF-1, RF-2.
- `{{MODULE_2}}`: {{RESPONSIBILITY}}. Covers: RF-3.
- `{{MODULE_3}}`: {{RESPONSIBILITY}}. Covers: RF-4, RF-5.

## Data model
{{ENTITY_1}}

{{field_1}}: {{type}} — {{meaning}}

{{field_2}}: {{type}} — {{meaning}}

{{ENTITY_2}}

{{field_1}}: {{type}} — {{meaning}}

## Main algorithm / flow
1. {{STEP_1}}
2. {{STEP_2}}
3. {{STEP_3}}

## Justified decisions

### Decision 1: {{TITLE}}
- **Chosen:** {{OPTION}}
- **Discarded alternative:** {{OPTION_2}}
- **Reason:** {{REASON_TIED_TO_CONSTITUTION_OR_SPEC}}

### Decision 2: {{TITLE}}
- **Chosen:** {{OPTION}}
- **Discarded alternative:** {{OPTION_2}}
- **Reason:** {{REASON}}

## Public contract (API / CLI / interface)
{{COMMAND_OR_FUNCTION_1}} → {{INPUT}} → {{OUTPUT}}
{{COMMAND_OR_FUNCTION_2}} → {{INPUT}} → {{OUTPUT}}

## Verification strategy
- **Unit:** {{WHAT_IS_TESTED_IN_ISOLATION}}
- **Integration:** {{WHAT_IS_TESTED_ACROSS_MODULES}}
- **End-to-end:** {{WHAT_IS_TESTED_FROM_THE_INTERFACE}}
- Critical processes get automated tests; similar tests are merged into short parametrized ones; UI, docs and configuration may use alternative evidence (guide §22).

## Mapping RF → module → verification
| RF | Module | Verification |
|----|--------|--------------|
| RF-1 | {{MODULE_1}} | `tests/{{file}}::{{test}}` or {{evidence}} |
| RF-2 | {{MODULE_1}} | `tests/{{file}}::{{test}}` or {{evidence}} |
| RF-3 | {{MODULE_2}} | `tests/{{file}}::{{test}}` or {{evidence}} |
