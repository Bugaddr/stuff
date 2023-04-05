#!/usr/bin/env bash

set -exv

# Kill on ctrl+c [https://askubuntu.com/questions/617013/ctrlc-command-is-not-terminating-infinite-while-loop]
trap trapint SIGINT SIGTERM
function trapint {
    exit 0
}

# Skip check if no list is present
if [ $# -eq 0 ]; then
    echo "No list of hostnames was specified."
    exit 1
fi

# Some variables
count=$(($(wc -l < "$1")))
blocked=0
current=0

#Start querying
sleep .5
echo "The script will query a total of $count hostnames."
sleep .5

while IFS= read -r DOMAIN; do
  host "$DOMAIN" | grep "49.44.18.34" > /dev/null && let "blocked=blocked+1"
  let "current=current+1"
  echo -ne "[TOTAL]: $count [CURRENT]: $current [BLOCKED]: $blocked"\\r
done < "$1"

# Echo final result
echo "[TOTAL]: $count [CURRENT]: $current [BLOCKED]: $blocked";
echo "$blocked out of the $count hostnames in the provided list appear to be blocked."


#BY KARANSAINI
