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
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "141988b73a1cdd01d01edcdb109b3139144adc8291088c0adec1f236abab0484"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "aa8628e42bdeaae56e9646ae3598b52d858b8575d0c6a7b36386f8ed481f2c8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fcacc5f5b9c6a57be39556989640b2cb4a64bff61b5c002a7de8d834523ef322"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6de64bcaa4eb6dc0df4e559a8a1efc21780142b023a5ed4d5239f20bab4fce28"
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
