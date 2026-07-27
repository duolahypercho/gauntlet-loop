# Gauntlet Loop — Claude Code Overlay

Claude-specific. Shared core: [AGENTS.md](AGENTS.md) — read that first.

## On `/gauntlet-loop`

You run the Gauntlet yourself. Do not print the three-paragraph prompt and wait.

1. Parse `$ARGUMENTS` (e.g. `/gauntlet-loop COD FPS in ThreeJS`).
2. Infer nouns. One question max if `THING` missing.
3. Print the one-line status + honest "you are the brake" line.
4. Write the contract file.
5. Fan out via Claude Code sub-agents / Task tool / parallel agents.
6. Capture artifacts; spawn a **separate** critic sub-agent with no builder context.
7. Blind A/B; defect list; loop.
8. Keep going under Claude's `/loop` posture until the human stops you or budget hits.

## Harness verbs (if compose-only)

| Slot | Value |
|---|---|
| `LOOP_VERB` | `/loop` |
| `CLOSING_TAIL` | ` and ultracode` |

For the live run, `/loop` and `ultracode` mean: stay in repeating multi-agent mode. Use them; do not treat them as flavor text.

## Management scaffolding — leave it off

- Do not load extra skills into the run
- Do not attach MCP unless the user insists
- Do not pre-write a fat `CLAUDE.md` for this run (self-written contract mid-run is expected)

## Fan-out

- Independent subsystems → parallel sub-agents
- Coupled seams (lighting/materials, physics/player) → one sequential owner
- Critic is always a different sub-agent / fresh context

## Invocation

```text
/gauntlet-loop
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear
```
