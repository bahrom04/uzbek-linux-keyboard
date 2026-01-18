{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.xserver.xkb.uz-enhanced;
in {
  options.services.xserver.xkb.uz-enhanced = {
    enable = mkEnableOption "Enhanced uzbek keyboard layout";

    layout = mkOption {
      type = types.str;
      default = "uz-enhanced,us";
      description = "Uzbek (Enhanced)";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.xkb.extraLayouts = {
      uz-enhanced = {
        description = "Uzbek (Enhanced)";
        languages = ["uzb"];
        symbolsFile = ./uz;
      };
      uz-enhanced-us = {
        description = "Uzbek (Enhanced, US)";
        languages = ["uzb"];
        symbolsFile = ./uz_us;
      };
      uz-enhanced-2023 = {
        description = "Uzbek (Enhanced, 2023)";
        languages = ["uzb"];
        symbolsFile = ./uz_2023;
      };
      uz-enhanced-cyrillic = {
        description = "Uzbek (Enhanced, Cyrillic)";
        languages = ["uzb"];
        symbolsFile = ./uz_cyrillic;
      };
    };

    services.xserver.xkb.layout = cfg.layout;
  };
}
