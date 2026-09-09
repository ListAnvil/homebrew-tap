cask "listanvil-relay" do
  version "0.5.9"
  sha256 "c8f2126b2058eb21f845141936e2c8c3c1f516d55ecf5159c334d4be5633f04c"

  url "https://github.com/ListAnvil/homebrew-tap/releases/download/relay-v#{version}/ListAnvil-Relay.dmg"
  name "ListAnvil Relay"
  desc "Local desktop relay worker for ListAnvil marketplace listings"
  homepage "https://listanvil.com/"

  livecheck do
    url :url
    regex(/relay[._-]v?(\d+(?:\.\d+)+)/i)
    strategy :github_releases
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "ListAnvil Relay.app"

  zap trash: [
    "~/.relaysmith",
    "~/Library/Application Support/com.listanvil.relay",
    "~/Library/Caches/com.listanvil.relay",
    "~/Library/HTTPStorages/com.listanvil.relay",
    "~/Library/Preferences/com.listanvil.relay.plist",
    "~/Library/Saved Application State/com.listanvil.relay.savedState",
    "~/Library/WebKit/com.listanvil.relay",
  ]
end
