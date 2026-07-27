# Gauntlet Loop — Codex Overlay

Codex-specific. Shared core: [AGENTS.md](AGENTS.md) — read that first.

## On `$gauntlet-loop` / skill invoke

You run the Gauntlet yourself. Do not print the three-paragraph prompt and wait.

1. Parse invoke args (e.g. `$gauntlet-loop COD FPS in ThreeJS`).
2. Infer nouns. One question max if `THING` missing.
3. Print the one-line status + honest "you are the brake" line.
4. Write the contract file + create `GAUNTLET_STATE.md` with `round: 0`, `next: continue`.
5. Fan out workers (parallel where independent; single owner on coupled seams).
6. Capture artifacts; run a **separate** critic pass with no builder context.
7. Blind A/B; defect list; **immediately begin the next round in the same turn**.
8. Keep going under `/goal` posture until the human stops you or budget hits. Do not ask "continue?"

## Harness verbs

| Slot | Value |
|---|---|
| `LOOP_VERB` | `/goal` |
| `CLOSING_TAIL` | `` (empty — no `ultracode` on Codex) |

Closing line for compose-only: `Fan out sub-agents.`

Do **not** paste Claude-only tokens (`/loop`, `ultracode`) into a Codex run.

If Codex `/goal` is available, use it as the long-running posture for the whole Gauntlet. The skill's continuation contract still applies: one critic cycle is never "goal met."

## Stop failure mode (Codex)

Same failure as Claude: ending after one useful cycle with a status report.

**After every critic round:** update `GAUNTLET_STATE.md`, then keep tool-calling into round N+1 in the same turn. "Reference won the blind A/B" means continue, not stop.

Bare re-invoke with `GAUNTLET_STATE.md` present → resume. Do not wipe and restart.

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
$gauntlet-loop   # with GAUNTLET_STATE.md present → resume
```
