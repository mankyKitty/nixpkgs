{ fetchurl, stdenv, gtk, pkgconfig, libofx, intltool }:

let
   download_root = "http://homebank.free.fr/public/";
   name = "homebank-5.0.0";
   lastrelease = download_root + name + ".tar.gz";
   oldrelease = download_root + "old/" + name + ".tar.gz";
in

stdenv.mkDerivation {
  inherit name;

  src = fetchurl {
    urls = [ lastrelease oldrelease ];
    sha256 = "062r61ryn2v1sxyw6zymhxnvnhk19wsr4nyzmiiwx5wrk0nk9m18";
  };

  buildInputs = [ pkgconfig gtk libofx intltool ];

  meta = {
    description = "Free, easy, personal accounting for everyone";
    homepage = http://homebank.free.fr/;
    license = stdenv.lib.licenses.gpl2Plus;
    maintainers = with stdenv.lib.maintainers; [viric];
    platforms = with stdenv.lib.platforms; linux;
  };
}
