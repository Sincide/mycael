# Migrating from Nix

The original project ships Nix flake definitions. To switch to the manual Arch layout:

1. Disable any `caelestia-shell` services from your Nix configuration.
2. Remove or rename `~/.config/quickshell/mycael` if it exists.
3. Clone this repository and run `./arch-port/scripts/link.sh`.
4. Enable autostart via systemd (`systemctl --user enable --now mycael.service`) or Hyprland.
5. Keep the Nix files if you plan to contribute upstream – they are untouched by this setup.
