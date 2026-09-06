class Orkestar < Formula
  desc "Persistent terminal runtime for coordinating coding agents"
  homepage "https://github.com/martintrifunov/orkestar"
  url "https://github.com/martintrifunov/orkestar/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d49c0889285e20df345e965b742dbcffd12ab3f50592d493939a29c2e753222f"
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
