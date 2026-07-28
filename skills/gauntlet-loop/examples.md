# Gauntlet Loop — examples

**Game skill.** These are filled **pure prompts** for building games against named reference games. On normal invoke the agent runs them; it does not invent tooling around them. Art routing (image gen vs Blender): [ASSETS.md](ASSETS.md).

Claude uses `/loop` + closing `ultracode`. Codex uses `/goal` and drops `ultracode`.

## Original — Call of Duty / ThreeJS (Claude)

```text
I want you to build a first-person shooter at the level of the most recent Call of Duty games. It should be utterly perfect, visually beautiful, with every single thing done at AAA quality—from textures to physics to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is utterly perfect. You should /loop on each item and have a separate sub-agent check it visually to ensure it looks triple A. That separate sub-agent should be a really harsh critic, and if it doesn't look triple A, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with the actual Call of Duty game. It should literally compare them side by side blind and say which one looks better. Do this in ThreeJS. /loop until it's utterly perfect. Fan out sub-agents and ultracode.
```

Credit: [Matt Shumer](https://x.com/mattshumer_) — [Claude-of-Duty](https://github.com/mshumer/Claude-of-Duty)

## Hades / Godot (Claude)

```text
I want you to build a top-down action roguelike at the level of Hades. It should be utterly perfect, visually beautiful, with every single thing done at AAA quality, from combat feel to lighting to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is utterly perfect. You should /loop on each item and have a separate sub-agent check it visually to ensure it looks as good as Hades. That separate sub-agent should be a really harsh critic, and if it doesn't look that good, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with actual Hades screenshots. It should literally compare them side by side blind and say which one looks better. Do this in Godot. /loop until it's utterly perfect. Fan out sub-agents and ultracode.
```

## Hades / Godot (Codex)

```text
I want you to build a top-down action roguelike at the level of Hades. It should be utterly perfect, visually beautiful, with every single thing done at AAA quality, from combat feel to lighting to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the game is utterly perfect. You should /goal on each item and have a separate sub-agent check it visually to ensure it looks as good as Hades. That separate sub-agent should be a really harsh critic, and if it doesn't look that good, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with actual Hades screenshots. It should literally compare them side by side blind and say which one looks better. Do this in Godot. /goal until it's utterly perfect. Fan out sub-agents.
```

## Linear / Next.js (Claude)

```text
I want you to build a marketing site for my product at the level of Linear's website. It should be utterly perfect, visually beautiful, with every single thing done at top studio quality, from typography to motion to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the site is utterly perfect. You should /loop on each item and have a separate sub-agent screenshot it and check it visually to ensure it looks like a top studio built it. That separate sub-agent should be a really harsh critic, and if it doesn't, it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with linear.app. It should literally compare them side by side blind and say which one looks better. Do this in Next.js and Tailwind. /loop until it's utterly perfect. Fan out sub-agents and ultracode.
```

## Noun cheat sheet (games first)

| Domain | REFERENCE | AREA_1 / AREA_2 | CHECK | STACK | Art |
|---|---|---|---|---|---|
| FPS | Call of Duty | textures / physics | visually | ThreeJS | Blender meshes + image-gen textures |
| Roguelike | Hades | combat feel / lighting | visually | Godot | image-gen / Blender by camera |
| Arena survivor | Brotato | combat feel / readability | visually | Godot | image-gen sprites first |
| Marketing site* | Linear | typography / motion | by screenshot | Next.js + Tailwind | image gen |
| Deck* | a famous pitch deck you name | narrative arc / slide craft | by reading aloud + screenshot | Gamma / Keynote / HTML | image gen |

\*Non-game fills only if the user explicitly asks. Default invoke = **game**.

If the model can clearly beat `REFERENCE` on day one, pick a harder one.
