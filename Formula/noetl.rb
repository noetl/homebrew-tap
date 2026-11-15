class Noetl < Formula
  desc "NoETL workflow automation CLI - Execute playbooks locally or orchestrate distributed pipelines"
  homepage "https://noetl.io"
  url "https://github.com/noetl/cli/archive/refs/tags/v6.4.1.tar.gz"
  sha256 "64ba444de453f0134c1b288715c32c9eaf157bf6936c71ff16a7ed16065f0831"
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
