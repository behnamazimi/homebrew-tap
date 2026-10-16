# Homebrew tap

Homebrew formulae for [behnamazimi](https://github.com/behnamazimi) projects.

## Install

```bash
brew install behnamazimi/tap/whyfull
```

## Formulae

- [whyfull](https://github.com/behnamazimi/whyfull): find out why your Mac's disk is full, and free space safely.

## Keeping formulae current

Each whyfull release triggers `.github/workflows/update-whyfull.yml`, which regenerates `Formula/whyfull.rb` with `scripts/update-whyfull.sh` and commits it. To run it by hand, use the Actions tab. Don't edit the formula by hand; the script overwrites it.
