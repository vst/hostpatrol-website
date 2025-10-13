{
  description = "Host Patrol Website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.hugo
            pkgs.nodejs_22
            pkgs.tailwindcss-language-server
            pkgs.taplo
            pkgs.vscode-langservers-extracted
          ];
        };
      }
    );
}
