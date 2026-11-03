class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.5/beepgrid_0.2.5_darwin_arm64.tar.gz"
      sha256 "8a2eadd7343a3b4bd00dc6512bf20927b3fb8582ffcac6edd4e1febe388c2207"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.5/beepgrid_0.2.5_darwin_amd64.tar.gz"
      sha256 "deb73b37c090d230194aeab1be3b2f3d7cde72071bf0fe48ad2c6953d4079ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.5/beepgrid_0.2.5_linux_arm64.tar.gz"
      sha256 "666408b6acfbd5ddec5c3ff147cea4860d9422c00ac22c21d31de14b3c36f170"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.5/beepgrid_0.2.5_linux_amd64.tar.gz"
      sha256 "3a9ba4b858a66daa5bcdd5430395b3a43b001af3d5db80cf592280b2c81ab966"
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
