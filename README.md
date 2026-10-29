# yavno/tap

Homebrew casks for [SpeechText](https://speech-text.app), voice-to-text for macOS.

```sh
brew install --cask yavno/tap/speechtext
```

SpeechText updates itself, so `brew upgrade` leaves it alone unless you pass `--greedy`.
`brew uninstall --zap speechtext` also removes its settings, History and downloaded
models; your API keys stay in the keychain unless you delete them in Settings › API Keys
first.

Issues with the app belong in [yavno/speech-text](https://github.com/yavno/speech-text/issues).
