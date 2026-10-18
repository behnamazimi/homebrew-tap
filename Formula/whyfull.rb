class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/behnamazimi/whyfull"
  version "0.5.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-arm64.tar.gz"
      sha256 "7a978ca8dd8bb40dc2d66f7a0a5b966abeb45ddf4f7e51be2df50c8d43276184"
    end
    on_intel do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-x64.tar.gz"
      sha256 "f41f9af1082d5d656f69f38df2ee48281e71bc592e454d8c78b5c8d86740e1e8"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
