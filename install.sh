#!/bin/sh
mkdir -p ~/.local/bin/ && cp mpv-url-handler.sh ~/.local/bin/
mkdir -p ~/.local/share/applications && cp mpv-url-handler.desktop  ~/.local/share/applications/
chmod +x ~/.local/bin/mpv-url-handler.sh
echo "Exec=$HOME/.local/bin/mpv-url-handler.sh %u" >> ~/.local/share/applications/mpv-url-handler.desktop
# Register mpv handler
xdg-mime default mpv-url-handler.desktop x-scheme-handler/mpv
