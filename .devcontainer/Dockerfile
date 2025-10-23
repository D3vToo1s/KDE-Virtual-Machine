# Use a base image that is compatible with KDE Neon
FROM neon:user-lts

# Install necessary VNC and desktop components
RUN apt-get update && apt-get install -y \
    tigervnc-standalone-server \
    novnc \
    xterm \
    dbus-x11 \
    fluxbox \
    websockify \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up the VNC and noVNC service
EXPOSE 6080 5901
CMD ["/bin/bash", "-c", "x11vnc -display :1 -localhost -nopw -bg -xkb -noshm -forever && websockify 6080 localhost:5901"]
