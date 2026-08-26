class Thisyou < Formula
  desc "Terminal UI for exploring archived Reddit histories"
  homepage "https://github.com/martintrifunov/thisyou"
  url "https://github.com/martintrifunov/thisyou/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bf88f8b00018c4fbe157c696b21261423d7133b575d6842175e685f6e6b5b5a4"
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
