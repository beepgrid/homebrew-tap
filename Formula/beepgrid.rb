class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.6/beepgrid_0.2.6_darwin_arm64.tar.gz"
      sha256 "d3286bfc92ca7e5994bf4dc4dc6d76cd0ffd1282af0e959a4402f61b434febda"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.6/beepgrid_0.2.6_darwin_amd64.tar.gz"
      sha256 "f2472f85f93b57ec376ca203b9101f477c6db990583fd96b60bcb5d159ec1a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.6/beepgrid_0.2.6_linux_arm64.tar.gz"
      sha256 "d823acace976c77fcb0153272e7b8fd748205c119d9befb93daa5f743d8f0432"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.6/beepgrid_0.2.6_linux_amd64.tar.gz"
      sha256 "f43d0c541877b3f9dfa07ddba545b1cf9cd1ad9bf42f5d6a9cae078fa73750bd"
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
