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
      default = "uz,us";
      description = "Uzbek (Enhanced)";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.xkb = {
      layout = cfg.layout;
      variant = "latin";

      extraLayouts = {
        uz = {
          description = "Uzbek (Latin)";
          languages = ["uzb" "eng"];
          symbolsFile = ./uz_latin;
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
    };
  };
}
