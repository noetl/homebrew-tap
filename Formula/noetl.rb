class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v2.13.0.tar.gz"
  sha256 "bafd772dc0cb5b02efb16b4afd3fd65a81ee2b6adbf130538c428febd76d7bca"
  license "MIT"
  head "https://github.com/noetl/cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--bins", *std_cargo_args
  end

  test do
    assert_match "noetl", shell_output("#{bin}/noetl --version")
    assert_match "ntl", shell_output("#{bin}/ntl --version")
  end
end
