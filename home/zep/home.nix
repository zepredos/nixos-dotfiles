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

  programs.zsh.enable = true;

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
  enable = true;
  enableZshIntegration = true;

  settings = {
    username = {
      show_always = true;
      format = "[$user]($style)@";
    };

    hostname = {
      ssh_only = false;
      format = "[$hostname]($style) ";
    };
  };
};
  
  services.hyprsunset = {
    enable = true;

    settings.profile = [
      {
        time = "07:00";
        identity = true;
      }
      {
        time = "18:00";
        temperature = 3500;
      }
    ];
  };

  fonts.fontconfig.enable = true;

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  xdg.configFile."ghostty/config".source = ./ghostty/config;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono    
  ];
}
