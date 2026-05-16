cask "hosven" do
  version "1.0.9"
  sha256 "09e8599e7a48efca4f97df00d8c361f4b6399b12d25dc19b960d507f0459724a"

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
