class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "27e9e90b2420d5f4961072f8152b374c39b1cdb8e0712492b059ba504b3f4801"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "6c25fb940ad77904d8b39e9c44078d57e0ea1ce15d1b2a5e91ca416d07736d96"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8438c3d5e44238a8da0b300b55de9e189966bd7026a779cb7835d58503b85fef"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2ba42d8456daf21db00077841c58e1475cf70edc5599af62e6f390ce8c856256"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
