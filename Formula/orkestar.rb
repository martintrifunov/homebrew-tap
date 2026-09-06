class Orkestar < Formula
  desc "Persistent terminal runtime for coordinating coding agents"
  homepage "https://github.com/martintrifunov/orkestar"
  url "https://github.com/martintrifunov/orkestar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "44279ea484978413be215153b0bee3527f6975a28d87e71c543c21006566a5eb"
  license "MIT"
  head "https://github.com/martintrifunov/orkestar.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/orkestar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orkestar --version")
  end
end
