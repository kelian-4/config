{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Ports pour KDE Connect
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  # Port HTTP pour WordPress local
  networking.firewall.allowedTCPPorts = [ 80 ];

  # Hôtes locaux
  networking.hosts = {
    "127.0.0.1" = [ "site1.local" ];
  };
}
