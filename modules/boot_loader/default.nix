{ config, pkgs, ... }:

{
imports = [
    ./grub.nix
  ];
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.cleanTmpDir = true;
}

