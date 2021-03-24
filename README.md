# rydnr ovelay

My Nix overlay. I used [mrVanDalo](https://github.com/mrVanDalo/nix-overlay/blob/master/README.md)'s as template. 

# How to install 

### local

To install the overlay into `~/.config/nixpkgs/overlays` just run: 

    ./install.sh

now you can test your builds using:
    
    nix-shell -p idea-ultimate-2020_3

### global

add the following to your `/etc/nixos/configuration.nix`:

    nixpkgs.config.packageOverrides = import /path/to/overlay.nix pkgs;

now you can install the packages from the overlay

    environment.systemPackages = [
        pkgs.idea-ultimate-2020_3
    ];


## How to check builds

    nix-build -E 'with import <nixpkgs> {} ; callPackage ./default.nix {}';

should create a `./result` folder which contains the result of the package.


# Links

* [A presentation about Overlays](https://www.youtube.com/watch?v=6bLF7zqB7EM&feature=youtu.be&t=39m50s) 
* [Package Binaries](https://nixos.wiki/wiki/Packaging_Binaries)
