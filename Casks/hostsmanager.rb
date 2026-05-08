cask "hostsmanager" do
  version "2.2.1"
  sha256 "63b2f41233a6b03f746c2589e2b9327cd06de8898bf894e512238ee25e16eda1"

  url "https://github.com/twan-nguyen/HostsManager/releases/download/v#{version}/HostsManager-v#{version}.zip"
  name "HostsManager"
  desc "Quản lý file /etc/hosts trên macOS"
  homepage "https://github.com/twan-nguyen/HostsManager"

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
