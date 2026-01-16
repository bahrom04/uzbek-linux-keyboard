{
  description = "Custom uzbek keyboard layout with support for typographic letters";

  outputs = {self}: {
    nixosModules.default = import ./default.nix;
  };
}
