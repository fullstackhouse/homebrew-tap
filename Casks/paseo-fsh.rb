cask "paseo-fsh" do
  version "0.13.0-beta.1-28159c2"
  sha256 "a604fe8a8245433fc3fe0e67261b769951079b52f187ba941fb578d4d21cb330"

  url "https://github.com/fullstackhouse/paseo/releases/download/fsh-0.13.0-beta.1-28159c2/Paseo-0.13.0-beta.1-arm64.dmg"
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
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Paseo.app"]
  end

  caveats <<~EOS
    Paseo runs the daemon your agents live in. After `brew upgrade --cask paseo-fsh`,
    quit Paseo (Cmd+Q) and reopen it when no agent is mid-turn.
  EOS
end
