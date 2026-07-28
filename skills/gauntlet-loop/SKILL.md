---
name: gauntlet-loop
description: >-
  GAME skill. Run Matt Shumer's aim prompt to build a game against a named
  reference (COD, Hades, Brotato, …) — fill three paragraphs, execute, fan-out
  + harsh critic + blind A/B until the human stops you. Pure prompt; no harness.
  Art: image gen for 2D/textures, Blender MCP for 3D meshes — both feed the game.
  Claude (/gauntlet-loop, /loop) and Codex ($gauntlet-loop, /goal). Use for
  Gauntlet Loop, aim prompt, one-prompt game build, COD-style loop.
argument-hint: "[game to build] [optional: against REFERENCE] [optional: in STACK]"
---

# Gauntlet Loop

**This is a game skill.** Pure prompt. No functions.

On invoke you are building a **game** to the level of a named reference game.
Fill the three-paragraph aim prompt, then **run it**. Do not paste it for the
user. Do not build a capture suite, state machine, or scoring framework around
it. The prompt *is* the method.

1. Read [AGENTS.md](AGENTS.md) — the prompt + game defaults + what not to invent.
2. Read the harness overlay for loop verbs only:
   - **Claude Code** → [CLAUDE.md](CLAUDE.md) (`/loop`, `ultracode`)
   - **Codex** → [CODEX.md](CODEX.md) (`/goal`)
3. Infer nouns from `$ARGUMENTS` / the message. Default domain = **game**. One question max if `THING` is missing.
4. Fill → execute on the game → keep going until the human stops you.

```text
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop Hades-like roguelike in Godot
/gauntlet-loop Brotato-like arena survivor in Godot
```

## Art for the game (not instead of the game)

| Need | Tool | Doc |
|---|---|---|
| Sprites, textures, UI pixels, concepts | **Image gen** | [ASSETS.md](ASSETS.md) |
| 2D hero/monsters (Brotato-like) | **Image gen sprite factory** (style lock → hero → batch → import) | [ASSETS.md](ASSETS.md) |
| Real meshes, GLB/FBX, 3D props/weapons | **Blender MCP** | [BLENDER_MCP.md](BLENDER_MCP.md) + [ASSETS.md](ASSETS.md) |

Critic grades **in-game frames** vs the real reference game. Art tools only close asset gaps — then wire into the playable build. For 2D sprite games, characters/monsters are image-gen sprites with one locked art language — not Blender, not procedural ovals.

## Do not

- Treat this as a generic site/deck skill — **games first**
- Dump the prompt and stop — **you run it**
- Invent tools, harnesses, contracts, or round machinery
- Soften the critic / lower the reference / invent a stop condition
- End after one cycle and ask whether to continue
- Mix harness verbs (`/loop` on Codex, `/goal` on Claude, `ultracode` on Codex)
- Lag the game out with capture farms / headless engine spam — the game stays playable
- Replace the game loop with endless image-gen or Blender-only rounds

Fills: [examples.md](examples.md)
