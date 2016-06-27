# some extra font configuration
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xfontsel xlsfonts powerline-fonts
  ];

  i18n = {
     consoleFont = "Roboto Mono for Powerline";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      unifont
      powerline-fonts
    ];
    fontconfig = {
      defaultFonts = {
        monospace = ["Roboto Mono for Powerline"];
      };
    };
  };
}
