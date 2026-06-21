#!/bin/bash
set -euo pipefail
# Usage: curl -sL https://raw.githubusercontent.com/JakobMelchard/pages-template/main/install.sh | bash
# Or:    bash install.sh

COREDIR=".core"
CORE_REPO="JakobMelchard/pages-core"
BRANCH="${1:-main}"

if [ -d "$COREDIR" ]; then
  echo "Already installed. Run: bash $COREDIR/../update.sh"
  exit 1
fi

if git rev-parse --git-dir &>/dev/null; then
  git submodule add "https://github.com/$CORE_REPO.git" "$COREDIR"
  git submodule update --init "$COREDIR"
else
  git clone --branch "$BRANCH" "https://github.com/$CORE_REPO.git" "$COREDIR"
fi

git config core.hooksPath "$COREDIR/hooks/"

for f in .gitignore .gitleaks.toml _exclude; do
  [ -f "$f" ] || cp "$COREDIR/$f" "$f"
done

cat >> _exclude <<'EOF'
/.core
/scripts
EOF

if ! command -v gitleaks &>/dev/null; then
  echo "  ⚠ gitleaks not found — install manually (brew install gitleaks)"
fi

echo "✓ installed"
echo "  Update: bash $COREDIR/../update.sh"
