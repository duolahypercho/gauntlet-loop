# Gauntlet Loop — Shared Operating Context

**Domain: games.** You are building a playable game against a named reference game.

Harness overlays: [CLAUDE.md](CLAUDE.md) · [CODEX.md](CODEX.md).  
Fills: [examples.md](examples.md). Art routing: [ASSETS.md](ASSETS.md). Blender: [BLENDER_MCP.md](BLENDER_MCP.md).

## What this is

On invoke, fill the three-paragraph prompt below with the nouns from the user message, then **run that prompt as your own instructions**. Do not paste it back. Do not wrap it in a framework, a state machine, a contract file, a capture suite, or helper scripts.

The pure prompt is the whole method. There is a reason it works — leave it alone.

**The human is the brake.** The bar stays unreachable. Quality is a function of runtime.

Unless the user explicitly asks for something else, assume:

| Slot | Game default |
|---|---|
| `THING` | a game (FPS, roguelike, survivor, …) |
| `REFERENCE` | a real shipped game (Call of Duty, Hades, Brotato, …) |
| `TIER` | `AAA` |
| `CHECK` | `visually` (in-game frame vs reference) |
| `STACK` | game stack from args / project (ThreeJS, Godot, …) |

The deliverable is a **playable game** that climbs toward the reference — not a Blender file, not an image grid, not a capture harness.

## On invoke

1. Infer `THING`, `REFERENCE`, `LOOK`, `TIER`, `AREA_1`, `AREA_2`, `CHECK`, `STACK` from args / cwd / chat. Prefer game nouns. One question max if `THING` is missing.
2. Pull harness verbs from the overlay (`LOOP_VERB`, `CLOSING_TAIL`).
3. Fill the skeleton. Hold it as your internal brief — do not dump it and wait.
4. Execute it: fan out on the **game**, harsh separate critic, blind side-by-side vs the real reference **game**, keep going.
5. Pull image gen or Blender only for asset gaps ([ASSETS.md](ASSETS.md)). Always land assets in the playable build.
6. Stop only when the human stops you (or a stated budget hits). Never ask "continue?"

Status line once, then work:

```text
Gauntlet: [THING] against [REFERENCE] in [STACK]. Game skill. You are the brake.
```

Honest line once:

> It will not finish by its own definition. Blind comparison against [REFERENCE] will keep failing. That is why quality keeps climbing. You stop it.

## The prompt (fill and run — this is the entire procedure)

```text
I want you to build [THING] at the level of [REFERENCE]. It should
be utterly perfect, [LOOK], with every single thing done at
[TIER] quality, from [AREA_1] to [AREA_2] to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the [THING]
is utterly perfect. You should [LOOP_VERB] on each item and have a separate sub-agent check it
[CHECK] to ensure it is [TIER]. That separate sub-agent should
be a really harsh critic, and if it isn't [TIER], it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
[REFERENCE]. It should literally compare them side by side blind and say which
one looks better. Do this in [STACK]. [LOOP_VERB] until it's utterly perfect.
Fan out sub-agents[CLOSING_TAIL].
```

That is all. No other protocol.

## Noun defaults (games)

| Slot | Default |
|---|---|
| `LOOK` | `visually beautiful` |
| `TIER` | `AAA` |
| `CHECK` | `visually` |
| `REFERENCE` | best-in-class **game** for `THING` (see [examples.md](examples.md)) |
| `STACK` | from args, else project game engine, else ThreeJS / Godot by genre |
| `AREA_1` / `AREA_2` | game workstreams (e.g. textures / physics, combat feel / lighting) |

## Art routing (short)

Full chooser + 2D sprite factory: [ASSETS.md](ASSETS.md).

- **Image gen** → sprites, textures, UI pixels, concepts → import into the game
- **2D hero/monsters** (Brotato-like) → image-gen sprite factory (style lock → hero → enemies → weapons → replace PNGs). Not Blender. Not procedural blob generators.
- **Blender MCP** → real 3D meshes / GLB/FBX → import into the game ([BLENDER_MCP.md](BLENDER_MCP.md))
- Critic grades **in-game frames** against the real reference game — never the Midjourney grid or Blender viewport alone

## Do not invent

These are how agents leave the pure prompt and break the loop:

- Helper scripts, capture harnesses, blind-compare tools, critic doc templates, scoreboards
- `GAUNTLET_STATE.md` / round ledgers / architecture contracts as the job
- Stop rules ("N flat rounds", "good enough", "ready for review")
- Softening the critic or lowering the reference
- Asking "want me to continue?" after one cycle — just keep going
- Spending the run on tooling instead of the **game**
- Treating this skill as a marketing-site or deck builder by default
- **Pegging the game to feed the critic.** Do not boot headless engine loops, jam late-wave density for screenshots, or leave Godot/Chrome/etc. at 100% CPU for capture. If a glance lags the game out, the glance is wrong — take a lighter frame or look at what already exists. The game must stay playable.
- Endless image-gen or Blender rounds that never land in the playable build

Glance at a frame the cheap way (one light in-game screenshot — not a capture farm). Fix the game. Compare blind to the real reference. Repeat.

## Compose-only

Only if the user says "just give me the prompt" / "compose only": return the filled three paragraphs in a fenced `text` block. Otherwise always execute.
