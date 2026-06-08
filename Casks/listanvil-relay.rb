cask "listanvil-relay" do
  version "0.1.0"
  sha256 "08f91e8f6f92b9f4924f07a7d9b06536413bca4eeb95ecaf5d8287116258ed9b"

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
