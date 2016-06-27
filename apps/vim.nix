{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vimHugeX 
    vimPlugins.airline 
    vimPlugins.wombat256 
    vimPlugins.fugitive
    vimPlugins.vim-addon-nix 
    vimPlugins.YouCompleteMe
    silver-searcher
  ];

  nixpkgs.config = {
    vim = {
      python = true;
      ftNixSupport = true;
      netbeans = false;
    };
  };
}
