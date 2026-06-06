{ inputs, ... }:
{
  imports = [
    ./editor
    ./settings
    ./lsp
    ./ui
    inputs.nixvim.homeModules.nixvim
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
    lualine.enable = true;
    bufferline.enable = true;
    neo-tree.enable = true;
  };
}

