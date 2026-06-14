{ config, pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
      theme = "/home/kelian/.config/sekiro_grub_theme-main/Sekiro/";
      splashImage = null;  
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  boot.plymouth = {
    enable = true;
    theme = "pixels";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "pixels" ];
      })
    ];
  };

  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = [ "quiet" "udev.log_level=3" "systemd.show_status=auto" ];
  boot.loader.timeout = 10; 
}
