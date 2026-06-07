{ pkgs, ... }:
{
  imports = [
    ./editor
    ./settings
    ./lsp
    ./ui
  ];
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "storm";
    };
  };
  colorscheme = "tokyonight";
  plugins = {
    web-devicons.enable = true;
    tmux-navigator.enable = true;
    fugitive.enable = true;
    neotest = {
      enable = true;
      adapters.plenary.enable = true;
    };
  };
}

