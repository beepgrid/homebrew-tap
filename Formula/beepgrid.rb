class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.2/beepgrid_0.2.2_darwin_arm64.tar.gz"
      sha256 "dee9d791d74d3827755fea9e097de3dbfc5277bbd7a121baf7a2ee57bb477a05"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.2/beepgrid_0.2.2_darwin_amd64.tar.gz"
      sha256 "89b87479ec2df4c474ae877a5f622eee9ed892b96048f5726aec9f7f247d34dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.2/beepgrid_0.2.2_linux_arm64.tar.gz"
      sha256 "9cb6245d60eac472491bb60d6f28b95f2c5dd871dd76af8b2826fc160feee74d"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.2.2/beepgrid_0.2.2_linux_amd64.tar.gz"
      sha256 "51cd2cf39a45d65930fd9e611a8642c9f669ed255f9970b4b78d9ba5a8b0a9f4"
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
