{
  description = "A complete workflow of tmux, sesh, and nixvim to replace vscode.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvim {
        colorschemes.tokyonight = {
          enable = true;
          settings = {
            style = "storm";
          };
        };
        colorscheme = "tokyonight";
        plugins = {
          web-devicons.enable = true;
          plenary.enable = true;
          vim-tmux-navigator.enable = true;
          vim-fugitive.enable = true;
          lualine.enable = true;
          bufferline.enable = true;
          neo-tree.enable = true;
        };
      };
    };
}

