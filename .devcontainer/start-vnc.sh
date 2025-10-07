#!/bin/bash

# Create a VNC password
# Note: For production use, this should be handled more securely.
# For codespaces, this is temporary and can be set at runtime.
echo "vncpassword" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Start Xvfb (Virtual Frame Buffer)
Xvfb :0 -screen 0 1024x768x24 &

# Start KDE Plasma desktop on the virtual display
DISPLAY=:0 startplasma-x11 &

# Start x11vnc to serve the desktop
x11vnc -display :0 -rfbport 5900 -forever -usepw -shared
