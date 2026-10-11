{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 8765 80 5555 33157 53317 ];
  networking.firewall.allowedUDPPorts = [ 33157 53317 ];
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];


}
