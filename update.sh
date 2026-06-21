#!/bin/bash
set -euo pipefail
# Usage: bash update.sh
# Or:    curl -sL https://raw.githubusercontent.com/JakobMelchard/pages-template/main/update.sh | bash

COREDIR=".core"

if [ ! -d "$COREDIR" ]; then
  ROOT="$PWD"
  while [ ! -d "$ROOT/$COREDIR" ] && [ "$ROOT" != "/" ]; do
    ROOT=$(dirname "$ROOT")
  done
  if [ -d "$ROOT/$COREDIR" ]; then
    cd "$ROOT"
  else
    echo "Not installed. Run install.sh first." >&2
    exit 1
  fi
fi

cd "$COREDIR"
git fetch origin
OLD=$(git rev-parse HEAD)
NEW=$(git rev-parse @{upstream} 2>/dev/null || git rev-parse origin/main)

if [ "$OLD" = "$NEW" ]; then
  echo "Already up to date."
  exit 0
fi

echo "→ Updating core..."
git merge --ff-only "@{upstream}" 2>/dev/null || git merge --ff-only origin/main

echo "→ Changes:"
git log --oneline "$OLD..HEAD"
cd ..

echo "✓ Updated. Commit new pointer:"
echo "  git add $COREDIR && git commit -m \"chore: update core\""
