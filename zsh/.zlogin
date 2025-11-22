# Start hyprland after login
if uwsm check may-start; then
  exec uwsm start hyprland.desktop
fi
