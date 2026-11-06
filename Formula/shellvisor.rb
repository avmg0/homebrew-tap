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
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "86037a2fe9d83c5a5b1b4081466400238c0e23cd66f03145bfec3736e176e2cc"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "039ed7e299ae9b163d527eb67288317e4f1b5c6386da9d81e2dc01d4311cde98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b43370008a3f7fce1c79f0173a9d28472d3a6ab0c78675bad42490bad93884e4"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61415a890777c06260278d7ca501cbaf02a4d97b47c8b63643ba126340006ada"
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
