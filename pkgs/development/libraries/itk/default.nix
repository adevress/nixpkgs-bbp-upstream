{stdenv, fetchurl, cmake, libX11, libuuid, xz}:

stdenv.mkDerivation rec {
  name = "itk-4.0.0";

  src = fetchurl {
    url = mirror://sourceforge/itk/InsightToolkit-4.0.0.tar.xz;
    sha256 = "1grhp5i29v1krrn1m36n68ls6vakvbw4x60im26b7h55rkvx61vs";
  };

  cmakeFlags = [
    "-DBUILD_TESTING=OFF"
    "-DBUILD_EXAMPLES=OFF"
    "-DBUILD_SHARED_LIBS=ON"
    "-DCMAKE_CXX_FLAGS=-fPIC"
  ];

  enableParallelBuilding = true;

  nativeBuildInputs = [ cmake xz ];
  buildInputs = [ libX11 libuuid ];

  meta = {
    description = "Insight Segmentation and Registration Toolkit";
    homepage = http://www.itk.org/;
    license = stdenv.lib.licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [viric];
    platforms = with stdenv.lib.platforms; linux;
  };
}
