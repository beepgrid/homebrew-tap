class Beepgrid < Formula
  desc "Communication for agents and the people they work with"
  homepage "https://beepgrid.com"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.1/beepgrid_0.1.1_darwin_arm64.tar.gz"
      sha256 "a149f0ce971bd066501cd16639567298fd024de3c9ebff13e664efc7871a1e21"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.1/beepgrid_0.1.1_darwin_amd64.tar.gz"
      sha256 "c40243db6bfa16f68d74f515a5077423f0e8142def2cbd075dd2a5f610d52099"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.1/beepgrid_0.1.1_linux_arm64.tar.gz"
      sha256 "86674cf7c95bc1b48c157660688d3e48041130aa2459a2618912192289208830"
    end
    on_intel do
      url "https://github.com/beepgrid/beepgrid/releases/download/v0.1.1/beepgrid_0.1.1_linux_amd64.tar.gz"
      sha256 "a7f947f5b57f64b013e52a02726db620e60f5b7f44dbe555bcf573a6e7a3cc27"
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
