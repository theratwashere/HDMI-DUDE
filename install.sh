#!/bin/bash
# HDMI-DUDE installer for Jetson Nano
# Boots straight to fullscreen display - no desktop needed
set -e

echo "Installing HDMI-DUDE services..."

# Stop desktop manager if running
sudo systemctl disable gdm 2>/dev/null || true
sudo systemctl stop gdm 2>/dev/null || true

# Install service files
sudo cp services/sand-display.service /etc/systemd/system/
sudo cp services/sand.service /etc/systemd/system/

# Reload and enable
sudo systemctl daemon-reload
sudo systemctl enable sand-display.service
sudo systemctl enable sand.service

echo "Starting services..."
sudo systemctl start sand-display.service
sleep 4
sudo systemctl start sand.service

echo "Done. Check status with:"
echo "  systemctl status sand-display sand"
echo "  journalctl -u sand -f"
