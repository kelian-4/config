{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 5555 33157 ];
  networking.firewall.allowedUDPPorts = [ 33157 ];
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];


  networking.hosts = {
    "127.0.0.1" = [ "site1.local" ];
  };
}
