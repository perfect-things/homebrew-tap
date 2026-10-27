cask "wicher" do
  version "0.5.2"
  sha256 "17032b1e20fad970a8ef44360f3634fd93a00677d43c718a63272b6b38c351ce"

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
