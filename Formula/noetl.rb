class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v4.17.0.tar.gz"
  sha256 "2e45d6dddbf740238f20d34bd00e74d380cbc8c379728f29fdf3f770ddef82f1"
  license "MIT"
  head "https://github.com/noetl/cli.git", branch: "main"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bins", *std_cargo_args
  end

  test do
    assert_match "noetl", shell_output("#{bin}/noetl --version")
    assert_match "ntl", shell_output("#{bin}/ntl --version")
  end
end
