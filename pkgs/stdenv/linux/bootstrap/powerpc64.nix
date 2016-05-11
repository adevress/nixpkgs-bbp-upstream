{
  busybox = import <nix/fetchurl.nix> {
    url = http://bbpcf011.epfl.ch/others/release-2/busybox;
    sha256 = "00b9s8d9nxv87zgcm4pkdizlvqxck6mwahcndi7xyjv0lg5bbsq5";
    executable = true;
  };

  bootstrapTools = import <nix/fetchurl.nix> {
    url = http://bbpcf011.epfl.ch/others/release-2/bootstrap-tools.tar.xz;   
    sha256 = "0b0lkhvdflb209cwwzxm0bcbz0inq1awk22d83jdrz56h9xmrc9v";
  };
}
