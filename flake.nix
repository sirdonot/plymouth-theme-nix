{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
  }: let
    forEachSystem = fn:
      nixpkgs.lib.genAttrs
      nixpkgs.lib.platforms.linux
      (system: fn system (nixpkgs.legacyPackages.${system}));
  in {
    packages = forEachSystem (system: pkgs: rec {
      default = plymouth-theme-nix;
      plymouth-theme-nix = pkgs.callPackage ./nix/default.nix {};
    });
  };
}
