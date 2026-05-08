cask "devly" do
  version "1.0.0"
  sha256 "7ce7cb49be9a683ede4513fe350fbbd74be891f920b779c66735a4fb59ecf32f"

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
