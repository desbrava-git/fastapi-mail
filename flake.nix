{
  description = "Desbrava.ai Services";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            python39Full
            poetry
          ];
          shellHook = ''
            export SHELL="/nix/store/gqicc6kxah7f8j54hp80qxpk16898lj9-bash-interactive-5.1-p8/bin/bash"
          '';
        };
      }
    );
}
