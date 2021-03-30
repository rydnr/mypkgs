{ alsaLib, autoreconfHook, bash, cairo, cmake, fetchFromGitHub, fetchurl, file
, fontconfig, freetype, gcc, gdk_pixbuf, gdb, glib, glibc, gtk3-x11, lib
, libgit2, libpng, libpulseaudio, libssh2, libstdcxx5, libuuid, libxcb, libXext
, libXv, makeWrapper, openssl, pixman, runCommand, runtimeShell, SDL2, squeak
, stdenv, unzip, xlibs, xorg }@args:

let
  pharo-vm-build = import ./build-vm.nix args;
  suffix = "64";

in rec {
  # Build the latest VM
  spur = pharo-vm-build rec {
    name = "pharo-spur${suffix}";
    version = "git.${revision}";
    src = fetchFromGitHub {
      owner = "OpenSmalltalk";
      repo = "opensmalltalk-vm";
      rev = revision;
      sha256 = "1cs0vmza1nq03i5f6w3j6l78j76qwlmc2aakvc10ivmy4vknglmc";
    };
    # This metadata will be compiled into the VM and introspectable
    # from Smalltalk. This has been manually extracted from 'git log'.
    #
    # The build would usually generate this automatically using
    # opensmalltalk-vm/.git_filters/RevDateURL.smudge but that script
    # is too impure to run from nix.
    revision = "6a0bc9626276dc58c20246adf5b2cd465af98402";
    source-date =
      "Tue Mar 2 06:30:00 2020"; # Tue May 30 19:41:27 2017 -0700.1";
    source-url = "https://github.com/opensmalltalk/opensmalltalk-vm";
  };
}
