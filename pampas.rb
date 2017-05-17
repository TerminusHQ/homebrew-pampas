class Pampas < Formula
  desc "pampas command line interface"
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.2.4.tar.gz"
  version "0.2.4"
  sha256 "6247333a6f70f7ad25edbc786928b6097119b9d00d1304fb94a51e75f416726c"

  depends_on "maven"
  depends_on "git"
# depends_on "node"
# depends_on "docker" => :recommended

  def install
    bin.install Dir["bin/*"]
    # lib.install Dir["lib/*"]
    prefix.install "install-mac.sh"
    ENV["PAMPAS_TEMPLATES"] = HOMEBREW_PREFIX/"pampas-templates/"
  end

  def caveats
    <<-EOS.undent
      run shell script (need root):
        sudo /bin/sh #{prefix}/install-mac.sh

      export env:
        export PAMPAS_TEMPLATES=#{lib}/pampas-templates/
    EOS
  end

  test do
    system "#{bin}/pampas", "version"
  end

end