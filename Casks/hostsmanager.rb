cask "hostsmanager" do
  version "1.4.0"
  sha256 "033069d920bbf28c6a38308bf1d79a6977ecff4845b2f463692fb337ce7c03d3"

  url "https://github.com/twannguyenba-hash/HostsManager/releases/download/v#{version}/HostsManager-v#{version}.zip"
  name "HostsManager"
  desc "Quản lý file /etc/hosts trên macOS"
  homepage "https://github.com/twannguyenba-hash/HostsManager"

  depends_on macos: ">= :ventura"

  app "HostsManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/HostsManager.app"]
  end

  zap trash: [
    "~/Library/Caches/com.hostsmanager.app",
    "~/Library/Preferences/com.hostsmanager.app.plist",
    "~/Library/Saved Application State/com.hostsmanager.app.savedState",
  ]
end
