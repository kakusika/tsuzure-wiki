<!-- Generated from tmtroot/readme.tmt. Edit that, then `tomet export .`. -->

# Tsuzure Wiki

Wiki application for the Tomet ecosystem.

## Overview

`tsuzure-wiki` provides a Wiki experience for Tomet workspaces.

## Usage

```bash
tsuzure-wiki [path]              # open wiki for path (defaults to ".")
```

## Workspace Layout

- `app` (`tsuzure-wiki`) -- Main CLI binary.

## Building and Testing

### Build workspace

```bash
just build
```

### Run tests

```bash
just test
```

### Check code

```bash
just check
just clippy
```

### Documentation

```bash
just docs        # regenerate Markdown from tmtroot/
just docs-check  # verify docs match exports
```

