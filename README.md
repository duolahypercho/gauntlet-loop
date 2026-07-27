# Gauntlet Loop

**Aim prompt as a runnable skill.** Brief → fan-out builders → separate harsh critic → blind side-by-side against an unreachable reference → keep improving until *you* stop it.

Works on **Claude Code** (`/gauntlet-loop`, `/loop`) and **Codex** (`$gauntlet-loop`, `/goal`). Same split as `AGENTS.md` + `CLAUDE.md`: shared core, harness overlays.

```
/gauntlet-loop a COD-style FPS in ThreeJS
```

You do not paste a prompt. The agent *becomes* the orchestrator and runs the loop internally.

## The shape

Three jobs, one invoke:

1. **Brief** — name a reference that already has the quality (never describe "good"); seed two workstream-sized examples; finish the list yourself
2. **Orchestrator** — one worker per area; a *separate* harsh critic; fail → go again
3. **Quality control** — blind A/B against the real reference; exit on the artifact, not step count

The bar is deliberately unreachable. Quality is a function of runtime. **You are the brake.**

## Credit

Built on **[Matt Shumer](https://x.com/mattshumer_)** (`@mattshumer_`) cooking the 152-word Call of Duty prompt — the one that one-shotted a browser FPS and kept climbing because its own critics never picked its frame over the real game.

- **Original prompt + demo repo:** [github.com/mshumer/Claude-of-Duty](https://github.com/mshumer/Claude-of-Duty)
- **This skill:** turns that loop into `/gauntlet-loop` (Claude) / `$gauntlet-loop` (Codex) so you don't have to babysit the paste

He cooked the aim. This just makes the machine that keeps aiming.

## Install

```bash
git clone https://github.com/duolahypercho/gauntlet-loop.git
cd gauntlet-loop
./install.sh
```

Installs into:

- `~/.claude/skills/gauntlet-loop` + `~/.claude/commands/gauntlet-loop.md`
- `~/.codex/skills/gauntlet-loop` (symlink)

Override Claude config dir with `CLAUDE_CONFIG_DIR=/path/to/.claude ./install.sh`.

Restart Claude Code / Codex (or reload skills) after install.

## Use it

```text
/gauntlet-loop
/gauntlet-loop a COD-style FPS in ThreeJS
/gauntlet-loop marketing site against Linear in Next.js
/gauntlet-loop Hades-like roguelike in Godot, budget 4 hours
```

Codex:

```text
$gauntlet-loop a COD-style FPS in ThreeJS
```

Or just say "Gauntlet Loop …" in natural language.

On invoke the agent:

1. Infers nouns (thing / reference / stack / budget) — one clarifying question max
2. Writes a short contract (`ARCHITECTURE.md` / `GAUNTLET.md`)
3. Fans out builders, captures artifacts (frames / screenshots)
4. Spawns a **fresh** harsh critic with no builder memory
5. Runs blind A/B against the real reference
6. Turns defects into the next round
7. Keeps going until you stop it or the budget hits

Say **"compose only"** if you just want the filled three-paragraph prompt without the run.

## Layout

```
gauntlet-loop/
├── README.md
├── LICENSE
├── install.sh
├── commands/
│   └── gauntlet-loop.md          # Claude Code slash command
└── skills/
    └── gauntlet-loop/
        ├── SKILL.md              # boot + harness detect
        ├── AGENTS.md             # shared core (any agent)
        ├── CLAUDE.md             # Claude overlay (/loop, ultracode)
        ├── CODEX.md              # Codex overlay (/goal)
        └── examples.md           # fills + noun defaults
```

## Rules the skill will not break

- Name quality; never describe it
- Separate harsh critic; builder never self-grades
- Blind forced choice against a real reference
- Unreachable bar stays unreachable (no "stop after N flat rounds")
- Human + budget is the only stop

## License

MIT
