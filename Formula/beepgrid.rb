class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.0/beepgrid_0.1.0_darwin_arm64.tar.gz"
      sha256 "2dfb404d27472fcee3b19907d1901bdb3d5d830dcc9b4d1d4d09a574308ebf2d"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.0/beepgrid_0.1.0_darwin_amd64.tar.gz"
      sha256 "a8746624f3754ee06fb2cff7baaf8a0fdb796c1171dc0c9332a5b502bf8f50ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.0/beepgrid_0.1.0_linux_arm64.tar.gz"
      sha256 "365793d77e126832f478b91b786fbc1b80605296172930c4a9920bd53e8d87a6"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.0/beepgrid_0.1.0_linux_amd64.tar.gz"
      sha256 "77348ed6986787924be4e636a3557672ae600e168879b883eb344712e8882a94"
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
      Setup: https://beepgrid.com/docs/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beepgrid version")
  end
end
