{ config, ...}:
{
  boot.loader = {
    grub = {
      device = "/dev/sda";
      splashImage = ./city.jpg;
    };    
  };
}
