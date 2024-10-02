#!/bin/bash

while IFS= read -r line; do
  message=$(echo $line | jq -r '. | .envelope.dataMessage.message')
  title=$(echo $line | jq -r '. | .envelope.sourceName')
  attachments=$(echo $line | jq -r '. | .envelope.dataMessage.attachments | length')

  if [ "$message" != null ]; then
    curl -H "Title: $title" -d "$message" ntfy.sh/cGFN6Z8S99Ax5yR2
  else
    if [ "$attachments" != 0 ]; then
      message="Sent $attachments attachments"
      curl -H "Title: $title" -d "$message" ntfy.sh/cGFN6Z8S99Ax5yR2
    fi
  fi
done < <(signal-cli --output=json receive)

# signal-cli --output=json receive |
#   jq -s 'map(select(.envelope.dataMessage)) | map({from: .envelope.sourceName, message: .envelope.dataMessage.message, time: .envelope.dataMessage.timestamp})' |
#   jq -r '.[] | "-H \"Title: New message from \(.from)\" -d \"\(.message)\" ntfy.sh/cGFN6Z8S99Ax5yR2"' |
#   xargs -L 1 curl
