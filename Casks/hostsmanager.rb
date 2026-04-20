cask "hostsmanager" do
  version "1.7.3"
  sha256 "72b6bbe98741cc728f093b4dab4a01b6319f66fee959dbd774a4720ba7404bf5"

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
