class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/behnamazimi/whyfull"
  version "0.3.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-arm64.tar.gz"
      sha256 "fcedc125f8c3a8f80b71e4361ef8d2b9d6fa6a6fe60df6ff9727cdc95e5ac08c"
    end
    on_intel do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-x64.tar.gz"
      sha256 "2ee0afcca4ca37f0f01aa90f280565c3547e6cbec81793dd8fd4703f4fb734fa"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
