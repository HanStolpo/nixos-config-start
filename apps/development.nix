{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    gcc
    ghc
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.ghc-mod
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.stylish-haskell
    pkgs.haskellPackages.codex
    pkgs.haskellPackages.hasktags
    heroku
    nodejs
    pkgconfig
    python
    python27Full
    python27Packages.pip
    python27Packages.ipython
    python27Packages.virtualenv
    python27Packages.pgcli
    ctags
    gnumake
    zlib
    perl
  ];
}
