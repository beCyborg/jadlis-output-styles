#!/bin/sh
# install.sh — copy the Jadlis output styles into Claude Code.
#
# Copies jadlis.md and jadlis-voice.md into ${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles.
# A file that already exists and differs is moved to <file>.bak-<date> first.
# A second run changes nothing and prints UNCHANGED.
#
# Usage: sh install.sh [--plan]
#   --plan   show what would change (with a diff), write nothing
set -eu

HERE=$(cd "$(dirname "$0")" && pwd)
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles"
MODE=apply

while [ $# -gt 0 ]; do
	case "$1" in
		--plan) MODE=plan; shift ;;
		-h|--help) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
		*) printf 'install.sh: unknown option %s\n' "$1" >&2; exit 2 ;;
	esac
done

for f in jadlis.md jadlis-voice.md; do
	src="$HERE/$f"
	dst="$DEST/$f"
	[ -f "$src" ] || { printf '%s=MISSING-SOURCE\n' "$f"; continue; }
	if [ -f "$dst" ] && cmp -s "$src" "$dst"; then
		printf '%s=UNCHANGED\n' "$f"
	elif [ "$MODE" = plan ]; then
		if [ -f "$dst" ]; then
			printf '%s=WOULD-REPLACE (old file → .bak)\n' "$f"
			diff -u "$dst" "$src" | sed -e "1s|.*|--- installed $f|" -e "2s|.*|+++ new $f|" || true
		else
			printf '%s=WOULD-WRITE\n' "$f"
		fi
	else
		mkdir -p "$DEST"
		if [ -f "$dst" ]; then
			bak="$dst.bak-$(date +%Y%m%d-%H%M%S)"
			cp "$dst" "$bak"
			printf '%s.backup=%s\n' "$f" "$bak"
		fi
		cp "$src" "$dst"
		printf '%s=WRITTEN\n' "$f"
	fi
done

printf 'output_styles.path=%s\n' "$DEST"
exit 0
