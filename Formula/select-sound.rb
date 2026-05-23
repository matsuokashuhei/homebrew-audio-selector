class SelectSound < Formula
  desc "Keyboard-driven macOS audio input and output selector"
  homepage "https://github.com/matsuokashuhei/sound-selector"
  url "https://github.com/matsuokashuhei/sound-selector/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "28f77d7fa036ae57e5fb85b1d7e4b3b6242c6d57edc542c31bf4be117c5359df"
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
