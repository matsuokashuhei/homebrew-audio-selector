class SelectSound < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/sound-selector"
  url "https://github.com/matsuokashuhei/sound-selector/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e4aee6e42ab0bb7f9719697f497dedcc183b493ebe27f7ed9fcb156e4835e654"
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
