{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  home.username = "zep";
  home.homeDirectory = "/home/zep";
  home.stateVersion = "25.05";
  home.sessionPath = [ "$HOME/.cargo/bin" ];

  programs.home-manager.enable = true;

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    cli.enable = true;
    
    settings = {
      bar.clock.showDate = true;
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
  };

  programs.zsh = {
    enable = true;
    initContent = ''
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
  };

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
  
  programs.pi-coding-agent = {
    enable = true;
};

  services.hyprsunset = {
    enable = true;
    systemdTarget = "graphical-session.target";

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
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua".source = ./nvim/lua;
  xdg.configFile."nvim/doc".source = ./nvim/doc;
  
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono    
    # Rust
    rustc
    cargo
    rustfmt
    clippy

    # C/C++
    gcc

    # Python
    python3
    uv

    # kickstarter.nvim
    gnumake
    tree-sitter
    unzip
    wl-clipboard
  ];
}
