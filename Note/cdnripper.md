## LEECH CONTENT FROM PUBLIC CDN

Here is that basic script
```
#!/usr/bin/env bash
# Disable unicode.
LC_ALL=C
LANG=C

printf "https://github.com/raw-%s.pdf\n" {1111..9999} >./url

# Check filetype and save pdf
while read -r LINE; do
    echo "$LINE"
    export FILETYPE="$(curl -sI "$LINE" | grep Content-Type | cut -d: -f2 | cut -d/ -f2)"
    if [ "$FILETYPE" != 'pdf' ] && [ "$FILETYPE" != 'zip' ]; then
        echo Working && echo "$LINE" >>./ok
    else
        echo FucK
    fi
done <./url
```

Extra script
```
#!/bin/bash

printf "https://s3-ap-southeast-1.amazonaws.com/paper-%s.pdf\n" {1111..9999} >./url.txt

cat ./url.txt | while read LINE; do
    echo "$LINE"
    export FILETYPE="$(curl -sI "$LINE" | grep Content-Type | cut -d: -f2 | cut -d/ -f2)"
    if [[ "$FILETYPE" = "pdf" ]]; then
        echo "$LINE" >>ok.txt
        echo "Working"
    else
        echo "FucK"
    fi
done
```
