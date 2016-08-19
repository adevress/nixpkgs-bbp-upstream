{
  busybox = import <nix/fetchurl.nix> {
    url = http://adev.name/bootstrap/powerpc64/r2/busybox;
    sha256 = "0qkc5k31n7c62a7mpf0dyq31sixsab52dkxfgdbmp5w4aw541rx2";
    executable = true;
  };

  bootstrapTools = import <nix/fetchurl.nix> {
    url = http://adev.name/bootstrap/powerpc64/r2/bootstrap-tools.tar.xz;   
    sha256 = "0b0lkhvdflb209cwwzxm0bcbz0inq1awk22d83jdrz56h9xmrc9v";
  };
}
