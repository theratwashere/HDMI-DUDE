#!/bin/bash
# HDMI-DUDE kiosk - displays The Dude web UI rotated portrait

export DISPLAY=:0
export XAUTHORITY=/run/user/1000/gdm/Xauthority

# Wait for X
while ! xdpyinfo >/dev/null 2>&1; do sleep 1; done

# Hide cursor
unclutter -idle 0.5 -root &

# Disable screensaver/DPMS
xset s off
xset -dpms
xset s noblank

# Serve kiosk page locally
cd /var/www/kiosk
python3 -m http.server 9090 --bind 127.0.0.1 &
sleep 1

# Kill any existing chromium
killall chromium-browser 2>/dev/null
sleep 1

# Launch chromium in kiosk mode
chromium-browser \
    --kiosk \
    --no-first-run \
    --disable-infobars \
    --disable-session-crashed-bubble \
    --noerrdialogs \
    --incognito \
    --disable-translate \
    --disable-features=TranslateUI \
    --disable-gpu \
    --window-size=600,1024 \
    --window-position=0,0 \
    'http://127.0.0.1:9090/' 2>/dev/null
