{ config, pkgs, ... }:
{
  # Localisation
  time.timeZone = "Africa/Douala";
  i18n.defaultLocale = "fr_FR.UTF-8";

  # Shell Fish (global)
  programs.fish.enable = true;

  # Utilisateur principal
  users.users.kelian = {
    isNormalUser = true;
    description = "kelian";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Polices
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    rubik
    nerd-fonts.ubuntu
    noto-fonts-color-emoji 
  ];
}
