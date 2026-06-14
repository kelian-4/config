{ config, pkgs, ... }:
{
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # PulseAudio désactivé (remplacé par Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
}
