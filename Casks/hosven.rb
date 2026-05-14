cask "hosven" do
  version "1.0.0"
  sha256 "7ce7cb49be9a683ede4513fe350fbbd74be891f920b779c66735a4fb59ecf32f"

  url "https://github.com/twan-nguyen/hosven/releases/download/v#{version}/Hosven-v#{version}.zip"
  name "Hosven"
  desc "Quản lý /etc/hosts và .env files cho dev trên macOS"
  homepage "https://github.com/twan-nguyen/hosven"

  depends_on macos: ">= :ventura"

  auto_updates true

  app "Hosven.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Hosven.app"]
  end

  zap trash: [
    "~/Library/Caches/com.twannguyen.hosven",
    "~/Library/Preferences/com.twannguyen.hosven.plist",
    "~/Library/Saved Application State/com.twannguyen.hosven.savedState",
  ]
end
