#!/bin/bash

if ! update_count=$(checkupdates 2>/dev/null | wc -l); then
  update_count=0
fi

printf '{"text": "%s", "alt": "%s", "tooltip": "Update now", "class": "%s"}' "$update_count" "$update_count" "$update_count" "green"
