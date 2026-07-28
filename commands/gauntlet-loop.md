---
description: Run a Gauntlet Loop — fan-out builders, harsh separate critic, blind A/B against an unreachable reference, keep improving until the human stops it
argument-hint: "[what to build] [optional: against REFERENCE] [optional: in STACK]"
---

Invoke the **gauntlet-loop** skill and **run it internally**. Do not dump a prompt for the user to paste.

Follow `~/.claude/skills/gauntlet-loop/SKILL.md` → `AGENTS.md` → `CLAUDE.md` exactly:

1. Infer nouns from the args below (thing / reference / stack / budget / **hard_panel**). One clarifying question max if THING is missing, then start.
2. Print the one-line status + the "you are the brake" honesty line.
3. Write a short contract file — **product subsystems only**. Never list capture/blind-compare/critic tools as a workstream.
4. Fan out **product** builders; grab the cheapest glanceable artifacts; spawn a fresh harsh critic with no builder memory.
5. Blind A/B on **matched** sheets only; **hard panel owns the tally**; turn **product** defects into the next round; **immediately start the next round in the same turn** under `/loop` + ultracode posture.
6. Stop only when the human stops you or the budget hits. Never ask "want me to continue?"

Do not soften the critic. Do not lower the reference so the loop can "finish." Do not invent a stop condition.
**Do not end the turn after one fan-out → critic cycle.** That is the #1 failure mode. See AGENTS.md §7 Continuation contract. Write `GAUNTLET_STATE.md` every round; bare re-invoke resumes.
**Do not spend rounds on capture/harness FPS.** That is the #2 failure mode. The loop body is always the product (AGENTS.md — "Why the pure prompt works").

Task: $ARGUMENTS
