{
  description = "A complete workflow of tmux, sesh, and nixvim to replace vscode.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      home-manager,
    }:
    {
      homeConfigurations."zpeppler" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        modules = [
          nixvim.homeModules.nixvim
          ./config.nix
        ];
      };
    };
}

