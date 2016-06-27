{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget 
    which
    sudo 
    manpages 
    iptables 
    nmap 
    tcpdump 
    zlib 
    bc 
    binutils 
    nix 
    nix-repl 
    patchelf 
    gitAndTools.gitFull
    google-chrome 
    firefox-bin
    rsync 
    unzip
    gnupg 
    htop 
    traceroute
  ];
}
