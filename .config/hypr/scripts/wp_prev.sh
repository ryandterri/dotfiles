current_file=$(swww query | grep DP-1 | sed -n 's/.*wallpapers\///p')
echo "$current_file"
found=false
for file in $(ls ~/Pictures/wallpapers/*.jp* | sort -nr) ; do
    stripped="${file##*/}"
    echo "$stripped"
    if [ $found = true ]; then
        $(/home/ryandterri/.config/hypr/scripts/set_wallpaper.sh /home/ryandterri/Pictures/wallpapers/$stripped)
        break
    fi
    if [ $current_file = $stripped ]; then 
        found=true
        echo "found"
    fi
done

