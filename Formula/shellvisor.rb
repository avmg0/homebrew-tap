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
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2ab4699df01594c8daad33598f171f3fb57dc48e0865ad86adb8d208f1b3d4fe"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "af7c637461879b697198b8c3c0c8f7b0149b207c58616de8fd82264b9b869fe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6bffa138e073684257efcae6975e945f57d22ec481f2cf1d0c33c97ac7c1993"
    end
    on_intel do
      url "https://github.com/avmg0/shellvisor/releases/download/v#{version}/shellvisor-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20cafdbc2911424d544ae03d053d5786d9d88fbf53e8724715cacd6dd97c9aca"
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
