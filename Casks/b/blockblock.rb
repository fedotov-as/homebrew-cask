cask "blockblock" do
  on_mojave :or_older do
    version "0.9.9.4"
    sha256 "6ab3a8224e8bc77b9abe8d41492c161454c6b0266e60e61b06931fed4b431282"

    url "https://bitbucket.org/objective-see/deploy/downloads/BlockBlock_#{version}.zip",
        verified: "bitbucket.org/objective-see/"

    installer script: {
      executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock",
      args:       ["-install"],
      sudo:       true,
    }

    uninstall script: {
      executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock",
      args:       ["-uninstall"],
      sudo:       true,
    }
  end
  on_catalina :or_newer do
    version "2.2.0"
    sha256 "278f2f2e98ae227a87f81de7310bea07451a4adad00fecec307256a7878a5750"

    url "https://github.com/objective-see/BlockBlock/releases/download/v#{version}/BlockBlock_#{version}.zip",
        verified: "github.com/objective-see/BlockBlock/"
  end

  name "BlockBlock"
  desc "Monitors common persistence locations"
  homepage "https://objective-see.com/products/blockblock.html"

  installer script: {
    executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock Installer",
    args:       ["-install"],
    sudo:       true,
  }

  uninstall script: {
    executable: "#{staged_path}/BlockBlock Installer.app/Contents/MacOS/BlockBlock Installer",
    args:       ["-uninstall"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Caches/com.objective-see.blockblock.helper",
    "~/Library/HTTPStorages/com.objective-see.blockblock.helper",
    "~/Library/Preferences/com.objectiveSee.BlockBlock.plist",
    "~/Library/Preferences/com.objective-see.blockblock.helper.plist",
  ]
end
