{ config, pkgs, ... }:
{
  # ZRAM swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  # Scheduler CPU moderne (SCX)
  services.scx.enable = true;
  services.scx.scheduler = "scx_lavd";

  # Gouverneur CPU
  powerManagement.cpuFreqGovernor = "schedutil";

  # TRIM automatique pour SSD
  services.fstrim.enable = true;

  # Optimisation du store Nix
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Garbage collector automatique
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Firmware redistribuable (Intel, etc.)
  hardware.enableRedistributableFirmware = true;

  # Graphique Intel
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
