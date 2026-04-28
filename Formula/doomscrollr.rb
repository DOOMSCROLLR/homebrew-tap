class Doomscrollr < Formula
  desc "DOOMSCROLLR developer front door for owned-audience websites"
  homepage "https://doomscrollr.com"
  url "https://registry.npmjs.org/doomscrollr/-/doomscrollr-0.1.1.tgz"
  sha256 "226101e467c86b73e859343c55c0dde0b38f3d65548dfd31ad37b6c8c2ada73f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "DOOMSCROLLR", shell_output("#{bin}/doomscrollr")
  end
end
