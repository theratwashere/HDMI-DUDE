# HDMI-DUDE

Display kiosk configs for driving a 7" TFT (EMT713) in portrait mode.

## Targets

### box (x86 Ubuntu 20.04)
Chromium kiosk displaying The Dude web UI from jetson:8000, rotated portrait via fbdev.

- `box/xorg.conf` — fbdev with CW rotation, DPMS off
- `box/hdmi-dude-kiosk.service` — systemd service for kiosk
- `box/kiosk.sh` — launches chromium fullscreen
- `box/kiosk.html` — iframe wrapper pointing at jetson:8000

### jet (Jetson Nano)
Bare Xorg kiosk for Project Sand, no desktop.

- `services/sand-display.service` — Xorg + HDMI hotplug + xrandr
- `services/sand.service` — Project Sand fullscreen

## Display

7" TFT Monitor, model EMT713, 1024x600 native, portrait orientation (600x1024).
