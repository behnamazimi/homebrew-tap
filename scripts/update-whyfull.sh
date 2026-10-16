#!/usr/bin/env bash
# Regenerates Formula/whyfull.rb from the latest whyfull release.
#
#   scripts/update-whyfull.sh [vX.Y.Z]
#
# With no argument it uses the latest stable release. Needs the GitHub CLI.
# Does nothing when the formula already matches that release.
set -euo pipefail

readonly source_repo="behnamazimi/whyfull"
readonly formula="Formula/whyfull.rb"
readonly sha_pattern='^[0-9a-f]{64}$'

cd "$(git rev-parse --show-toplevel)"

tag="${1:-$(gh release view --repo "$source_repo" --json tagName --jq .tagName)}"
version="${tag#v}"
[[ "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Unexpected release tag: $tag" >&2; exit 1; }

if grep -q "^  version \"$version\"$" "$formula" 2>/dev/null; then
  echo "Formula is already at $version."
  exit 0
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
gh release download "$tag" --repo "$source_repo" --pattern SHA256SUMS --dir "$workdir"

hash_for() {
  local hash
  hash="$(awk -v name="whyfull-$tag-darwin-$1.tar.gz" '$2 == name { print $1 }' "$workdir/SHA256SUMS")"
  [[ "$hash" =~ $sha_pattern ]] || { echo "No valid checksum for the $1 build of $tag." >&2; exit 1; }
  echo "$hash"
}
arm64_sha="$(hash_for arm64)"
x64_sha="$(hash_for x64)"

mkdir -p "$(dirname "$formula")"
cat >"$formula" <<RUBY
class Whyfull < Formula
  desc "Find out why your disk is full, and free space safely"
  homepage "https://github.com/$source_repo"
  version "$version"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/$source_repo/releases/download/v#{version}/whyfull-v#{version}-darwin-arm64.tar.gz"
      sha256 "$arm64_sha"
    end
    on_intel do
      url "https://github.com/$source_repo/releases/download/v#{version}/whyfull-v#{version}-darwin-x64.tar.gz"
      sha256 "$x64_sha"
    end
  end

  def install
    bin.install "whyfull"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyfull --version")
  end
end
RUBY
echo "Updated the formula to $version."
