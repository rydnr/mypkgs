{ lib, stdenv, callPackage, fetchurl, python, jdk, cmake, libxml2, zlib, python3
, ncurses5, dotnet-sdk_3, vmopts ? null }:

with lib;

let
  mkJetBrainsProduct = callPackage ./common.nix { inherit vmopts; };
  # Sorted alphabetically

  buildIdea = { name, version, src, license, description, wmClass, ... }:
    (mkJetBrainsProduct {
      inherit name version src wmClass jdk;
      product = "IDEA";
      extraLdPath = [ zlib ];
      meta = with lib; {
        homepage = "https://www.jetbrains.com/idea/";
        inherit description license;
        longDescription = ''
          IDE for Java SE, Groovy & Scala development Powerful
          environment for building Google Android apps Integration
          with JUnit, TestNG, popular SCMs, Ant & Maven. Also known
          as IntelliJ.
        '';
        maintainers = with maintainers; [ edwtjo gytis-ivaskevicius ];
        platforms =
          [ "x86_64-darwin" "i686-darwin" "i686-linux" "x86_64-linux" ];
      };
    });

in {

  idea-community = buildIdea rec {
    name = "idea-community-${version}";
    version = "2020.3.3"; # updated by script
    description =
      "Integrated Development Environment (IDE) by Jetbrains, community edition";
    license = lib.licenses.asl20;
    src = fetchurl {
      url = "https://download.jetbrains.com/idea/ideaIC-${version}.tar.gz";
      sha256 =
        "1msfl8qq0aday4ssip73r0y096mrb89mr7z2j4mpqhkzgsmvpjk0"; # updated by script
    };
    wmClass = "jetbrains-idea-ce";
    update-channel = "IntelliJ IDEA RELEASE";
  };

  idea-ultimate = buildIdea rec {
    name = "idea-ultimate-${version}";
    version = "2020.3.3"; # updated by script
    description =
      "Integrated Development Environment (IDE) by Jetbrains, requires paid license";
    license = lib.licenses.unfree;
    src = fetchurl {
      url =
        "https://download.jetbrains.com/idea/ideaIU-${version}-no-jbr.tar.gz";
      sha256 =
        "0szq8lqp1h7kci8kqd1bb3g16j3p5f4dfmbccbyrrwsram3hvjgi"; # updated by script
    };
    wmClass = "jetbrains-idea";
    update-channel = "IntelliJ IDEA RELEASE";
  };
}
