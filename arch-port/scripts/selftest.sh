#!/usr/bin/env bash
# Basic self-test for Mycael scripts
set -Eeuo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"

"$SCRIPT_DIR/check-deps.sh" || true

tmpimg=$(mktemp)
trap 'rm -f "$tmpimg"' EXIT
printf '\211PNG\r\n\032\n' >"$tmpimg" # dummy header
if "$ROOT/.local/bin/mycael-wallpaper-set" "$tmpimg" 2>/tmp/wall.log; then
	echo "wallpaper-set executed"
else
	echo "wallpaper-set failed (expected if no wallpaper tool)"
fi
