{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];
  
  # Welcome to the NETWORLD :D or hell >:D
  networking = {
    hostName = "ash-notebook"; # Define your hostname.
    wireless = {
      enable = true; # Enables wireless support via wpa_supplicant.
      networks = {
        TCH-1694467 = { 
          psk = "24RVqCd8NqnhEMJ66W";
        };
        vaio = {
          psk = "24RVqCd8NqnhEMJ66W";
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
  time.timeZone = "America/Argentina";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    mtr.enable = true;
    fish = {
      enable = true;
    };
    vim.defaultEditor = true;
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
      displayManager.lightdm.background = "`/share/artwork/gnome/nix-wallpaper-nineish.png";
    };
  };
  
  users = {
    users.me = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
    defaultUserShell = pkgs.fish;
  };
    system.stateVersion = "20.03"; # Did you change my username?
}
