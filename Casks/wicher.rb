cask "wicher" do
  version "0.1.0"
  sha256 "REPLACED_BY_CI"

  url "https://github.com/perfect-things/wicher/releases/download/v#{version}/Wicher-#{version}.zip"
  name "Wicher"
  desc "Keyboard-driven window switcher"
  homepage "https://github.com/perfect-things/wicher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Wicher.app"

  # Self-signed, not notarized: strip the quarantine flag so Gatekeeper doesn't block launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Wicher.app"]
  end

  uninstall quit: "dev.wicher.app"

  zap trash: "~/Library/Preferences/dev.wicher.app.plist"
end
