class Thisyou < Formula
  desc "Terminal UI for exploring archived Reddit histories"
  homepage "https://github.com/martintrifunov/thisyou"
  url "https://github.com/martintrifunov/thisyou/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "080d211829ee152d070cb178347748b40129249906cb03ff17d527f65b5bdc61"
  license "MIT"
  head "https://github.com/martintrifunov/thisyou.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/thisyou"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/thisyou --version")
  end
end
