class Pampas < Formula
  desc "pampas command line interface"
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.2.2.tar.gz"
  version "0.2.2"
  sha256 "c682dc5664ab2dc973494137778e18d0806d909a93e396e38447230c28d8a138"

  depends_on "maven"
  depends_on "git"
# depends_on "node"
# depends_on "docker" => :recommended

  def install
    bin.install Dir["bin/*"]
    # lib.install Dir["lib/*"]
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