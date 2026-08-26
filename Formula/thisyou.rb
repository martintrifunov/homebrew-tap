class Thisyou < Formula
  desc "Terminal UI for exploring archived Reddit histories"
  homepage "https://github.com/martintrifunov/thisyou"
  url "https://github.com/martintrifunov/thisyou/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0592a9b5500460c673bdeae0a25a12c8a9d0b36e2312ef13dd33d547b72d5fe1"
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
