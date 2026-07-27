---
name: gauntlet-loop
description: >-
  Run a full Gauntlet Loop internally on invoke — brief, fan-out builders,
  separate harsh critic, blind side-by-side against an unreachable reference,
  keep improving until the human stops it. Works on Claude Code (/gauntlet-loop,
  /loop) and Codex ($gauntlet-loop, /goal). Use when the user says /gauntlet-loop,
  Gauntlet Loop, aim prompt, one-prompt build, or wants a long-running
  build-against-a-named-reference loop without babysitting.
argument-hint: "[what to build] [optional: against REFERENCE] [optional: in STACK]"
---

# Gauntlet Loop

**On invoke: do the work. Do not hand the user a prompt to paste.**

`/gauntlet-loop` (Claude) or `$gauntlet-loop` (Codex) means: you become the
orchestrator. Compose the aim internally, fan out builders, run a separate harsh
critic, blind A/B against the reference, and keep looping until the human stops
you or the budget hits. The three-paragraph prompt is your internal operating
procedure — not something you ask them to run.

Works on **Claude Code** and **Codex**, same split as vault `AGENTS.md` + `CLAUDE.md`.

## Boot sequence (do this first, then start)

1. Read [AGENTS.md](AGENTS.md) — shared rules + internal execution loop.
2. Detect harness, then read the matching overlay:
   - **Claude Code** → [CLAUDE.md](CLAUDE.md)
   - **Codex** → [CODEX.md](CODEX.md)
3. Parse `$ARGUMENTS` / the user message for `THING`, `REFERENCE`, `STACK`, `BUDGET`.
4. Infer everything else. Ask **at most one** clarifying question, and only if
   `THING` is missing. Then start. Do not wait for a second confirmation.

## Quick detect hints

| Signal | Harness |
|---|---|
| `/gauntlet-loop`, `/loop`, `ultracode`, Claude Code, Opus | Claude |
| `$gauntlet-loop`, `/goal`, Codex, `codex` | Codex |
| Skill loaded from `~/.claude/skills/` | Claude |
| Skill loaded from `~/.codex/skills/` | Codex |

## Invoke shapes

```text
/gauntlet-loop
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear in Next.js
/gauntlet-loop Hades-like roguelike in Godot, budget 4 hours
```

Bare `/gauntlet-loop` with no args: infer from cwd / open files / recent chat.
If still empty, ask once: "What are we building?" Then go.

## Do not

- Dump the three-paragraph prompt and stop — **you run it**
- Ask for every blank — infer; one question max
- Mix harness verbs (`/loop` on Codex, `/goal` on Claude, `ultracode` on Codex)
- Invent a stop condition; the human + budget is the brake
- Soften the critic or lower the reference so the loop can "finish"

## Additional resources

- Shared core: [AGENTS.md](AGENTS.md)
- Claude overlay: [CLAUDE.md](CLAUDE.md)
- Codex overlay: [CODEX.md](CODEX.md)
- Worked fills / noun defaults: [examples.md](examples.md)
