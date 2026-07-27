# Gauntlet Loop — Codex Overlay

Codex-specific. Shared core: [AGENTS.md](AGENTS.md) — read that first.

## On `$gauntlet-loop` / skill invoke

You run the Gauntlet yourself. Do not print the three-paragraph prompt and wait.

1. Parse invoke args (e.g. `$gauntlet-loop COD FPS in ThreeJS`).
2. Infer nouns. One question max if `THING` missing.
3. Print the one-line status + honest "you are the brake" line.
4. Write the contract file.
5. Fan out workers (parallel where independent; single owner on coupled seams).
6. Capture artifacts; run a **separate** critic pass with no builder context.
7. Blind A/B; defect list; loop under `/goal` posture.
8. Keep going until the human stops you or budget hits.

## Harness verbs (if compose-only)

| Slot | Value |
|---|---|
| `LOOP_VERB` | `/goal` |
| `CLOSING_TAIL` | `` (empty — no `ultracode` on Codex) |

Closing line for compose-only: `Fan out sub-agents.`

Do **not** paste Claude-only tokens (`/loop`, `ultracode`) into a Codex run.

## Management scaffolding — leave it off

- No skill pack bolted onto the run
- No MCP / external tool wiring unless the user insists
- No pre-written rules dump for this run (self-written contract mid-run is expected)

## Fan-out

- Independent subsystems → parallel workers
- Coupled seams → one sequential owner
- Critic is always a different context from builders

## Invocation

```text
$gauntlet-loop
$gauntlet-loop a COD-style FPS in ThreeJS
$gauntlet-loop marketing site against Linear
```
