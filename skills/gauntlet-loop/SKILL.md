---
name: gauntlet-loop
description: >-
  Run Matt Shumer's aim prompt as-is — fill the three paragraphs, execute them,
  fan-out + harsh critic + blind A/B against a named reference until the human
  stops you. No harness, no state machine, no helper scripts. Claude
  (/gauntlet-loop, /loop) and Codex ($gauntlet-loop, /goal). Use for Gauntlet
  Loop, aim prompt, one-prompt build, COD-style loop.
argument-hint: "[what to build] [optional: against REFERENCE] [optional: in STACK]"
---

# Gauntlet Loop

**Pure prompt. No functions.**

On invoke: fill the three-paragraph aim prompt, then **run it**. Do not paste it
for the user. Do not build a capture suite, a state file protocol, or a scoring
framework around it. The prompt *is* the method.

1. Read [AGENTS.md](AGENTS.md) — the prompt + what not to invent.
2. Read the harness overlay for loop verbs only:
   - **Claude Code** → [CLAUDE.md](CLAUDE.md) (`/loop`, `ultracode`)
   - **Codex** → [CODEX.md](CODEX.md) (`/goal`)
3. Infer nouns from `$ARGUMENTS` / the message. One question max if `THING` is missing.
4. Fill → execute → keep going until the human stops you.

```text
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear in Next.js
```

## Do not

- Dump the prompt and stop — **you run it**
- Invent tools, harnesses, contracts, or round machinery
- Soften the critic / lower the reference / invent a stop condition
- End after one cycle and ask whether to continue
- Mix harness verbs (`/loop` on Codex, `/goal` on Claude, `ultracode` on Codex)
- Lag the product out with capture farms / headless engine spam — the game stays playable

Fills: [examples.md](examples.md)
