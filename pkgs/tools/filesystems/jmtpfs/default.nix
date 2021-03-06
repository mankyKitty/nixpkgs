{ stdenv, fetchFromGitHub, pkgconfig, file, fuse, libmtp }:

let version = "0.5"; in
stdenv.mkDerivation {
  name = "jmtpfs-${version}";

  src = fetchFromGitHub {
    sha256 = "1pm68agkhrwgrplrfrnbwdcvx5lrivdmqw8pb5gdmm3xppnryji1";
    rev = "v${version}";
    repo = "jmtpfs";
    owner = "JasonFerrara";
  };

  buildInputs = [ file fuse libmtp pkgconfig ];

  meta = with stdenv.lib; {
    description = "A FUSE filesystem for MTP devices like Android phones";
    homepage = https://github.com/JasonFerrara/jmtpfs;
    license = licenses.gpl3;
    maintainers = [ maintainers.coconnor ];
  };
}
