{ config, pkgs,inputs, ... }:
{
  environment.systemPackages = with pkgs; [
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
    onlyoffice-desktopeditors
    zeal
    kdePackages.dolphin
    thunar
    opencode
    glib
    dconf
    nautilus
    gsettings-desktop-schemas
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
    awww    
    kdePackages.qtmultimedia
    networkmanagerapplet
    qt5.qtwayland
    qt5.qtdeclarative
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
    brightnessctl
    ddcutil
    networkmanager
    cliphist
    imagemagick
    grim
    slurp
    polkit
    ifuse
    flutter
    dart
    steam-run-free
    android-tools        
    jdk17                
    cmake
    ninja
    pkg-config
    gtk3
    e2fsprogs
    xz
    hyprlandPlugins.hyprbars
  (python3.withPackages (ps: with ps; [
    ipykernel
    jupyter
    notebook
    tensorflow
    keras
    numpy
    scikit-learn
    pandas
    scipy
    matplotlib
    seaborn
    pip
  ]))
   ffmpeg
   power-profiles-daemon
   powertop
   qt6.qtshadertools
   nwg-look
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
    zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2
    libxml2 acl libsodium util-linux xz systemd
    libXcomposite libXtst libXrandr libXext
    libX11 libXfixes libxcb libXdamage
    libxshmfence libXxf86vm libXinerama
    libXcursor libXrender libXScrnSaver
    libXi libSM libICE
    libGL libva pipewire libelf pulseaudio libpulseaudio
    alsa-lib vulkan-loader libgbm libdrm
    glib gtk2 gtk3 gnome2.GConf libxkbcommon pango cairo
    libpng atk cups
    nspr nss libcap SDL2 libusb1 dbus-glib ffmpeg
    networkmanager libxcrypt coreutils pciutils
    dbus expat libnotify gsettings-desktop-schemas icu
  ];
};


}
