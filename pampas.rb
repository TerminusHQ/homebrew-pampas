class Pampas < Formula
  desc "pampas command line interface"
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.2.3.tar.gz"
  version "0.2.3"
  sha256 "ba426dd69a62bbae9b2742a20fed7204d729a163b3e2d43686cb9c62a72a049b"

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