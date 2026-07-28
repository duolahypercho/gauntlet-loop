# Gauntlet Loop — Shared Operating Context

Harness overlays: [CLAUDE.md](CLAUDE.md) · [CODEX.md](CODEX.md). Worked fills: [examples.md](examples.md).

## What this is

On invoke, fill the three-paragraph prompt below with the nouns from the user message, then **run that prompt as your own instructions**. Do not paste it back. Do not wrap it in a framework, a state machine, a contract file, a capture suite, or helper scripts.

The pure prompt is the whole method. There is a reason it works — leave it alone.

**The human is the brake.** The bar stays unreachable. Quality is a function of runtime.

## On invoke

1. Infer `THING`, `REFERENCE`, `LOOK`, `TIER`, `AREA_1`, `AREA_2`, `CHECK`, `STACK` from args / cwd / chat. One question max if `THING` is missing.
2. Pull harness verbs from the overlay (`LOOP_VERB`, `CLOSING_TAIL`).
3. Fill the skeleton. Hold it as your internal brief — do not dump it and wait.
4. Execute it: fan out on the product, harsh separate critic, blind side-by-side vs the real reference, keep going.
5. Stop only when the human stops you (or a stated budget hits). Never ask "continue?"

Status line once, then work:

```text
Gauntlet: [THING] against [REFERENCE] in [STACK]. You are the brake.
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

## Noun defaults

| Slot | Default |
|---|---|
| `LOOK` | `visually beautiful` |
| `TIER` | `AAA` (games) / `top studio` (else) |
| `CHECK` | `visually` (games/UI) / `by reading aloud` (prose) |
| `REFERENCE` | best-in-class for `THING` (see [examples.md](examples.md)) |
| `STACK` | from args, else project, else domain default |

## Do not invent

These are how agents leave the pure prompt and break the loop:

- Helper scripts, capture harnesses, blind-compare tools, critic doc templates, scoreboards
- `GAUNTLET_STATE.md` / round ledgers / architecture contracts as the job
- Stop rules ("N flat rounds", "good enough", "ready for review")
- Softening the critic or lowering the reference
- Asking "want me to continue?" after one cycle — just keep going
- Spending the run on tooling instead of the thing being built
- **Pegging the game to feed the critic.** Do not boot headless engine loops, jam late-wave density for screenshots, or leave Godot/Chrome/etc. at 100% CPU for capture. If a glance lags the product out, the glance is wrong — take a lighter frame or look at what already exists. The game must stay playable.

Glance at a frame the cheap way (one light screenshot / export — not a capture farm). Fix the product. Compare blind to the real reference. Repeat.

## Compose-only

Only if the user says "just give me the prompt" / "compose only": return the filled three paragraphs in a fenced `text` block. Otherwise always execute.
