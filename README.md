# Mycael

Mycael is a modular desktop shell built with [Quickshell](https://quickshell.outfoxxed.me) and designed to run on the [Hyprland](https://hyprland.org) Wayland compositor.  It bundles QML components, services and utilities that can be combined to build a complete desktop experience.

## Features

- Quickshell‑powered bar, drawers and OSD widgets
- Optional integrations for audio, MPRIS, power and network
- JSON configuration with sane defaults
- Works alongside existing Hyprland configurations

## Installation

### Arch Linux / derivatives

1. Clone this repository:
   ```bash
   git clone https://github.com/Sincide/mycael.git
   cd mycael
   ```
2. Check required runtime dependencies:
   ```bash
   ./arch-port/scripts/check-deps.sh
   ```
3. Link configuration into your XDG directories (creates backups automatically):
   ```bash
   ./arch-port/scripts/link.sh
   ```
4. Start the shell manually with:
   ```bash
   mycael-run &
   ```
5. Or enable auto‑start via systemd:
   ```bash
   systemctl --user daemon-reload
   systemctl --user enable --now mycael.service
   ```

Detailed documentation, optional dependencies and troubleshooting notes live under `arch-port/docs/`.

### Nix

Nix users can continue to use the flake provided in this repository.  The manual Arch layout above does not interfere with the Nix configuration.

## Updating

Pull the latest changes and rerun `arch-port/scripts/link.sh`.  Previous versions are preserved under `~/.local/state/mycael-backup-*`.

## License

This project is distributed under the terms of the [MIT License](LICENSE).
