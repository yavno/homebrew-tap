cask "speechtext" do
  version "0.10.0"
  sha256 "b74f424b2359af7f198a2aed70e726b24789299ff49c7475add4ce17e1d33434"

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
