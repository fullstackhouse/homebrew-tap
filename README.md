# Full Stack House Homebrew tap

```bash
brew tap fullstackhouse/tap
brew install --cask paseo-fsh           # fresh install
brew install --cask --adopt paseo-fsh   # take over a Paseo.app you installed from the DMG
```

Update to the newest FSH build:

```bash
brew upgrade --cask paseo-fsh
```

Then quit Paseo (⌘Q) and reopen it. Paseo runs the daemon your agents live in, so pick a moment when no agent is mid-turn.

`paseo-fsh` is the [FSH fork](https://github.com/fullstackhouse/paseo) of Paseo, Apple Silicon only. It conflicts with the upstream `paseo` cask. The cask follows the latest `fsh-*` release within 30 minutes (`.github/workflows/bump.yml`).

FSH builds are ad-hoc signed and not notarized, so the cask clears the quarantine flag after install. Homebrew 5 deprecated unsigned casks; this tap is a stopgap until the builds are signed.
