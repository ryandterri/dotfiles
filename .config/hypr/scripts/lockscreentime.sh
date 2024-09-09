#/bin/bash
#  ___    _ _      _   _
# |_ _|__| | | ___| |_(_)_ __ ___   ___
#  | |/ _` | |/ _ \ __| | '_ ` _ \ / _ \
#  | | (_| | |  __/ |_| | | | | | |  __/
# |___\__,_|_|\___|\__|_|_| |_| |_|\___|
#
#
# by Stephan Raabe (2023)
# -----------------------------------------------------

if [ -f "/usr/bin/swayidle" ]; then
  echo "swayidle is installed."
  swayidle -w timeout 600 'swaylock -f' timeout 660 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
  # swayidle timeout 660 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
  echo "swayidle not installed."
fi
