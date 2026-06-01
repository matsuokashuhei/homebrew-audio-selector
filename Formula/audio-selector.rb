class AudioSelector < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/audio-selector"
  url "https://github.com/matsuokashuhei/audio-selector/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "185c05effb62bd5a45c5bf311f15e2cfaa08101a6a55d80051be2a8c78ccb041"
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
