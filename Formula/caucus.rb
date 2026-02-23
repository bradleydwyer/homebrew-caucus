class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "1c7e072cd4e9a7db63122161d05393032aae9fbc216fb601528bcf08567a455e"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "60c2db4549243b421b05d4de734982da8ad60dee471948a857a653803c1ed27f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "991ab4f7ba62fd1fb1997aeefdef210d6bab8095260109e5c93748af2b957813"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "984d0e4d97c4d74708c386fd0adb69c62b7d86b25196008b049747a7ccd7ae1f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
