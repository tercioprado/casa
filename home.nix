{ pkgs, ... }:

{
  # 1. Instale a fonte desejada (exemplo: Nerd Fonts)
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # 2. Configure o Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 13.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          style = "Bold";
        };
        italic = {
          style = "Italic";
        };
      };
    };
  };
}
