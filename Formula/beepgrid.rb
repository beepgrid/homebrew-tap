class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.0/beepgrid_0.2.0_darwin_arm64.tar.gz"
      sha256 "00f2c5e52db53cb88dbb3ff5df6c98c3b8d411fdfac531f1ab8de38b45e5617c"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.0/beepgrid_0.2.0_darwin_amd64.tar.gz"
      sha256 "c1a31c9e1948d5d3bce8eb16d3bd3aa6ebd9e87afc293a9ddd90d8ffadd15e41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.0/beepgrid_0.2.0_linux_arm64.tar.gz"
      sha256 "356bfbee421466a34a912d320adbeb3a7fc3ba54b59d5740e65e3a844e620b57"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.0/beepgrid_0.2.0_linux_amd64.tar.gz"
      sha256 "0cf417f34ea89614dcffe40279569049745c3a11e42e4f51ef344546830c2e47"
    end
  end

  def install
    bin.install "beepgrid"
    pkgshare.install "LICENSE", "THIRD_PARTY_NOTICES.txt", "README.txt"
  end

  def caveats
    <<~EOS
      PostgreSQL is required to host the engine.
      No service is started automatically.
      Setup: https://github.com/beepgrid/beepgrid/blob/main/docs/PACKAGING.md
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beepgrid version")
  end
end
