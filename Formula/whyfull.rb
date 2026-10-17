class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/behnamazimi/whyfull"
  version "0.4.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-arm64.tar.gz"
      sha256 "c3cacc990438f7fe948171c05fef1f2b8b2b001a884043e65fa113fabbddd075"
    end
    on_intel do
      url "https://github.com/behnamazimi/whyfull/releases/download/v#{version}/whyfull-v#{version}-darwin-x64.tar.gz"
      sha256 "c7b60a6b7dec381ad2098062c1e423bcdd654e95f00095f3e125c8b7f957bb72"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
