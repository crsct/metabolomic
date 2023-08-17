{
  description = "Metabolomic Paper";

    inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/22.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "metabolomic";
          src = self;
          buildInputs = [
            # Add packages below
            pkgs.bash
            pkgs.coreutils
            pkgs.gnumake
            pkgs.gnused
            pkgs.pandoc
            pkgs.R
            pkgs.rPackages.ggplot2
            pkgs.rPackages.tidyverse
            pkgs.rPackages.tikzDevice
            pkgs.rPackages.gplots
            pkgs.rPackages.FactoMineR
            pkgs.rPackages.ggfortify
            pkgs.rPackages.cluster
            pkgs.rPackages.readxl
            pkgs.rPackages.pheatmap
          ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            export HOME="$TMP" ;
            export FONTCONFIG_FILE="${pkgs.fontconfig.out}/etc/fonts/fonts.conf";
            export FONTCONFIG_PATH="${pkgs.fontconfig.out}/etc/fonts/";
            mkdir -p .cache/texmf-var
            mkdir -p .config/inkscape
            env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
              Rscript src/script.R
          '';
          installPhase = ''
            mkdir -p $out
            cp src/project.html $out
          '';
        };
      };
      defaultPackage = packages.document;
    });
}
