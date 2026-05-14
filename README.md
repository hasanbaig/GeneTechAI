![GeneTech Logo](https://github.com/hasanbaig/GeneTech/blob/master/GT-Logo.png)

# GeneTechAI

GeneTechAI extends GeneTech, a genetic technology mapping tool, with an AI-assisted workflow for designing genetic logic circuits. A user can describe a desired behavior for a living cell using Boolean algebra, and the project can optimize, synthesize, and map that expression into feasible genetic circuits using a genetic gate library.

GeneTechAI keeps the original GeneTech circuit generation pipeline and adds newer interfaces for AI and web-based use. The Groq-powered natural language parser can convert plain-language circuit descriptions into Boolean expressions using supported inputs such as IPTG, aTc, and Arabinose. The generated designs can be exported as SBOL data, SBOL visual diagrams, and logic circuit schematics.

## What GeneTechAI Does

- Converts Boolean expressions into genetic logic circuit designs.
- Performs logic optimization, synthesis, and technology mapping.
- Generates feasible circuit alternatives using available genetic gates.
- Produces SBOL files, SBOL visual output, and logic schematics.
- Includes AI-assisted natural language parsing through Groq.
- Includes both the original PyQt desktop interface and a Flask web interface.

## Platform

GeneTechAI is written in Python 3.

The original GeneTech project is available at:

```text
https://github.com/hasanbaig/GeneTech.git
```

This GeneTechAI repository is intended for the AI-enhanced version:

```text
https://github.com/hasanbaig/GeneTechAI.git
```

## Installation

Clone the repository:

```bash
git clone https://github.com/hasanbaig/GeneTechAI.git
cd GeneTechAI
```

Install the main dependencies:

```bash
pip3 install -r src/requirements.txt
```

For the Flask deployment/runtime dependencies, install:

```bash
pip3 install -r src/requirements-render.txt
```

## Running the Desktop App

Run the original GeneTech desktop interface:

```bash
python src/Genetech.py
```

If you run into NumPy compatibility issues, use the compatibility launcher:

```bash
python src/run_genetech.py
```

## Download

The latest macOS installer is available from the GitHub Releases page:

```text
https://github.com/hasanbaig/GeneTechAI/releases
```

Download `GeneTechAI-macOS.dmg`, open it, and launch `GeneTechAI.app`.

If macOS blocks the app, go to System Settings > Privacy & Security and click Open Anyway.

GeneTechAI builds on the GeneTech project and its contributors:

1. Hasan Baig
2. Jan Madsen
3. Mudasir Hanif
4. Muhammad Ali Bhutto
5. Mukesh Kumar
6. Abdullah Siddiqui
7. Adil Ali Khan
