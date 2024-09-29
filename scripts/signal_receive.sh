#!/bin/bash

signal-cli --output=json receive |
  jq -s 'map(select(.envelope.dataMessage)) | map({from: .envelope.sourceName, message: .envelope.dataMessage.message, time: .envelope.dataMessage.timestamp})' |
  jq -r '.[] | "-H \"Title: New message from \(.from)\" -d \"\(.message)\" ntfy.sh/cGFN6Z8S99Ax5yR2"' |
  xargs -L 1 curl
