# Full Stack House Homebrew tap

Homebrew casks and formulae for Full Stack House's own macOS builds.

```bash
brew tap fullstackhouse/tap
```

## What's in here

### `paseo-fsh`

The [FSH fork](https://github.com/fullstackhouse/paseo) of [Paseo](https://paseo.sh), the
self-hosted daemon for AI coding agents. Apple Silicon, macOS 13+, and it conflicts with the
upstream `paseo` cask — you can have one or the other, not both.

**Install and upgrade steps, the DMG fallback and troubleshooting:
[FSH.md](https://github.com/fullstackhouse/paseo/blob/fsh/FSH.md#install-the-desktop-app-macos-apple-silicon).**

Per-app instructions live with the app, not here. This file only covers what is true of the tap
itself.

## Trusting the tap

Homebrew 6 introduced [tap trust](https://docs.brew.sh/Tap-Trust): it will not load code from a
third-party tap until you say so. Until you do, every command stops with

```
Error: Refusing to load cask fullstackhouse/tap/<cask> from untrusted tap fullstackhouse/tap.
```

Trust is a one-off, and recorded **per machine** — a new laptop needs it again.

```bash
brew trust --cask fullstackhouse/tap/<cask>   # just this cask (preferred)
brew trust fullstackhouse/tap                 # the whole tap, including anything added later
```

Prefer the per-cask form. Whole-tap trust also covers casks and formulae we add in the future,
which you will not have reviewed.

## Signing

FSH builds are ad-hoc signed, not notarized with an Apple Developer ID. macOS would report them
as damaged, so each cask clears the quarantine flag itself after install. Nothing extra to run,
but it does mean no in-app auto-update: that needs a signed build.

## Keeping casks current

Each cask has a workflow in `.github/workflows/` that polls the source repo's latest release and
pushes a version/sha bump — no cross-repo token needed, so the default `GITHUB_TOKEN` is enough.
`paseo-fsh` follows the newest `fsh-*` release within 30 minutes (`bump.yml`).

Casks skip `livecheck` because of this; `brew livecheck` would fight the bump workflow.

## Adding a cask

1. Add `Casks/<name>.rb`. Use `postflight_steps` (not the deprecated `postflight`) for any
   post-install step, and `{{appdir}}` rather than `#{appdir}` inside it.
2. Add a bump workflow modelled on `bump.yml` if the source repo cuts releases.
3. Add a `### <name>` section above pointing at the app's own docs. Do not paste install steps here.
4. Check `brew style --cask Casks/<name>.rb` is clean before opening the PR.
