{
inputs = {
nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

cera = {
  url = "git+ssh://git@github.com/kelian-4/cera?ref=dev";
  inputs.nixpkgs.follows = "nixpkgs";
};

hyprland = {
  url = "github:hyprwm/Hyprland";
  inputs.nixpkgs.follows = "nixpkgs";
};

helium = {
  url = "github:oxcl/nix-flake-helium-browser";
  inputs.nixpkgs.follows = "nixpkgs";
};

home-manager = {
  url = "github:nix-community/home-manager";
  inputs.nixpkgs.follows = "nixpkgs";
};

};

outputs = { self, nixpkgs, hyprland, helium, home-manager, cera, ... }@inputs:
let
system = "x86_64-linux";
in {
nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
inherit system;
    specialArgs = {
      inherit inputs system;
    };

    modules = [
      ./configuration.nix

      hyprland.nixosModules.default
      helium.nixosModules.default
      home-manager.nixosModules.home-manager

      {
        nix.registry.nixpkgs.flake = nixpkgs;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
      }

      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";

        home-manager.users.kelian = {
          home.stateVersion = "26.05";
        };
      }
    ];
  };
};

}

