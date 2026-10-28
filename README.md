# Full Stack House Homebrew tap (retired)

This tap is retired and archived. It held one cask, `paseo-fsh`, which is now disabled and no longer follows new
builds.

Install and update the [FSH build of Paseo](https://github.com/fullstackhouse/paseo) with its install script instead:

```bash
curl -fsSL https://raw.githubusercontent.com/fullstackhouse/paseo/fsh/scripts/install-fsh.sh | bash
```

The script removes the `paseo-fsh` cask if it's still installed. To clean up the tap itself afterwards:

```bash
brew untap fullstackhouse/tap
```

Setup details live in [FSH.md](https://github.com/fullstackhouse/paseo/blob/fsh/FSH.md#install-the-desktop-app-and-plugins-macos-apple-silicon).
