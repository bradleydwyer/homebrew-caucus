class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  url "https://github.com/bradleydwyer/caucus/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b49af8030309963ca7b19aee3a0b4be98d560e98ad9b43c13f5abc1001a29844"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/caucus/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b3cc0eac9a7433617181609877bc4d4374d46025f67bcc5d99715511504c5adf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "511d1206a827891ba9a42494cd934f3ad3a98a5814a7579a773bab2a60c18a9b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2d6bba52c8901a7c52beb268d8cc62d918a86da14ad6ac574fcc11579fc25095"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/caucus-cli"
  end

  test do
    assert_match "caucus", shell_output("#{bin}/caucus --version")
  end
end
