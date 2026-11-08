# frozen_string_literal: true

cask "shothook" do
  version "0.1.0"
  sha256 "cee315637adc5bee0836b23eb900274fe3b175479cd8272a1f4189efb9de57f4"

  url "https://github.com/barakt12/shothook/releases/download/v#{version}/Shothook.dmg"
  name "Shothook"
  desc "Hotkey screenshots thrown straight into your AI coding agent"
  homepage "https://github.com/barakt12/shothook"

  depends_on macos: :sonoma

  app "Shothook.app"

  # Not notarized yet: clear the download quarantine (on the staged copy, before it moves into
  # Applications) so Gatekeeper doesn't block the first launch.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Shothook.app"], chdir: ".",
                          writable_paths: ["Shothook.app"]
  end

  uninstall quit: "dev.shothook.Shothook"

  zap trash: [
    "~/.config/shothook",
    "~/Library/Preferences/dev.shothook.Shothook.plist",
  ]
end
