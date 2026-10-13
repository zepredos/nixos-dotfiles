{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  home.username = "zep";
  home.homeDirectory = "/home/zep";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.caelestia = {
    enable = true;
    systemd.enable = true; # start manually while testing
    cli.enable = true;

    settings = {
      bar.clock.showDate = true;
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
  };

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;

  home.packages = with pkgs; [
  ];
}
