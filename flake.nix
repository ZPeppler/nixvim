{
  description = "A complete workflow of tmux, sesh, and nixvim to replace vscode.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      home-manager,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      hmConfig = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./config.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    in
    {
      packages.${system}.default = hmConfig.config.programs.nixvim.package;
    };
}

