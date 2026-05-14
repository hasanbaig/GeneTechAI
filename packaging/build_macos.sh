#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"
BUILD_DIR="/private/tmp/genetechai-build"
DIST_DIR="/private/tmp/genetechai-dist"
RELEASE_DIR="$ROOT_DIR/release"

if [ ! -d ".venv-build" ]; then
  python3 -m venv .venv-build
fi

source .venv-build/bin/activate
python -m pip install --disable-pip-version-check -r packaging/requirements-desktop.txt

chmod -R u+w "$BUILD_DIR" "$DIST_DIR" 2>/dev/null || true
rm -rf "$BUILD_DIR" "$DIST_DIR"
mkdir -p "$RELEASE_DIR"

pyinstaller --noconfirm \
  --workpath "$BUILD_DIR" \
  --distpath "$DIST_DIR" \
  packaging/GeneTechAI.spec

hdiutil create -volname "GeneTechAI" \
  -srcfolder "$DIST_DIR/GeneTechAI.app" \
  -ov -format UDZO \
  "$RELEASE_DIR/GeneTechAI-macOS.dmg"

echo "Built release/GeneTechAI-macOS.dmg"
