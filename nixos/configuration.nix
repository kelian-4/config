{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./desktop.nix
    ./audio.nix
    ./users.nix
    ./packages.nix
    ./services.nix
    ./optimizations.nix
  ];

 
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;
  system.stateVersion = "26.05";
}
