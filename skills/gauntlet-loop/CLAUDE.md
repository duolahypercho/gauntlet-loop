# Gauntlet Loop — Claude Code Overlay

Claude-specific. Shared core: [AGENTS.md](AGENTS.md) — read that first.

## On `/gauntlet-loop`

You run the Gauntlet yourself. Do not print the three-paragraph prompt and wait.

1. Parse `$ARGUMENTS` (e.g. `/gauntlet-loop COD FPS in ThreeJS`).
2. Infer nouns (including `HARD_PANEL`). One question max if `THING` missing.
3. Print the one-line status + honest "you are the brake" line.
4. Write the contract file (**product subsystems only**) + create `GAUNTLET_STATE.md` with `round: 0`, `hard_panel: …`, `next: continue`.
5. Fan out via Claude Code sub-agents / Task tool for **product** areas.
6. Grab the cheapest glanceable frames; spawn a **separate** critic sub-agent with no builder context.
7. Blind A/B on matched sheets; hard panel owns the tally; defect list → **immediately begin the next product round in the same turn**.
8. Keep going until the human stops you or budget hits. Do not ask "continue?"

## Harness verbs

| Slot | Value |
|---|---|
| `LOOP_VERB` | `/loop` |
| `CLOSING_TAIL` | ` and ultracode` |

`/loop` and `ultracode` are runtime switches. Use them for the live run — they mean stay in repeating multi-agent mode. They are not flavor text.

If Claude Code exposes a `/loop` mode for this session, enable it at cold start so the host itself keeps the agent cycling. The skill's continuation contract still applies even without it.

## Stop failure mode (Claude)

Claude agents love to finish a turn with a neat summary after one useful cycle. That kills the Gauntlet.

**After every critic round:** update `GAUNTLET_STATE.md`, then call the next **product** builder tools in the same turn. Never close with "Round N done."

Second failure mode: the swarm starts optimizing `tools/capture.py` instead of the game. You are the orchestrator — pull them back. Capture is disposable (AGENTS.md §3).

If the host truncates you mid-loop: leave `next: continue` in state. On the next user message or `/gauntlet-loop` resume with no args, read state and continue — do not restart from zero unless state is missing.

## Management scaffolding — leave it off

- Do not load extra skills into the run
- Do not attach MCP unless the user insists
- Do not pre-write a fat `CLAUDE.md` for this run (self-written contract mid-run is expected)
- Do not invent a capture/eval product inside the project

## Fan-out

- Independent **product** subsystems → parallel sub-agents
- Coupled seams (lighting/materials, physics/player) → one sequential owner
- Critic is always a different sub-agent / fresh context
- No peer "harness" workers

## Invocation

```text
/gauntlet-loop
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear
/gauntlet-loop   # with GAUNTLET_STATE.md present → resume, do not restart
```
