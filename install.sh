#!/usr/bin/env bash
# Install the Claude UI skill into one or more AI coding agents.
#
#   ./install.sh                         # auto-detect installed agents, user scope
#   ./install.sh claude cursor           # specific agents
#   ./install.sh --project all           # into the current project
#   ./install.sh --dest ~/my/skills      # custom skills directory
#   ./install.sh --uninstall             # remove from detected agents
#
# Agents: claude codex cursor gemini antigravity agents all
set -eo pipefail

NAME="claude-ui"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL="$ROOT/skills/$NAME"
SCOPE="user"; DEST=""; UNINSTALL=0; AGENTS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) SCOPE="project" ;;
    --user) SCOPE="user" ;;
    --dest) DEST="$2"; shift ;;
    --uninstall) UNINSTALL=1 ;;
    -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
    *) AGENTS+=("$1") ;;
  esac
  shift
done

[[ -f "$SKILL/SKILL.md" ]] || { echo "SKILL.md not found under $SKILL" >&2; exit 1; }

user_dir() { case "$1" in
  claude) echo "$HOME/.claude/skills" ;;      codex) echo "$HOME/.codex/skills" ;;
  cursor) echo "$HOME/.cursor/skills" ;;      gemini) echo "$HOME/.gemini/skills" ;;
  antigravity) echo "$HOME/.gemini/config/plugins" ;; agents) echo "$HOME/.agents/skills" ;;
esac; }
project_dir() { case "$1" in
  claude) echo "$PWD/.claude/skills" ;;  codex) echo "$PWD/.codex/skills" ;;
  cursor) echo "$PWD/.cursor/skills" ;;  gemini) echo "$PWD/.gemini/skills" ;;
  antigravity|agents) echo "$PWD/.agents/skills" ;;
esac; }
detect_dir() { case "$1" in
  claude) echo "$HOME/.claude" ;; codex) echo "$HOME/.codex" ;; cursor) echo "$HOME/.cursor" ;;
  gemini) echo "$HOME/.gemini" ;; antigravity) echo "$HOME/.gemini/antigravity" ;; agents) echo "$HOME/.agents" ;;
esac; }

ALL=(claude codex cursor gemini antigravity agents)

install_to() { # dir label as_plugin
  local target="$1/$NAME"
  if [[ $UNINSTALL -eq 1 ]]; then
    if [[ -d "$target" ]]; then rm -rf "$target"; echo "  - removed   $2 -> $target"; else echo "  · skipped   $2 (not installed)"; fi
    return
  fi
  rm -rf "$target"; mkdir -p "$target"
  if [[ "$3" == "1" ]]; then
    cp "$ROOT/plugin.json" "$target/"; cp "$ROOT/README.md" "$target/" 2>/dev/null || true
    cp -R "$ROOT/assets" "$target/"; mkdir -p "$target/skills"; cp -R "$SKILL" "$target/skills/"
  else
    cp -R "$SKILL/." "$target/"
  fi
  echo "  + installed $2 -> $target"
}

echo; echo "Claude UI $([[ $UNINSTALL -eq 1 ]] && echo uninstaller || echo installer)"

if [[ -n "$DEST" ]]; then install_to "$DEST" custom 0; exit 0; fi

SELECTED=()
if [[ ${#AGENTS[@]} -eq 0 || " ${AGENTS[*]} " == *" auto "* ]]; then
  for a in "${ALL[@]}"; do if [[ -d "$(detect_dir "$a")" ]]; then SELECTED+=("$a"); fi; done
  if [[ " ${SELECTED[*]:-} " == *" antigravity "* && ! -f "$HOME/.gemini/settings.json" ]]; then
    TMP=(); for a in "${SELECTED[@]}"; do if [[ "$a" != gemini ]]; then TMP+=("$a"); fi; done; SELECTED=("${TMP[@]}")
  fi
  if [[ ${#SELECTED[@]} -eq 0 ]]; then SELECTED=(agents); fi
elif [[ " ${AGENTS[*]} " == *" all "* ]]; then SELECTED=("${ALL[@]}")
else SELECTED=("${AGENTS[@]}"); fi

DONE=""
for a in "${SELECTED[@]}"; do
  if [[ "$SCOPE" == "user" ]]; then dir="$(user_dir "$a")"; else dir="$(project_dir "$a")"; fi
  if [[ -z "$dir" ]]; then echo "  ! unknown agent: $a" >&2; continue; fi
  if [[ "$DONE" == *"|$dir|"* ]]; then continue; fi; DONE="$DONE|$dir|"
  plugin=0; if [[ "$a" == antigravity && "$SCOPE" == user ]]; then plugin=1; fi
  install_to "$dir" "$a" "$plugin"
done

echo; if [[ $UNINSTALL -eq 0 ]]; then echo "Done. Restart your agent so it discovers the new skill."; fi
