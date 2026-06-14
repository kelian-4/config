{ config,libs, pkgs, ... }:
{

 
  programs.ssh.startAgent = true;
  programs.ssh.extraConfig = ''
  Host github.com
    IdentityFile /home/kelian/.ssh/id_ed25519
    AddKeysToAgent yes
    '';


   
  services.udisks2.enable = true;
  # Ollama (LLM local)
  services.ollama.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Impression
  services.printing.enable = true;

  # UPower (gestion batterie / alimentation)
  services.upower.enable = true;

  # PostgreSQL
  services.postgresql.enable = true;

  # DDC/CI pour moniteurs externes
  hardware.i2c.enable = true;

  # Nginx + WordPress
  services.nginx.enable = true;
  services.wordpress.sites."site1.local" = {
    database.createLocally = true; 
    settings = {
        FS_METHOD = "direct";
      };
    themes = let 
      kadence = pkgs.fetchzip { 
       url = "https://downloads.wordpress.org/theme/kadence.zip";
       sha256 = "sha256-+n9tdg6i9UzOfXzZ6WxFrrZTOqiGNsEA8OEuS79ibss=";
     };
    in {
       inherit kadence;
    };
    plugins = let 
	kadence-starter-templates = pkgs.fetchzip { 
       url = "https://downloads.wordpress.org/plugin/kadence-starter-templates.2.3.1.zip";
       sha256 = "sha256-+qHyshWzXYJlfY4guRfcNNBUe+ellTkYNZ5SPjw3M8A=";
     };	
	kadence-blocks = pkgs.fetchzip { 
	url = "https://downloads.wordpress.org/plugin/kadence-blocks.3.7.2.zip";
	sha256 = "sha256-0nKM4GFyw6xKvLNSf4S2Q3laqCwQvap3tq5s+NzJUNo=";
       }; 	
    in {
       inherit kadence-starter-templates kadence-blocks;
   };
 };

 #flutter 
  users.users.kelian.extraGroups = [ "adbusers" "plugdev" "kvm" ];

  environment.sessionVariables = {
    CHROME_EXECUTABLE = "brave";          # Brave pour flutter web
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

