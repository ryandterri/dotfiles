swww img -o DP-1 $1
cp $1 ~/.cache/current_wallpaper.jpg
wal -stnq -i $1
~/.config/hypr/scripts/launch_waybar.sh  > /dev/null 2>&1 &
