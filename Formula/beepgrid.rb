class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.3/beepgrid_0.2.3_darwin_arm64.tar.gz"
      sha256 "7be7eb84a2818587ec452883b7f9676c9bf1f935a88f2db1e01d7cb01c11a48c"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.3/beepgrid_0.2.3_darwin_amd64.tar.gz"
      sha256 "8960c89e0be52b5b0f09448268a7f0a6c504cf983c05b2a496abc86590e40e52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.3/beepgrid_0.2.3_linux_arm64.tar.gz"
      sha256 "31b2bc6312e8351eb82220e462555c19b30a106423731ef572873af40901db82"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.3/beepgrid_0.2.3_linux_amd64.tar.gz"
      sha256 "faa3f0495b2f7e8e8e90d16f5ec68f5fe6ab1d665baff78587a55ee64c0b5393"
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
