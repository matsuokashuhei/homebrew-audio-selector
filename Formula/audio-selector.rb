class AudioSelector < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/audio-selector"
  url "https://github.com/matsuokashuhei/audio-selector/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "98856d388f9c632095f9b3c66e57d941c80b0ea377bdb1476c3fb98b92370a06"
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
