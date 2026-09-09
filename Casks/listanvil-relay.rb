cask "listanvil-relay" do
  version "0.5.12"
  sha256 "48122b1a665e4d5408f08936b6145a441ab3733f443358a6f16073f32ab2253e"

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
