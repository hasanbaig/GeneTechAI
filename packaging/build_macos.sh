#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -d ".venv-build" ]; then
  python3 -m venv .venv-build
fi

source .venv-build/bin/activate
python -m pip install --disable-pip-version-check -r packaging/requirements-desktop.txt

chmod -R u+w build dist 2>/dev/null || true
rm -rf build dist

pyinstaller --clean --noconfirm packaging/GeneTechAI.spec

hdiutil create -volname "GeneTechAI" \
  -srcfolder dist/GeneTechAI.app \
  -ov -format UDZO \
  dist/GeneTechAI-macOS.dmg

echo "Built dist/GeneTechAI-macOS.dmg"
