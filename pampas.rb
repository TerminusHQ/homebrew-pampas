class Pampas < Formula
  desc "A "
  homepage "https://www.terminus.io/"
  url "http://terminus-paas.oss.aliyuncs.com/dist/pampas/pampas.0.1.1.tar.gz"
  version "0.1.1"
  sha256 "b6230a19334a479ca44b4d8a1b269831af86c8f95bcf4f5c355d95c8736c9a72"

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