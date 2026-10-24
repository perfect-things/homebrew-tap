cask "wicher" do
  version "0.4.4"
  sha256 "de0f4dcb65c1f8f9eeb35bc421af96569b43d02775fea070f99b361f219501d1"

  url "https://github.com/perfect-things/wicher/releases/download/v#{version}/Wicher-#{version}.zip"
  name "Wicher"
  desc "Keyboard-driven window switcher"
  homepage "https://github.com/perfect-things/wicher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Wicher.app"

  # Self-signed, not notarized: strip the quarantine flag so Gatekeeper doesn't block launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Wicher.app"]
  end

  uninstall quit: "dev.wicher.app"

  zap trash: "~/Library/Preferences/dev.wicher.app.plist"
end
