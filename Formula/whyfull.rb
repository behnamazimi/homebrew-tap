class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/behnamazimi/whyfull"
  version "0.2.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/behnamazimi/whyfull/releases/download/v0.2.0/whyfull-v0.2.0-darwin-arm64.tar.gz"
      sha256 "d27cb2fb10d06d09b632b59df5bedb12b5f4fc703b49ec696ee4734b2b549f37"
    end
    on_intel do
      url "https://github.com/behnamazimi/whyfull/releases/download/v0.2.0/whyfull-v0.2.0-darwin-x64.tar.gz"
      sha256 "3c745087b3415b0b307b4d0d383c9dfb065a38cc623382f9377ff3a190146dc6"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
