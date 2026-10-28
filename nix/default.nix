{
  flake-parts,
  ...
}@inputs:
flake-parts.lib.mkFlake { inherit inputs; } {
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      craneLib = inputs.crane.mkLib pkgs;
      tometPkgs = inputs.tomet.packages.${system};
      twritPkgs = inputs.twrit.packages.${system};
      catastoPkgs = inputs.catasto.packages.${system};
    in
    {
      packages = rec {
        default = tsuzure-wiki;
        tsuzure-wiki = pkgs.callPackage ./pkgs/tsuzure-wiki.nix { inherit craneLib; };

        # What CI builds and sends to Cachix (.github/workflows/nix-ci.yml).
        ci = pkgs.linkFarm "ci" [
          {
            name = "tsuzure-wiki";
            path = tsuzure-wiki;
          }
        ];
      };

      devShells.default = pkgs.callPackage ./dev.nix {
        inherit inputs;
        fenix = inputs.fenix.packages.${system};
        inherit (tometPkgs) tomet;
        inherit (twritPkgs) twrit;
        inherit (catastoPkgs) catasto;
      };

      treefmt = import ./formatter.nix {
        inherit (tometPkgs) tomet;
      };
    };
}
