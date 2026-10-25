cask "wicher" do
  version "0.5.1"
  sha256 "fc22f4c52d3f50154e81ead3952c6c2923788df8889ff2aa1daf20e9c0569473"

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
