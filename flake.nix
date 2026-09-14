{
  description = "Host Patrol Website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = lib.systems.flakeExposed;
      forAllSystems = lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.curl
              pkgs.git
              pkgs.hugo
              pkgs.nodejs
              pkgs.pnpm
              pkgs.tailwindcss-language-server
              pkgs.typescript-language-server
              pkgs.vscode-langservers-extracted
              pkgs.wrangler
            ];
          };

          ci = pkgs.mkShell {
            packages = [
              pkgs.curl
              pkgs.git
              pkgs.hugo
              pkgs.nodejs
              pkgs.pnpm
            ];
          };
        }
      );
    };
}
