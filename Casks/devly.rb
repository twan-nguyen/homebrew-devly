cask "devly" do
  version "2.2.1"
  sha256 "63b2f41233a6b03f746c2589e2b9327cd06de8898bf894e512238ee25e16eda1"

  url "https://github.com/twan-nguyen/Devly/releases/download/v#{version}/Devly-v#{version}.zip"
  name "Devly"
  desc "Quản lý /etc/hosts và .env files cho dev trên macOS"
  homepage "https://github.com/twan-nguyen/Devly"

  depends_on macos: ">= :ventura"

  app "Devly.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Devly.app"]
  end

  zap trash: [
    "~/Library/Caches/com.devly.app",
    "~/Library/Preferences/com.devly.app.plist",
    "~/Library/Saved Application State/com.devly.app.savedState",
  ]
end
