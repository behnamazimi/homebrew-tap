class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/behnamazimi/whyfull"
  version "0.6.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-arm64.tar.gz"
      sha256 "11eac8a5af36bed54dcead795b9047745ef5e937c8c0811e9a5a5a73091576e1"
    end
    on_intel do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-x64.tar.gz"
      sha256 "d3d2c9357142b445bf836d94aa383693313eef4f975b795ba8d0e829be991aa6"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
