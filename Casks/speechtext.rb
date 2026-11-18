cask "speechtext" do
  version "0.11.0"
  sha256 "b090b15ddc3a1b6a07b4cbaa0270fe26a743d090df7a1ef7384d193af4ba3e8e"

  url "https://github.com/yavno/speech-text/releases/download/v#{version}/SpeechText-#{version}.dmg"
  name "SpeechText"
  desc "Menu bar dictation that types at the cursor"
  homepage "https://speech-text.app/"

  livecheck do
    url "https://github.com/yavno/speech-text/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "SpeechText.app"

  uninstall quit: "app.speech-text.SpeechText"

  zap trash: [
    "~/Library/Application Support/SpeachText",
    "~/Library/Application Support/SpeechText",
    "~/Library/Application Support/VoicePeter",
    "~/Library/Caches/app.speech-text.SpeechText",
    "~/Library/Caches/app.speech-text.SpeechText.LLM",
    "~/Library/HTTPStorages/app.speech-text.SpeechText",
    "~/Library/Preferences/app.speech-text.SpeechText.plist",
    "~/Library/Preferences/com.speachtext.app.plist",
    "~/Library/Preferences/com.speechtext.app.plist",
    "~/Library/Preferences/com.voicepeter.app.plist",
    "~/Library/Saved Application State/app.speech-text.SpeechText.savedState",
  ]

  caveats <<~EOS
    SpeechText keeps your API keys in the macOS keychain, which `brew uninstall --zap`
    cannot reach. To remove them, delete each key in SpeechText › Settings › API Keys
    before uninstalling.
  EOS
end
