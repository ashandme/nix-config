{ config, pkgs, ... }:
let
  unstableTarball = fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];
    nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball { # now you can use unstable packages :D
        config = config.nixpkgs.config;
      };
    };
  };

  # Welcome to the NETWORLD :D or hell >:D
  networking = {
    hostName = "ash-notebook"; # Define your hostname.
    wireless = {
      enable = true; # Enables wireless support via wpa_supplicant.
      networks = {
        TCH-1694467 = { # My router SSID
          psk = "24RVqCd8NqnhEMJ66W"; # The password :flushed:
        };
        vaio = { # Other SSID
          psk = "24RVqCd8NqnhEMJ66W"; # The password
        };
      };
    };
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true; # A better future :thonk:??
    # proxy.default = "";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Iosevka Term";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
    };
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services = {
    openssh.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e;"
      libinput.enable = true;
      windowManager.awesome.enable = true;
    };
  };
  
  users = {
    users.me = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      description = "Best user";
      shell = pkgs.zsh;
      useDefaultShell = true;
    };
  };
    system.stateVersion = "20.03"; # Did you change my username?
}
