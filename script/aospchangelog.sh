#!/usr/bin/env bash

set -ufo pipefail

prio_tag="${1:-__non_existent_tag__}"
shift

flags="${*:---oneline --committer=kdrag0n}"

cd "$(dirname "$0")"
cd ../../aosp12

for r in $(cat ../proton-scripts/repos.list)
do
    echo $r:
    pushd $r > /dev/null
    last_tag="$(git describe --abbrev=0 2>/dev/null)"
    if [[ "$?" -ne 0 ]]; then
    	last_tag="__non_existent_tag__"
    fi
	( git log $flags "$prio_tag"..HEAD 2>/dev/null || \
        git log $flags $last_tag..HEAD 2>/dev/null || \
	git log $flags github/lineage-18.0..HEAD 2>/dev/null || \
	git log $flags github/lineage-17.1..HEAD 2>/dev/null || \
	git log $flags $(git rev-list --max-parents=0 HEAD)..HEAD ) | cat

    popd > /dev/null
    echo
    echo
done

#SOURCE: https://t.me/protonaosp/5918 (kdrag0n)
