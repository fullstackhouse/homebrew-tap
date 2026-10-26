cask "paseo-fsh" do
  version "0.13.0-beta.1-0a255c6"
  sha256 "466e2f71fd796971dff86ee06f1d66a7601feb50347d4d98c7e4f03ef86207b4"

  url "https://github.com/fullstackhouse/paseo/releases/download/fsh-0.13.0-beta.1-0a255c6/Paseo-0.13.0-beta.1-arm64.dmg"
  name "Paseo (FSH)"
  desc "Full Stack House build of Paseo, the self-hosted daemon for AI coding agents"
  homepage "https://github.com/fullstackhouse/paseo"

  # Bumped by .github/workflows/bump.yml from the latest fullstackhouse/paseo release.
  livecheck do
    skip "Updated by the tap's bump workflow"
  end

  conflicts_with cask: "paseo"
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Paseo.app"
  binary "#{appdir}/Paseo.app/Contents/Resources/bin/paseo"

  # FSH builds are ad-hoc signed, not notarized: without this macOS reports the app as damaged.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Paseo.app"]
  end

  caveats <<~EOS
    Paseo runs the daemon your agents live in. After `brew upgrade --cask paseo-fsh`,
    quit Paseo (Cmd+Q) and reopen it when no agent is mid-turn.
  EOS
end
