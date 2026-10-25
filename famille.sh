#!/bin/sh
# Copie le jeu dans le dossier de chaque autre famille (copie exacte : famille.js lit le nom du dossier
# pour choisir les prénoms, les avatars et la sauvegarde). Lancé automatiquement par bump-version.sh.
set -e
cd "$(dirname "$0")"
for F in pc; do
  rm -rf "$F"; mkdir -p "$F"
  cp index.html kicuit.html cube.html version.js famille.js sw.js solver-worker.js icon-180.png icon-512.png "$F"/
  cp -r vendor "$F"/
  sed 's/"name":"La Maison de Kicuit"/"name":"Kicuit · Perline et Calypso"/' manifest.webmanifest > "$F"/manifest.webmanifest
done
echo "familles copiées : pc"
