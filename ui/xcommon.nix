# common xserver related setup
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-user-dirs 
    xdg_utils
    xorg.xdpyinfo
    xscreensaver
    xclip
    xlibs.xcursorthemes
    xlibs.xev
    xlibs.xprop
  ];

  services = {
    xserver = {
     enable = true;
     desktopManager.gnome3.enable = true;
     displayManager.gdm.enable = true;
    };
    gnome3.gnome-keyring.enable = true;
  };
}
