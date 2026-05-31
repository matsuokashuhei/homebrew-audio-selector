class AudioSelector < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/audio-selector"
  url "https://github.com/matsuokashuhei/audio-selector/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "af9faf5f24ee5ea033444227501b36414e632a5d5a031da6f4ce5ba966fa68a6"
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
