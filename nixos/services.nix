{ config,libs, pkgs, ... }:
{

  services.power-profiles-daemon.enable = true;
# ✅ SOLUTION DE REMPLACEMENT (Seulement si nécessaire)
environment.etc."xdg/menus/plasma-applications.menu".source = 
  "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";      
  programs.ssh.startAgent = true;
  programs.ssh.extraConfig = ''
  Host github.com
    IdentityFile /home/kelian/.ssh/id_ed25519
    AddKeysToAgent yes
    '';


   
  services.udisks2.enable = true;
  services.ollama = {
  enable = true;
  environmentVariables = {
    OLLAMA_ORIGINS = "*";
  };
};

#  services.open-webui = {
#  enable = true;
#  host = "127.0.0.1";
#  port = 8080;
#  environment = {
#    OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
#    ANONYMIZED_TELEMETRY = "False";
#    DO_NOT_TRACK = "True";
#  };
#};

  services.flatpak.enable = true;

  services.printing.enable = true;

  services.upower.enable = true;

  services.postgresql.enable = true;

  hardware.i2c.enable = true;

  services.nginx.enable = true;
   
  users.users.kelian.extraGroups = [ "adbusers" "plugdev" "kvm" ];

  environment.sessionVariables = {
    CHROME_EXECUTABLE = "brave";         
    ANDROID_HOME = "$HOME/Android/Sdk";
    ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
  };

  services.geoclue2.enable = true;

  xdg.portal = {
  enable = true;
  config = {
    hyprland = {
      default = [ "hyprland" "kde" ];
    };
  };
  configPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    kdePackages.xdg-desktop-portal-kde 
  ];
};   

}

