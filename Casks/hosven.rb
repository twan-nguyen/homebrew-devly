cask "hosven" do
  version "1.0.3"
  sha256 "86f7971e1664d12ff69812a11f330a7f1203bdcb679e9afdbf912d6a02cb5ca3"

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
