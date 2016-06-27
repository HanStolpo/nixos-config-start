#! /usr/bin/env bash

cd $(dirname $0)
cp -f configuration_template.nix configuration.nix
rm -f /etc/nixos/configuration.nix
ln -s $(pwd)/configuration.nix /etc/nixos/configuration.nix
