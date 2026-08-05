class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v4.21.1.tar.gz"
  sha256 "a61e47ab768d982c4fe5336b9db6241ece03d803d47bd4ac5e61bf97f42fb5dc"
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
