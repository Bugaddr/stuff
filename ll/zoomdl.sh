#!/usr/bin/env bash

COOKIE="$1"
OUT="$2"
URL="$3"

wget --load-cookies "$COOKIE" \
    -U 'Mozilla/5.0 (Android 10; Mobile; rv:91.0) Gecko/91.0 Firefox/91.0' \
    --referer 'https://api.zoom.us/' "$URL" \
    -O "$OUT"
