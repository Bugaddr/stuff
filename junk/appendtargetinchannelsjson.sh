#!/usr/bin/env bash

set -e

unset PUT1
unset FIND1
unset commands
jq -c '.result[].logoUrl' channels.json | while read -r LOGO; do
    export PUT1="$(echo "$LOGO" | cut -d'"' -f2 | cut -d'.' -f1)"
    export FIND1="$PUT1.png"
    mv channels.json channels.json.tmp
    export command=$(echo -e "jq 'select(.result[].logoUrl == \"$FIND1\").result[].target |= (\"$PUT1\")' channels.json.tmp")
    echo "$command"
    bash -c "$command" >>channels.json && wait
    rm -rf channels.json.tmp
    unset PUT1
    unset FIND1
    unset command
done
