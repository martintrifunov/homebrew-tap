class Thisyou < Formula
  desc "Terminal UI for exploring archived Reddit histories"
  homepage "https://github.com/martintrifunov/thisyou"
  url "https://github.com/martintrifunov/thisyou/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8d7c9981bf8f8e819eb6ba95864d478baa1a9e1fd5e42116db1c6165cdda7abb"
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
