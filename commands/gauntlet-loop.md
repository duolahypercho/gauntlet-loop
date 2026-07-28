---
description: Run the pure Gauntlet aim prompt — fill three paragraphs, execute, keep going until the human stops it
argument-hint: "[what to build] [optional: against REFERENCE] [optional: in STACK]"
---

Invoke **gauntlet-loop**. Pure prompt only — no harness, no state machine, no helper scripts.

Read `~/.claude/skills/gauntlet-loop/SKILL.md` → `AGENTS.md` → `CLAUDE.md`:

1. Infer nouns from the args (thing / reference / stack). One question max if THING is missing.
2. Fill the three-paragraph prompt in AGENTS.md (`/loop` + ultracode).
3. **Run it** on the product. Fan out. Separate harsh critic. Blind compare to the real reference.
4. Keep going until the human stops you. Never ask "continue?"
5. Do not invent capture tools, contracts, scoreboards, or round ledgers.

Task: $ARGUMENTS
