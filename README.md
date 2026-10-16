# Homebrew tap

Homebrew formulae for [behnamazimi](https://github.com/behnamazimi) projects.

## Install

```bash
brew install behnamazimi/tap/whyfull
```

## Formulae

- [whyfull](https://github.com/behnamazimi/whyfull): find out why your Mac's disk is full, and free space safely.

## Keeping formulae current

`.github/workflows/update-whyfull.yml` checks for a new whyfull release every six hours, regenerates `Formula/whyfull.rb` with `scripts/update-whyfull.sh`, and commits it. To update right away, run the workflow from the Actions tab. Don't edit the formula by hand; the script overwrites it.
