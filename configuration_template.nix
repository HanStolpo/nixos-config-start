# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./system/boot.nix
      ./services/nginx.nix
      ./services/circuithub.nix
      ./ui/xcommon.nix
      ./ui/gnome.nix
      ./ui/fonts.nix
      ./binary-caches.nix
      ./apps/common.nix
      ./apps/vim.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.

  # Select internationalisation properties.
  i18n = {
     consoleKeyMap = "us";
     defaultLocale = "en_GB.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    
  ];
  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  # List services that you want to enable:
  services = {
    virtualbox.enable = true;
    openssh.enable = true;
    dbus.enable = true;
    ntp.enable = true;
    printing.enable = true;
  };
  
  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio.enable = true;
  };

  powerManagement.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’
  users.extraUsers.andrew = {
    initialPassword = "andrew";
    isNormalUser = true;
    uid = 1000;
    home = "/home/andrew";
    extraGroups = ["wheel" "networkmanager" "postgres"];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

}
