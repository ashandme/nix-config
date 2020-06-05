{ config, pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      (iosevka.override {
        privateBuildPlan = {
          family = "Iosevka Term";
          design = [ "term" "ss08" ];
        };
        set = "term-ss08";
      }) 
    ];
  };
}
