# Troubleshooting

## Quickshell fails to start
* Ensure `qs` from `quickshell-git` is installed and in `PATH`.
* Run `mycael-run` from a terminal to view logs at `~/.local/state/mycael/logs/mycael.log`.

## No Wayland session
`XDG_SESSION_TYPE` must be `wayland` and Hyprland must be running. Verify with `echo $XDG_SESSION_TYPE` and `hyprctl clients`.

## Missing icons or fonts
Install `material-symbols`, `ttf-cascadia-code-nerd`, `noto-fonts`, and `noto-fonts-emoji`.

## Screen flicker / VRR
Disable VRR in Hyprland by adding:
```conf
misc {
    vrr = 0
}
```

## Clipboard or screenshot tools not working
Check that `wl-clipboard`, `grim` and `slurp` are installed. Re-run `./arch-port/scripts/check-deps.sh` to confirm.
