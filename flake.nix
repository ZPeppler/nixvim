{
  description = "A complete workflow of tmux, sesh, and nixvim to replace vscode.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixvim,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvim (
        import ./config.nix { inherit pkgs; }
      );
    };
}

