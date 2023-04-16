{
  description = "My Personal NixOS Configuration";

  outputs = inputs @ { self, nixpkgs, flake-parts, ... }:
    let
      user = "relaze";
      selfPkgs = import ./pkgs;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { config, inputs', pkgs, system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
        in
       {
          # devShells = {
           # default = import ./shell.nix { inherit pkgs; };
         # };

          #formatter = pkgs.nixpkgs-fmt;
        };

      flake = {
        overlays.default = selfPkgs.overlay;
        nixosConfigurations = (
          import ./host {
            system = "x86_64-linux";
            inherit nixpkgs self inputs user;
          }
        );
      };
    };

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
      flake-parts.url = "github:hercules-ci/flake-parts";
      hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

}
