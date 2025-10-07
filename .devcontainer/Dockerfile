FROM ubuntu:22.04

# Install necessary packages for KDE Plasma, a VNC server, and Chromium
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository -y universe \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    kde-plasma-desktop \
    chromium-browser \
    x11vnc \
    xvfb \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up a non-root user (important for security)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Expose VNC port
EXPOSE 5900

# Create and define the startup script
COPY start-vnc.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-vnc.sh

# Set the default command to start the VNC server
CMD ["/usr/local/bin/start-vnc.sh"]
