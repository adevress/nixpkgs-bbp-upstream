{
  busybox = import <nix/fetchurl.nix> {
    url = http://bbpcf011.epfl.ch/others/busybox;
    sha256 = "0jbsj856li6hhfpqfmxns6m0n4dnx817bx04sifjx6vvj5fi1zr3";
    executable = true;
  };

  bootstrapTools = import <nix/fetchurl.nix> {
    url = http://bbpcf011.epfl.ch/others/bootstrap-tools2.tar.xz;   
    sha256 = "1zvz6zywkcid9qfdimr3iv45x416ib6hk67prkpryr87rsw1ygdm";
  };
}
