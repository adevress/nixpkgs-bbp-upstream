{ stdenv, fetchurl, python, wrapPython, distutils-cfg }:

stdenv.mkDerivation rec {
  shortName = "setuptools-${version}";
  name = "${python.executable}-${shortName}";

  version = "36.7.2";

  src = fetchurl {
    url = "http://bbpobjectstorage.epfl.ch:81/swift/v1/nix-data/${shortName}.tar.gz";
    sha256 = "1hl3bkpyx3qm6hv01zg24dqc0nc4qph6jan6ci4fa6kl70wsab9d";
  };

  nativeBuildInputs = [ python wrapPython distutils-cfg ];

  buildPhase = "${python}/bin/${python.executable} setup.py build";

  installPhase =
    ''
      dst=$out/lib/${python.libPrefix}/site-packages
      mkdir -p $dst
      export PYTHONPATH="$dst:$PYTHONPATH"
      ${python}/bin/${python.executable} setup.py install --prefix=$out --install-lib=$out/lib/${python.libPrefix}/site-packages
      wrapPythonPrograms
    '';

  doCheck = false;  # requires pytest

  checkPhase = ''
    ${python}/bin/${python.executable} setup.py test
  '';

  meta = with stdenv.lib; {
    description = "Utilities to facilitate the installation of Python packages";
    homepage = http://pypi.python.org/pypi/setuptools;
    license = [ "PSF" "ZPL" ];
    platforms = platforms.all;
  };
}
