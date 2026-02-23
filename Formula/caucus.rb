class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "36ba8cb0b39a2becc0b874a3dcfea737d6451d3e688defea6bfca98708be44b4"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "aab5758bfb2ca688f8bba7ffed867714a3277627fd3f4f0e27a1904891d32b7b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "707b1657d7a33078d8d6d190651545a68a347414ea27d928200b9fd36db0f548"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e8fb0129a7abfb7b04816f5270b9bb06577637dfb14b8effc3fea0f1d4217687"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
