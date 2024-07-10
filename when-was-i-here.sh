#!/bin/bash
set -x
locationSource="${1}"
desiredLocationRegex="${2}"
cat $locationSource | jq --arg desiredLocationRegex $desiredLocationRegex -r '.[] | values | select(.timelinePath | values | .[].point | test($desiredLocationRegex)) | .startTime'   | cut -c1-10 | sort -u
