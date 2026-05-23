class AudioSelector < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/audio-selector"
  url "https://github.com/matsuokashuhei/audio-selector/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ab52a51926c8616f17f1fd9bc2f1d5535d3550c30317cf54fe759d7816ac12dc"
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
