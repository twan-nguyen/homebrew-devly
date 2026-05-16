cask "hosven" do
  version "1.0.10"
  sha256 "78ea9ba65b85db15ba169538e6583ef4f98c4c35352ac8ec0c6a0daf11e9b4c0"

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
