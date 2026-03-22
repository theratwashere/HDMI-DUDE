# HDMI-DUDE

Kiosk-mode HDMI output for Jetson Nano. Boots straight to fullscreen display, no desktop needed.

## What it does

- Disables GDM/desktop
- Starts a bare Xorg server on HDMI
- Forces HDMI hotplug (Tegra workaround for late-connected displays)
- Disables screensaver/DPMS
- Launches Project Sand fullscreen at 1280x720

## Install

```bash
git clone git@github.com:theratwashere/HDMI-DUDE.git
cd HDMI-DUDE
chmod +x install.sh
./install.sh
```

## Services

| Service | Purpose |
|---------|---------|
| `sand-display` | Bare Xorg + HDMI hotplug + xrandr |
| `sand` | Project Sand app (depends on sand-display) |

## Useful commands

```bash
# Status
systemctl status sand-display sand

# Logs
journalctl -u sand -f

# Restart
sudo systemctl restart sand

# Stop everything
sudo systemctl stop sand sand-display
```
