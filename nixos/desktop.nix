{ config, pkgs, ... }:
{
  # Serveur X11
  services.xserver.enable = true;

  services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "silent";
  package = pkgs.kdePackages.sddm;  

  extraPackages = with pkgs.kdePackages; [
    qtsvg
    qtmultimedia
    qtvirtualkeyboard
  ];

  settings = {
    Theme = {
      ThemeDir = "/usr/share/sddm/themes";
      CursorTheme = "Aki-Aspen";
      CursorSize = 24; 
   };
    General = {
      GreeterEnvironment = "QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard";
      InputMethod = "qtvirtualkeyboard";
    };
  };
};

  

  # Clavier X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Clavier console
  console.keyMap = "no";

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # KDE Connect
  programs.kdeconnect.enable = true;

  # Polkit
  security.polkit.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;

  # DBus
  services.dbus.enable = true;

  environment.sessionVariables = {
  QT_QPA_PLATFORMTHEME = "qt6ct";
  QT_QPA_PLATFORM = "wayland";
  XCURSOR_THEME = "Aki-Aspen";
  XCURSOR_SIZE = "24";
  XDG_MENU_PREFIX = "plasma-";
};      

}
