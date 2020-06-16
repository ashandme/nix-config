{ config, ...}:
{
  boot.loader = {
    grub = {
      device = "/dev/sda";
      gfxmodeBios = "1920x1080";
      splashImage = ./city.jpg;
    };    
  };
}
