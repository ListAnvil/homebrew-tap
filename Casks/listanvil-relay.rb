cask "listanvil-relay" do
  version "0.4.0"
  sha256 "3910a93c2d4e61a53f433e80c3eb942ff9f8ef85bb893288b71d7a0dc5284c90"

  url "https://github.com/ListAnvil/homebrew-tap/releases/download/relay-v#{version}/ListAnvil-Relay.dmg",
      verified: "github.com/ListAnvil/homebrew-tap/"
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
