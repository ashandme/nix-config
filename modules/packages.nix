{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    # Editors
    unstable.neovim
    unstable.emacs
    rustracer
    # Compilers
    rustc
    unstable.cargo
    gnumake
    gcc
    cmake
    # GUI programs
    awesome
    unstable.rofi
    flameshot
    unstable.ungoogled-chromium
    alacritty
    pavucontrol
    discord
    # Programs
    wget
    git
    rng-tools
    zip
    unzip
    neofetch
    gotop
    tdesktop
    unstable.fd
    unstable.exa
  ];
}

