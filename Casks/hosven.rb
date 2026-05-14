cask "hosven" do
  version "1.0.1"
  sha256 "cf780a4e159b14db2dbbb57b420c79970d4385279e344b6b815c00a9ab65f3b3"

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
