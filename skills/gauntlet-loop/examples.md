# Gauntlet Loop — examples

**Default mode:** `/gauntlet-loop …` runs the loop internally. These fills are for
compose-only, or as noun defaults when the agent infers `REFERENCE` / `STACK`.

Harness verbs differ. Claude Code uses `/loop` + closing `ultracode`. Codex uses `/goal` and drops `ultracode`. See [CLAUDE.md](CLAUDE.md) and [CODEX.md](CODEX.md).

## Bare invoke — what the agent should do

```text
/gauntlet-loop a COD-style FPS in ThreeJS
```

Internally (no paste-back to the user):

1. Status line: `Gauntlet: FPS against Call of Duty in ThreeJS. Hard panel: … Budget: until you stop. …`
2. Write contract (`ARCHITECTURE.md` / `GAUNTLET.md`) — **product subsystems only**
3. Fan out **product** builders → cheapest glanceable frames → fresh harsh critic → matched blind A/B (hard panel owns tally) → product defects → loop
4. Stop only on human / budget
5. Never invent a capture/eval workstream; if a shot fails, simplify the shot and keep fixing the game

## Original (Call of Duty / ThreeJS) — Claude Code form

The source prompt. Preserve this shape on Claude.

```text
I want you to build a first-person shooter at the level of the most recent Call of Duty games. It should be utterly perfect, visually beautiful, with every single thing done at AAA quality—from textures to physics to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is utterly perfect. You should /loop on each item and have a separate sub-agent check it visually to ensure it looks triple A. That separate sub-agent should be a really harsh critic, and if it doesn't look triple A, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with the actual Call of Duty game. It should literally compare them side by side blind and say which one looks better. Do this in ThreeJS. /loop until it's utterly perfect. Fan out sub-agents and ultracode.
```

Receipts from the published repo (why the unreachable bar matters):

- Quality scores across rounds: 3.59 → 4.14 → 4.05 → 5.05 / 10
- Blind A/B: every critic in every round picked the real Call of Duty frame
- Stop condition never fired; quality was a function of runtime

## Game fill — Hades / Godot

**Claude Code**

```text
I want you to build a top-down action roguelike at the level of Hades. It should be
utterly perfect, visually beautiful, with every single thing done at AAA quality, from
combat feel to lighting to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is
utterly perfect. You should /loop on each item and have a separate sub-agent check it
visually to ensure it looks as good as Hades. That separate sub-agent should be a really
harsh critic, and if it doesn't look that good, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
actual Hades screenshots. It should literally compare them side by side blind and say
which one looks better. Do this in Godot. /loop until it's utterly perfect. Fan out
sub-agents and ultracode.
```

**Codex** — same nouns, `/goal`, no `ultracode`

```text
I want you to build a top-down action roguelike at the level of Hades. It should be
utterly perfect, visually beautiful, with every single thing done at AAA quality, from
combat feel to lighting to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is
utterly perfect. You should /goal on each item and have a separate sub-agent check it
visually to ensure it looks as good as Hades. That separate sub-agent should be a really
harsh critic, and if it doesn't look that good, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
actual Hades screenshots. It should literally compare them side by side blind and say
which one looks better. Do this in Godot. /goal until it's utterly perfect.
Fan out sub-agents.
```

## Non-game fill — Linear / Next.js

**Claude Code**

```text
I want you to build a marketing site for my product at the level of Linear's website.
It should be utterly perfect, visually beautiful, with every single thing done at
top studio quality, from typography to motion to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the site is
utterly perfect. You should /loop on each item and have a separate sub-agent screenshot
it and check it visually to ensure it looks like a top studio built it. That separate
sub-agent should be a really harsh critic, and if it doesn't, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
linear.app. It should literally compare them side by side blind and say which one looks
better. Do this in Next.js and Tailwind. /loop until it's utterly perfect. Fan out
sub-agents and ultracode.
```

**Codex**

```text
I want you to build a marketing site for my product at the level of Linear's website.
It should be utterly perfect, visually beautiful, with every single thing done at
top studio quality, from typography to motion to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the site is
utterly perfect. You should /goal on each item and have a separate sub-agent screenshot
it and check it visually to ensure it looks like a top studio built it. That separate
sub-agent should be a really harsh critic, and if it doesn't, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
linear.app. It should literally compare them side by side blind and say which one looks
better. Do this in Next.js and Tailwind. /goal until it's utterly perfect.
Fan out sub-agents.
```

## Noun cheat sheet

| Domain | REFERENCE | AREA_1 / AREA_2 | CHECK | STACK |
|---|---|---|---|---|
| FPS | Call of Duty | textures / physics | visually | ThreeJS |
| Roguelike | Hades | combat feel / lighting | visually | Godot |
| Marketing site | Linear | typography / motion | by screenshot | Next.js + Tailwind |
| Deck | a famous pitch deck you name | narrative arc / slide craft | by reading aloud + screenshot | Gamma / Keynote / HTML |
| Essay | a specific writer/piece | structure / voice | by reading aloud | Markdown |

Rule: if the model can clearly beat `REFERENCE` on day one, pick a harder one.

## Hard-panel defaults (tally owners)

| Domain | `HARD_PANEL` (example) |
|---|---|
| FPS | late-fight frame: can you find the gunfight / player read in <1s vs real COD |
| Roguelike | late-wave chaos: hero findable in <1s vs real reference still |
| Marketing site | first viewport side-by-side vs live reference homepage |
| Deck | title + problem slides vs the named deck, read aloud + glance |

Easy checklist wins (HUD present, brand on a quiet frame) never flip the tally alone.

## Anti-example (do not do this)

Listing in the contract:

```text
| Capture / critic | tools/capture.py, tools/blind_compare.py | gameplay |
```

That turns the Gauntlet into a harness project. The pure prompt never does this. Capture stays a means; the product stays the loop body.
