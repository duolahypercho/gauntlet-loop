#!/usr/bin/env bash
# install.sh — install Gauntlet Loop into Claude Code + Codex.
#
# Copies:
#   skills/gauntlet-loop  -> $CLAUDE_DIR/skills/gauntlet-loop
#   commands/*.md         -> $CLAUDE_DIR/commands/
# Symlinks:
#   $CODEX_DIR/skills/gauntlet-loop -> $CLAUDE_DIR/skills/gauntlet-loop
#
# CLAUDE_DIR defaults to ~/.claude (override with CLAUDE_CONFIG_DIR).
# CODEX_DIR  defaults to ~/.codex  (override with CODEX_HOME).

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/commands"

rm -rf "$CLAUDE_DIR/skills/gauntlet-loop"
cp -R "$HERE/skills/gauntlet-loop" "$CLAUDE_DIR/skills/gauntlet-loop"

if [ -d "$HERE/commands" ]; then
  cp "$HERE/commands/"*.md "$CLAUDE_DIR/commands/" 2>/dev/null || true
fi

# Codex: same skill via symlink so one edit updates both harnesses.
if [ -d "$CODEX_DIR" ] || mkdir -p "$CODEX_DIR/skills" 2>/dev/null; then
  mkdir -p "$CODEX_DIR/skills"
  rm -rf "$CODEX_DIR/skills/gauntlet-loop"
  ln -sfn "$CLAUDE_DIR/skills/gauntlet-loop" "$CODEX_DIR/skills/gauntlet-loop"
  CODEX_OK=1
else
  CODEX_OK=0
fi

echo "✓ Installed Gauntlet Loop"
echo "    Claude skill  : $CLAUDE_DIR/skills/gauntlet-loop"
echo "    Claude command: /gauntlet-loop"
if [ "$CODEX_OK" = "1" ]; then
  echo "    Codex skill   : $CODEX_DIR/skills/gauntlet-loop -> Claude copy"
  echo "    Codex invoke  : \$gauntlet-loop  (uses /goal under the hood)"
else
  echo "    Codex skill   : skipped (no $CODEX_DIR)"
fi
echo
echo "Restart Claude Code / Codex (or reload skills), then:"
echo "  /gauntlet-loop a COD-style FPS in ThreeJS"
echo "  \$gauntlet-loop marketing site against Linear"
echo
echo "You are the brake. The loop will not finish on its own."
