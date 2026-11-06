# Homebrew formula for Shellvisor.
#
# Lives in the tap repository github.com/avmg0/homebrew-tap as
# Formula/shellvisor.rb, so users can run:
#   brew install avmg0/tap/shellvisor
#
# After each release, set `version` and the four sha256 values from the
# release's SHA256SUMS file (scripts/brew-formula.sh <version> <this file> fills them in).
class Shellvisor < Formula
  desc "Multi-pane terminal workspace: your real shell plus files, system, data flow and coding agents"
  homepage "https://github.com/avmg0/shellvisor"
  version "1.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c68aaf3dd8a042f62c42cfaaf60a6e639c52844e53c408f1c6c719c111b2e7a9"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ca61785548b953289424d0a2c325711d0fa81545e63ccdc6fde494d6a48ea903"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5b9ac23d08eb7d0737c03966f927bc35aab2bfdb39bbc06082cb3262cde777d"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4ce7a8a2f6fe615286f9072d5f6f12237258785707898ad3b9505e6f231ee27"
    end
  end

  def install
    bin.install "shellvisor"
    # `sv` is the same program; inside Shellvisor it is on PATH already,
    # this makes `sv on` work from a plain terminal too.
    bin.install_symlink "shellvisor" => "sv"
  end

  test do
    assert_match "shellvisor #{version}", shell_output("#{bin}/shellvisor --version")
    assert_match "not running", shell_output("#{bin}/sv status")
  end
end
