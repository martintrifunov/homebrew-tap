class Orkestar < Formula
  desc "Persistent terminal runtime for coordinating coding agents"
  homepage "https://github.com/martintrifunov/orkestar"
  url "https://github.com/martintrifunov/orkestar/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "2269c32edec8f84ce945f4350be417d0c40417e9bab2f9cf6a05775f566a8f22"
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
