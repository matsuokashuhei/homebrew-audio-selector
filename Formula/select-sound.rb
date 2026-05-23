class SelectSound < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/sound-selector"
  url "https://github.com/matsuokashuhei/sound-selector/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ef8bf4b8159d835a80b6453bcb87f31b12cdefebaf9f59f7f78ad979d71e8302"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/select-sound"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/select-sound --version")
  end
end
