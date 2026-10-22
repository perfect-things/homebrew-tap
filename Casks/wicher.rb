cask "wicher" do
  version "0.4.3"
  sha256 "c3803a3c150f60c316d2921b1d0d48226d1947b53860ecff1f82f6f2c2c13b07"

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
