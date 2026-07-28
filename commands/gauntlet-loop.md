---
description: GAME skill — pure Gauntlet aim prompt; build a game vs a named reference until the human stops it
argument-hint: "[game to build] [optional: against REFERENCE] [optional: in STACK]"
---

Invoke **gauntlet-loop**. This is a **game** skill. Pure prompt only — no harness, no state machine, no helper scripts.

Read `~/.claude/skills/gauntlet-loop/SKILL.md` → `AGENTS.md` → `CLAUDE.md`:

1. Infer game nouns from the args (thing / reference game / stack). One question max if THING is missing.
2. Fill the three-paragraph prompt in AGENTS.md (`/loop` + ultracode).
3. **Run it** on the **game**. Fan out. Separate harsh critic. Blind compare to the real reference game.
4. Art gaps: image gen for sprites/textures; Blender MCP for 3D meshes — see `ASSETS.md` / `BLENDER_MCP.md`. Always import into the playable build.
5. Keep going until the human stops you. Never ask "continue?"
6. Do not invent capture tools, contracts, scoreboards, or round ledgers.

Task: $ARGUMENTS
