self: super: {
  my.idea-ultimate-2020_3 =
    (self.callPackage ./pkgs/idea-ultimate { }).intellij-idea;

  my.smalltalk-vm = (self.callPackage ./pkgs/smalltalk-vm { }).spur;
}
