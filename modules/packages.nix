{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
    fish
    alacritty
    cargo
    awesome
    rofi
    flameshot
    mpd
    mpc_cli
    neofetch
    iosevka
    firefox
    pavucontrol
    gotop
    tdesktop
    fd
  ];
}

