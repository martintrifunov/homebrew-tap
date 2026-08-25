class Thisyou < Formula
  desc "Terminal UI for exploring archived Reddit histories"
  homepage "https://github.com/martintrifunov/thisyou"
  url "https://github.com/martintrifunov/thisyou/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "7e2d2ecf1617785cc30f21be2171f335945a35fc9c615204055f147bdbce4ee2"
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
