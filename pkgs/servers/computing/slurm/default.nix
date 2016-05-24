{ stdenv, fetchurl, pkgconfig, curl, python, munge, perl, pam, openssl,
  ncurses, mysql, gtk, lua, hwloc, numactl, extraDeps ? [] }:

stdenv.mkDerivation rec {
  name = "slurm-llnl-${version}";
  version = "15-08-5-1";

  src = fetchurl {
    url = "https://github.com/SchedMD/slurm/archive/slurm-${version}.tar.gz";
    sha256 = "05si1cn7zivggan25brsqfdw0ilvrlnhj96pwv16dh6vfkggzjr1";
  };

  buildInputs = [ pkgconfig curl python munge perl pam openssl mysql.lib 
		  ncurses gtk lua hwloc numactl ] ++ extraDeps;

  configureFlags =
    [ "--with-munge=${munge}"
      "--with-ssl=${openssl}"
      "--sysconfdir=/etc/slurm"
    ] ++ stdenv.lib.optional (gtk == null)  "--disable-gtktest";

  preConfigure = ''
    substituteInPlace ./doc/html/shtml2html.py --replace "/usr/bin/env python" "${python.interpreter}"
    substituteInPlace ./doc/man/man2html.py --replace "/usr/bin/env python" "${python.interpreter}"
  '';

  postInstall = ''
	# remove libtool files
        rm -f $out/lib/*.la
        rm -f $out/lib/slurm/*.la
  '';

  meta = with stdenv.lib; {
    homepage = http://www.schedmd.com/;
    description = "Simple Linux Utility for Resource Management";
    platforms = platforms.linux;
    license = licenses.gpl2;
    maintainers = [ maintainers.jagajaga ];
  };
}
