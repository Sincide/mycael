#!/usr/bin/env bash
# Verify runtime dependencies for the Mycael shell
set -Eeuo pipefail

pass=true
check_bin() {
  local bin="$1"; shift
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Missing: $bin $*"
    pass=false
  else
    echo "Found: $bin"
  fi
}

# Required
check_bin qs "(quickshell)"
check_bin hyprctl
check_bin jq
check_bin wl-copy "(wl-clipboard)"
check_bin notify-send "(notifications)"

# Optional utilities
for opt in grim slurp playerctl upower sensors nmcli bluetoothctl; do
  if command -v "$opt" >/dev/null 2>&1; then
    echo "Found optional: $opt"
  else
    echo "Optional missing: $opt"
  fi

done

# Wayland session check
if [[ "${XDG_SESSION_TYPE:-}" != "wayland" ]]; then
  echo "Warning: XDG_SESSION_TYPE is not wayland"
  pass=false
else
  echo "Wayland session detected"
fi

# Hyprland IPC check
if hyprctl clients >/dev/null 2>&1; then
  echo "Hyprland IPC responding"
else
  echo "Warning: hyprctl not responding"
  pass=false
fi

# Quickshell version check
if command -v qs >/dev/null 2>&1; then
  ver=$(qs --version 2>&1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -n1)
  echo "Quickshell version: $ver"
fi

if $pass; then
  echo "All required dependencies found."
  exit 0
else
  echo "Missing required dependencies."
  exit 1
fi
