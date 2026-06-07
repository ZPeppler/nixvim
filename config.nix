{ pkgs, ... }:
{
  # home.username = "zpeppler";
  # home.homeDirectory = "/home/zpeppler";
  # home.stateVersion = "26.05";
  imports = [
    ./nixvim
  ];
}

