let pkgs = import <nixpkgs> { };
in with pkgs; {
  my.idea-ultimate-2020_3 = (import ./pkgs/idea-ultimate { }).intellij-idea;

  #  libmoz2d = (import ./pkgs/libmoz2d { });

  my.smalltalk-vm = (import ./pkgs/smalltalk-vm {
    inherit alsaLib autoreconfHook bash cairo cmake fetchFromGitHub fetchurl
      file fontconfig freetype gcc gdk_pixbuf gdb glib glibc gtk3-x11 lib
      libgit2 libpng libpulseaudio libssh2 libstdcxx5 libuuid libxcb libXext
      libXv makeWrapper openssl pixman runCommand runtimeShell SDL2 squeak
      stdenv unzip xlibs xorg;
  }).spur;
}
