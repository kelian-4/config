{ config, pkgs, ... }:
{
  time.timeZone = "Africa/Douala";
  i18n.defaultLocale = "fr_FR.UTF-8";

  programs.fish.enable = true;

   services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
  '';

  users.users.kelian = {
    isNormalUser = true;
    description = "kelian";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    rubik
    nerd-fonts.ubuntu
    noto-fonts-color-emoji 
  ];
  
  system.activationScripts.nixosOwnership = ''
  chown -R kelian:users /etc/nixos
  chmod -R u+rw /etc/nixos
'';

}
