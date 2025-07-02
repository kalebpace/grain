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

        # esy =
        #   with pkgs;
        #   stdenv.mkDerivation {
        #     name = "esy";
        #     version = "0.9.0";
        #     # src = pkgs.fetchFromGitHub {
        #     #   owner = "esy";
        #     #   repo = "esy";
        #     #   rev = "0.9.0";
        #     #   hash = "sha256-xqgg5JRcZGIDUxeYWzYMQ2OYdw9IzD1NPrLELuWf8gc=";
        #     # };

        #     src = fetchgit {
        #       url = "https://github.com/esy/esy.git";
        #       rev = "0.9.0";
        #       sha256 = "sha256-5D9vX/CLY9UUtyaiA3NS+Xfss5jTCf1yQPEIx9HtPu4=";
        #       leaveDotGit = true;
        #     };

        #     nativeBuildInputs = [
        #       git
        #       makeWrapper
        #       ocamlPackages.dune-configurator
        #       dune_3
        #       ocaml
        #       ocamlPackages.findlib
        #     ];

        #     propagatedBuildInputs = [
        #       coreutils
        #       bash
        #     ];

        #     buildInputs = [
        #       reason
        #       fmt
        #       ocamlPackages.angstrom
        #       ocamlPackages.cmdliner
        #       ocamlPackages.bos
        #       ocamlPackages.fpath
        #       ocamlPackages.lambda-term
        #       ocamlPackages.logs
        #       ocamlPackages.lwt
        #       ocamlPackages.lwt_ppx
        #       ocamlPackages.menhir
        #       ocamlPackages.opam-file-format
        #       ocamlPackages.ppx_deriving
        #       ocamlPackages.ppx_deriving_yojson
        #       ocamlPackages.ppx_expect
        #       ocamlPackages.ppx_inline_test
        #       ocamlPackages.ppx_let
        #       ocamlPackages.ppx_sexp_conv
        #       ocamlPackages.re
        #       ocamlPackages.yojson
        #       ocamlPackages.cudf
        #       ocamlPackages.dose3
        #       ocamlPackages.opam-format
        #       ocamlPackages.opam-core
        #       ocamlPackages.opam-state
        #       ocamlPackages.reason-native.pastel
        #       ocamlPackages.mccs
        #       ocamlPackages.cmdliner
        #     ];

        #     doCheck = false;

        #     buildPhase = ''
        #       export HOME=$(mktemp -d)
        #       git tag 0.9.0
        #       dune build -p esy
        #     '';

        #     # ln -s ${esy-solve-cudf}/bin/esy-solve-cudf $out/lib/esy/esySolveCudfCommand

        #     # wrapProgram "$out/bin/esy" \
        #     #   --prefix PATH : ${
        #     #     lib.makeBinPath (
        #     #       with pkgs;
        #     #       [
        #     #         binutils
        #     #         coreutils
        #     #         # esy
        #     #         curl
        #     #         git
        #     #         perl
        #     #         gnumake
        #     #         gnupatch
        #     #         gcc
        #     #         bash
        #     #       ]
        #     #     )
        #     #   }
        #     installPhase = ''
        #       dune install --prefix $out
        #       mkdir -p $out/lib/esy
        #       ls $out/lib/esy
        #     '';
        #   };

        # nodejs =
        #   let
        #     buildNodeJs = pkgs.callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" {
        #       python = pkgs.python3;
        #     };
        #     version = with builtins; elemAt (split "v" (readFile ./.nvmrc)) 2;
        #   in
        #   buildNodeJs {
        #     inherit version;
        #     enableNpm = true;
        #     sha256 = "sha256-z84oIRk5D34MIiBBCSRCjpDa3LLfF0TAxKDnuq44fMI=";
        #   };
        # npmDeps = pkgs.fetchNpmDeps {
        #   src = ./.;
        #   hash = "sha256-NGxQ6Bz0fyM1QZnWqLyDYRj5uyYbmuR2Mj50cqy5zXk=";
        #   dontPatch = true;
        # };
      in
      {
        packages = rec {
          default = grain;
          grain = pkgs.dune_3;
          # grain = pkgs.buildNpmPackage {
          #   name = "grain";
          #   version = "0.6.6";
          #   src = ./.;
          #   npmBuildScript = "compiler build";
          #   npmDepsHash = "sha256-NGxQ6Bz0fyM1QZnWqLyDYRj5uyYbmuR2Mj50cqy5zXk=";
          #   # npmBuildScript = "compiler";
          #   # npmBuildFlags = [ "build" ];
          #   # npmInstallFlags = [ "--ignore-scripts" ];
          #   # dontPatch = true;
          #   meta = {
          #     description = "Grain compiler. A modern web staple.";
          #     homepage = "https://grain-lang.org";
          #     license = pkgs.lib.licenses.lgpl3;
          #     maintainers = with pkgs.lib.maintainers; [ kalebpace ];
          #   };
          # };
        };
      }
    );
}
