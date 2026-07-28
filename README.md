# Gauntlet Loop

**GAME skill.** Matt Shumer's aim prompt as a slash command — build a game against a named reference. Fill the three paragraphs. Run them. Stop when *you* stop it.

No harness. No state machine. No helper scripts. Pure prompt.

Works on **Claude Code** (`/gauntlet-loop`, `/loop`) and **Codex** (`$gauntlet-loop`, `/goal`).

```
/gauntlet-loop a COD-style FPS in ThreeJS
```

## Credit

Built on **[Matt Shumer](https://x.com/mattshumer_)** (`@mattshumer_`) cooking the 152-word Call of Duty prompt.

- **Original prompt + demo:** [github.com/mshumer/Claude-of-Duty](https://github.com/mshumer/Claude-of-Duty)
- **This skill:** same prompt, filled and executed on invoke — nothing bolted on

He cooked the aim. This just makes it one command.

## Install

```bash
git clone https://github.com/duolahypercho/gauntlet-loop.git
cd gauntlet-loop
./install.sh
```

Installs into `~/.claude/skills/gauntlet-loop` + `/gauntlet-loop`, and symlinks Codex to the same skill.

## Use

```text
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear in Next.js
$gauntlet-loop Hades-like roguelike in Godot
```

The agent fills this shape and runs it (Claude verbs shown):

```text
I want you to build [THING] at the level of [REFERENCE]. It should
be utterly perfect, [LOOK], with every single thing done at
[TIER] quality, from [AREA_1] to [AREA_2] to anything you could think of.

Fan out sub-agents and have sub-agents tackle each one individually so that the [THING]
is utterly perfect. You should /loop on each item and have a separate sub-agent check it
[CHECK] to ensure it is [TIER]. That separate sub-agent should
be a really harsh critic, and if it isn't [TIER], it should keep going.

Don't stop until each sub-agent is utterly wowed with the quality when compared with
[REFERENCE]. It should literally compare them side by side blind and say which
one looks better. Do this in [STACK]. /loop until it's utterly perfect.
Fan out sub-agents and ultracode.
```

Say **"compose only"** if you just want the filled text without the run.

**You are the brake.** The loop will not finish on its own.

## Layout

```
gauntlet-loop/
├── README.md
├── LICENSE
├── install.sh
├── commands/gauntlet-loop.md
└── skills/gauntlet-loop/
    ├── SKILL.md      # boot
    ├── AGENTS.md     # the prompt + what not to invent
    ├── CLAUDE.md     # /loop + ultracode
    ├── CODEX.md      # /goal
    ├── examples.md    # filled game prompts
    ├── ASSETS.md      # image gen vs Blender
    └── BLENDER_MCP.md # Blender MCP setup + use
```

## License

MIT
