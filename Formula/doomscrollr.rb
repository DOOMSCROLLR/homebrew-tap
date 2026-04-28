class Doomscrollr < Formula
  desc "DOOMSCROLLR developer front door for owned-audience websites"
  homepage "https://doomscrollr.com"
  url "https://registry.npmjs.org/doomscrollr/-/doomscrollr-0.2.0.tgz"
  sha256 "3e03231df0517d1122dd69b0841517306fa9fcb3b2e74f990b20bfe4856c3e5c"
  license "MIT"

  depends_on "node"

  def install
    # The CLI is dependency-free Node 18+ JavaScript. We install the package
    # files directly into libexec and create a wrapper in bin/. This avoids
    # `npm install`, which would otherwise trigger Homebrew's minimum
    # package-age guard for any freshly published scoped dependency that the
    # npm package metadata happens to declare for non-CLI (SDK re-export) use.
    libexec.install Dir["*"]

    (bin/"doomscrollr").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/doomscrollr.js" "$@"
    SH
    chmod 0755, bin/"doomscrollr"
  end

  test do
    assert_match "DOOMSCROLLR", shell_output("#{bin}/doomscrollr")
    assert_match "profile", shell_output("#{bin}/doomscrollr help")
  end
end
