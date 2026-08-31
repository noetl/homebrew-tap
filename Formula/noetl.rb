class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v4.23.0.tar.gz"
  sha256 "539f58626674105a3d7542bab4c4b29191dbe2e2956044bfa73846699b098b5c"
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
