#!/bin/bash

# This script is executed after the container is created.
# It sets up and starts the VNC server.

# Start the X-server
/usr/bin/vncserver :1 -localhost -geometry 1280x800 -depth 24 &

# Start Fluxbox for a basic window manager (if needed)
fluxbox &

# Wait for the VNC server to start
sleep 5

# Start noVNC, which bridges websockets to the VNC server
websockify 6080 localhost:5901
