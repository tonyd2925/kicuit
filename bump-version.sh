#!/bin/sh
# Augmente le numéro de version partout (cache hors ligne + version affichée).
# Usage : ./bump-version.sh   puis commit, tag et push (voir CLAUDE.md).
set -e
cd "$(dirname "$0")"
N=$(sed -n "s/^const C='kicuit-v\([0-9]*\)';/\1/p" sw.js)
N=$((N + 1))
D=$(TZ=Europe/Paris date +%d/%m/%Y)
sed -i "s/^const C='kicuit-v[0-9]*';/const C='kicuit-v$N';/" sw.js
printf 'window.KICUIT_VERSION = "Version %s · %s";\n' "$N" "$D" > version.js
echo "v$N"
