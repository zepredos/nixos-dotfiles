{ config, pkgs, ... }:

{
  home.username = "zep";
  home.homeDirectory = "/home/zep";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
}
