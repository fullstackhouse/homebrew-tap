cask "paseo-fsh" do
  version "0.13.0-beta.1-15c0b7e"
  sha256 "a58fba932225520085f037328037d07c18312d3282ee6dc49f28d271a9bc939f"

  url "https://github.com/fullstackhouse/paseo/releases/download/fsh-0.13.0-beta.1-15c0b7e/Paseo-0.13.0-beta.1-arm64.dmg"
  name "Paseo (FSH)"
  desc "Full Stack House build of Paseo, the self-hosted daemon for AI coding agents"
  homepage "https://github.com/fullstackhouse/paseo"

  livecheck do
    skip "Retired: FSH builds install with fullstackhouse/paseo's scripts/install-fsh.sh"
  end

  disable! date: "2026-10-28", because: "moved to an install script (curl -fsSL https://raw.githubusercontent.com/fullstackhouse/paseo/fsh/scripts/install-fsh.sh | bash), which also removes this cask"

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
