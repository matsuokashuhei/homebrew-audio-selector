class AudioSelector < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/audio-selector"
  url "https://github.com/matsuokashuhei/audio-selector/archive/8685c13df722f10430305c87bbe6c5de1e6f2e74.tar.gz"
  version "0.1.2"
  sha256 "39a814cc1c54dd88a4961dbfe7d4ecd51fba22201351952b699f70196cefd9b5"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/audio-selector"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/audio-selector --version")
  end
end
