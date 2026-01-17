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
        variants = ["us" "2023" "cyrillic"];
      };
    };

    services.xserver.xkb.layout = cfg.layout;
  };
}
