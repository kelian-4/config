{ config, pkgs,inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # ---- Applications ----
    signal-desktop
    brave
    vscode
    fastfetch
    htop
    btop
    kitty
    fish
    android-studio
    mpv
    gnome-calculator
    steam-run
    telegram-desktop
    ente-desktop
    gdevelop
    qt6Packages.qt6ct
    steam
    qlementine
    qt6.qtbase
    qt5.qtbase
    proton-vpn
    proton-pass
    protonmail-desktop
    onlyoffice-desktopeditors
    zeal
    kdePackages.dolphin
    thunar
    opencode
    glib
    dconf
    nautilus
    gsettings-desktop-schemas    
    # ---- Hyprland / Wayland ----
    waybar
    wofi
    rofi
    swaynotificationcenter
    quickshell
    hyprpaper
    hypridle
    hyprlock
    wl-clipboard
    playerctl
    foot
    wf-recorder
    protontricks
    hyprpolkitagent    
    # ---- KDE / Qt ----
    kdePackages.qtmultimedia
    networkmanagerapplet
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5.qtdeclarative
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qtwayland
    qt6.qt5compat
    kdePackages.qtsvg          
    kdePackages.kio-extras      
    kdePackages.ffmpegthumbs
    kdePackages.kactivitymanagerd
    kdePackages.ark 
    kdePackages.kservice
    kdePackages.filelight
    # ---- Outils Système CLI ----
    git
    gcc
    unzip
    curl
    gnumake
    pkg-config
    nodejs
    python3
    tree
    gemini-cli
    plymouth
    # ---- Luminosité & Moniteurs ----
    brightnessctl
    ddcutil
    networkmanager

    # ---- Presse-papier & Images ----
    cliphist
    imagemagick

    # ---- Capture d'écran ----
    grim
    slurp

    # ---- Sécurité / Divers ----
    polkit
    ifuse

    # Flutter & Dart
    flutter
    dart
    steam-run-free
    # Android
    android-tools        # adb, fastboot
    jdk17                # Java requis par Flutter/Android
    # Linux desktop
    cmake
    ninja
    pkg-config
    gtk3
    e2fsprogs
    xz
    kdePackages.qtmultimedia
  ]; 

    programs.nix-ld = {
  enable = true;
  libraries = with pkgs; [
    nss
    nspr
    libX11
    libXext
    libXrender
    libXtst
    libXi
    libGL
    zlib
    glib
    nss
    nspr
    dbus
    atk
    cups
    expat
    libdrm
    libxkbcommon
    mesa
    pango
    cairo
    alsa-lib
    libpulseaudio
    libpng
    # Base
    zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2
    libxml2 acl libsodium util-linux xz systemd

    # X11
    libXcomposite libXtst libXrandr libXext
    libX11 libXfixes libxcb libXdamage
    libxshmfence libXxf86vm libXinerama
    libXcursor libXrender libXScrnSaver
    libXi libSM libICE

    # GPU / Audio
    libGL libva pipewire libelf pulseaudio libpulseaudio
    alsa-lib vulkan-loader libgbm libdrm

    # GTK / GNOME
    glib gtk2 gtk3 gnome2.GConf libxkbcommon pango cairo
    libpng atk cups

    # Misc
    nspr nss libcap SDL2 libusb1 dbus-glib ffmpeg
    networkmanager libxcrypt coreutils pciutils
    dbus expat libnotify gsettings-desktop-schemas icu
  ];
};


}
