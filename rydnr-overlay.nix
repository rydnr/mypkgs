self: super:

let callPackage = super.lib.callPackageWith super;
in { idea-ultimate-2020_3 = callPackage ./pkgs/idea-ultimate { }; }
