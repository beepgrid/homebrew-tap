class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.4/beepgrid_0.2.4_darwin_arm64.tar.gz"
      sha256 "9fdc3b65dad9f5b1a53df934099584619ab1cb11e64292bfd2560aeff80a7ae7"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.4/beepgrid_0.2.4_darwin_amd64.tar.gz"
      sha256 "2d4ceadd2631f8aecb974a87cb6daa814789ed46efcda925133198f534850bdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.4/beepgrid_0.2.4_linux_arm64.tar.gz"
      sha256 "d0e729777741d67cc280879e937b7fb5383bc3da7278865edaf6bc7789a7ea51"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.4/beepgrid_0.2.4_linux_amd64.tar.gz"
      sha256 "f9ec349da2fcef7e597e2345a1ead81eb33b9447ba02b366ac0c0036b80e2386"
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
