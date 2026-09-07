class Orkestar < Formula
  desc "Persistent terminal runtime for coordinating coding agents"
  homepage "https://github.com/martintrifunov/orkestar"
  url "https://github.com/martintrifunov/orkestar/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "902141d4a01ecd66f8557c559f16d76c32c2f4b6bddf250b96da4a50bc19d24a"
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
