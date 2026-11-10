class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v5.6.0.tar.gz"
  sha256 "56c10caead14ade77a82509a18074dad7b5a7c994ef2b8d900d599f6da37b0c6"
  license "MIT"
  head "https://github.com/noetl/cli.git", branch: "main"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bins", "--features", "duckdb-integration", *std_cargo_args
  end

  test do
    assert_match "noetl", shell_output("#{bin}/noetl --version")
    assert_match "ntl", shell_output("#{bin}/ntl --version")
  end
end
