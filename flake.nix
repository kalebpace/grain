{
  description = "The Grain compiler toolchain and CLI. Home of the modern web staple. 🌾";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = rec {
          default = grain;
          grain = pkgs.buildNpmPackage (finalAttrs: {
            name = "grain";
            version = "0.7.0";
            src = ./.;
            npmDepsHash = "";
            meta = {
              description = "Grain compiler. A modern web staple.";
              homepage = "https://grain-lang.org";
              license = pkgs.lib.licenses.lgpl3;
              maintainers = with pkgs.lib.maintainers; [ kalebpace ];
            };
          });
        };
      }
    );
}
