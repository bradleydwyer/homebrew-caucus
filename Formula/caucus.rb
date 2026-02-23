class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "c162fb2f186d33098b38445f2eccbe77c40fcacaa8eb35649cda670d7dd39cab"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "27ab2ee7fe66791b3ce818ab561ae87810bbb7cd6dbb6ca0ebf48278a30d9c31"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "856e90aed44a3056f0f1caedaef4ec30b1ad88737c9ae22c0359f5ae1f338162"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "50bb0dc8e414734b16460bea823e43078a57167d9988107a7fc1c347f9e29a69"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
