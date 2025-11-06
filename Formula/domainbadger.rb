class Domainbadger < Formula
  desc "CLI tool for brute force domain lookup"
  homepage "https://github.com/emmanuelay/domainbadger"
  url "https://github.com/emmanuelay/domainbadger/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b8c5cc8a458b8f87f02bcca2377f7f2410751cf817239bf1e5a8ae9965754082"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", 
           "-o", bin/"domainbadger", "./cmd/domainbadger"
  end

  test do
    assert_match "domainbadger", shell_output("#{bin}/domainbadger --version")
  end
end