class Pampas < Formula
  desc "A "
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.1.0.tar.gz"
  version "0.1.0"
  sha256 "bad7bfca729983296d2b3d2f7622201808466c5b80f8e8443c7af3e4cbca016c"

  depends_on "maven"
  depends_on "git"
  depends_on "node"
 # depends_on "docker" => :recommended

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    prefix.install "install-mac.sh"
    ENV["PAMPAS_TEMPLATES"] = HOMEBREW_PREFIX/"pampas-templates/"
    ENV["BUILDPACK_PATH"] = HOMEBREW_PREFIX/"buildpacks/"
  end

  def caveats
    <<-EOS.undent
      run shell script (need root):
        sudo /bin/sh #{prefix}/install-mac.sh

      export env:
        export BUILDPACK_PATH=#{lib}/buildpacks/
        export PAMPAS_TEMPLATES=#{lib}/pampas-templates/
    EOS
  end

  test do
    system "#{bin}/pampas", "version"
  end

end
