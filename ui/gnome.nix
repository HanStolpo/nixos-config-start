# use a gnome3 desktop
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome3.gnome_keyring
    xdg-user-dirs 
    xdg_utils
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
