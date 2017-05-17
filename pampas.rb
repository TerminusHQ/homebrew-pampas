class Pampas < Formula
  desc "pampas command line interface"
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.2.1.tar.gz"
  version "0.2.1"
  sha256 "cc142a4229db000c78c0489ec367605c2aa92129f9f5f296f37b248ffa0f7f23"

  depends_on "maven"
  depends_on "git"
  depends_on "node"
 # depends_on "docker" => :recommended

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    prefix.install "install-mac.sh"
  end

  def caveats
    <<-EOS.undent
      run shell script (need root):
        sudo /bin/sh #{prefix}/install-mac.sh
    EOS
  end

  test do
    system "#{bin}/pampas", "version"
  end

end