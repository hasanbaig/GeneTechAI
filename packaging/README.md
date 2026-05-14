# GeneTechAI Packaging

This folder contains a PyInstaller build setup for creating a desktop app bundle from the PyQt GeneTechAI launcher.

## 1. Create a clean build environment

From the repository root:

```bash
python3 -m venv .venv-build
source .venv-build/bin/activate
python -m pip install --upgrade pip
python -m pip install -r packaging/requirements-desktop.txt
```

## 2. Build the desktop app

```bash
pyinstaller --clean --noconfirm packaging/GeneTechAI.spec
```

The build output will appear in:

```text
release/GeneTechAI-macOS.dmg
```

## 3. Create a macOS DMG installer

The build script creates the DMG automatically. If you need to create it manually after a PyInstaller build:

```bash
hdiutil create -volname "GeneTechAI" \
  -srcfolder dist/GeneTechAI.app \
  -ov -format UDZO \
  dist/GeneTechAI-macOS.dmg
```

## Windows installer option

Build on Windows, not macOS:

```powershell
py -m venv .venv-build
.venv-build\Scripts\activate
python -m pip install --upgrade pip
python -m pip install -r packaging\requirements-desktop.txt
pyinstaller --clean --noconfirm packaging\GeneTechAI.spec
```

Then wrap `dist\GeneTechAI\` with an installer tool such as Inno Setup.

## Notes

- Do not package `.env` files or API keys.
- Generated output folders such as `src/user_files/` and `src/database_reports/` should stay out of the installer.
- If Groq natural language parsing is used, users should provide `GROQ_API_KEY` on their own machine.
- The first packaging pass may reveal file path issues because desktop apps run from a bundled directory. If that happens, update path handling before distributing the installer.
