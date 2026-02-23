class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "0e4a8932a5b46e8567f532eca4c33a3a9e4b1ec066dc4f80484cd884f9a0f8e5"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1c5bbce99e4282a7cedd887c0ced0d119418edda652e2ee611b1e3be2e96a9bd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ece75b0d7794c02025a0238b5e06cdaec577997427c9bd6171b3a8b27df63a98"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
