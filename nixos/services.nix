{ inputs, config, pkgs, ... }:
{

programs.gamepadServer.enable = true;
services.udev.extraRules = ''
  KERNEL=="uinput", GROUP="input", MODE="0660"
'';

programs.ydotool.enable = true;

services.usbmuxd.enable = true;

environment.sessionVariables.QML2_IMPORT_PATH = [
  "${pkgs.qt6Packages.qtgraphs}/lib/qt-6/qml"
];
programs.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
};

  services.power-profiles-daemon.enable = true;
environment.etc."xdg/menus/plasma-applications.menu".source =
  "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

  services.udisks2.enable = true;
  services.ollama = {
  enable = true;
  environmentVariables = {
    OLLAMA_ORIGINS = "*";
  };
};

  services.printing.enable = true;

  services.upower.enable = true;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "synapse" ];
    ensureUsers = [
      {
        name = "synapse";
        ensureDBOwnership = true;
      }
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      local synapse synapse peer map=synapse-map
      local all all peer
    '';
    identMap = ''
      synapse-map matrix-synapse synapse
      synapse-map root synapse
      synapse-map synapse synapse
    '';
  };

  services.matrix-synapse = {
  enable = true;
  settings = {
    server_name = "local.bridge";
    public_baseurl = "http://localhost:8008";
    listeners = [
      {
        port = 8008;
        bind_addresses = [ "127.0.0.1" ];
        type = "http";
        tls = false;
        x_forwarded = false;
        resources = [
          { names = [ "client" "federation" ]; compress = false; }
        ];
      }
    ];
    database = {
      name = "psycopg2";
      args = {
        user = "synapse";
        database = "synapse";
        host = "/run/postgresql";
      };
    };
    federation_domain_whitelist = [ ];
    enable_registration = false;
    registration_shared_secret_path = "/var/lib/matrix-synapse/registration_secret";
  };
};

  services.mautrix-whatsapp = {
  enable = true;
  settings = {
    homeserver = {
      address = "http://localhost:8008";
      domain = "local.bridge";
    };
    appservice = {
      address = "http://localhost:29318";
      hostname = "127.0.0.1";
      port = 29318;
    };
    database = {
      type = "sqlite3-fk-wal";
      uri = "file:/var/lib/mautrix-whatsapp/mautrix-whatsapp.db?_txlock=immediate";
    };
            bridge = {
      permissions = {
        "local.bridge" = "user";
        "@kelian:local.bridge" = "admin";
      };
      relay = {
        enabled = true;
        message_formats = {
          "m.text" = "{{ .Message }}";
  "m.notice" = "{{ .Message }}";
  "m.emote" = "* {{ .Message }}";
  "m.image" = "{{ .Caption }}";
  "m.audio" = "{{ .Caption }}";
  "m.video" = "{{ .Caption }}";
  "m.file" = "{{ .Caption }}";
        };
      };
    };
    network = {
      os_name = "Mautrix-WhatsApp bridge";
      browser_name = "unknown";
      displayname_template = ''{{or .BusinessName .PushName .Phone .RedactedPhone "Unknown user"}} (WA)'';
      call_start_notices = true;
      identity_change_notices = true;
      send_presence_on_typing = true;
      enable_status_broadcast = false;
      disable_status_broadcast_send = false;
      mute_status_broadcast = true;
      pinned_tag = "m.favourite";
      status_broadcast_tag = "m.lowpriority";
      whatsapp_thumbnail = false;
      url_previews = false;
      extev_polls = false;
      disable_view_once = false;
      force_active_delivery_receipts = true;
      direct_media_auto_request = true;
      initial_auto_reconnect = true;
      use_whatsapp_retry_store = false;
    };
  };
};
       services.mautrix-telegram = {
    enable = true;
    package = pkgs.mautrix-telegram.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        ./0001-fix-empty-body-media-drop.patch
      ];
    });
    settings = {
      homeserver = {
        address = "http://localhost:8008";
        domain = "local.bridge";
      };
      appservice = {
        address = "http://localhost:29317";
        hostname = "127.0.0.1";
        port = 29317;
        database = "sqlite:////var/lib/mautrix-telegram/mautrix-telegram.db";
      };
      telegram = {
        api_id = 31946952;
        api_hash = "59f70628908ddd2f76d0af14308d03e1";
        bot_token = "8941605114:AAFXQJ-blQhuam1bueR-tgk2EVuDavVIMds";
      };
      bridge = {
        permissions = {
          "local.bridge" = "user";
          "@kelian:local.bridge" = "admin";
          "*" = "relaybot";
        };
        relaybot = {
          authless_portals = true;
          ignore_unbridged_group_chat = false;
          message_formats = {
            "m.text" = "{{ .Message }}";
  "m.notice" = "{{ .Message }}";
  "m.emote" = "* {{ .Message }}";
  "m.image" = "{{ .Caption }}";
  "m.audio" = "{{ .Caption }}";
  "m.video" = "{{ .Caption }}";
  "m.file" = "{{ .Caption }}";
          };
        };
      };
    };
  };

  services.mautrix-signal = {
  enable = true;
  package = pkgs.mautrix-signal.overrideAttrs (old: rec {
    version = "26.07";
    src = pkgs.fetchFromGitHub {
      owner = "mautrix";
      repo = "signal";
      rev = "v0.2607.0";
      hash = "sha256-l6IIL2bClC6t5+P0/AkFIjkD/eDpQnnmA8x4i5ROaY4=";
    };
    vendorHash = "sha256-0ifGza94s4+ED5OrlrqoDKIDZIYJWJhB2q3LJRpKiJs=";
  });
  settings = {
    homeserver = {
      address = "http://localhost:8008";
      domain = "local.bridge";
    };
    appservice = {
      address = "http://localhost:29328";
      hostname = "127.0.0.1";
      port = 29328;
    };
    database = {
      type = "sqlite3-fk-wal";
      uri = "file:/var/lib/mautrix-signal/mautrix-signal.db?_txlock=immediate";
    };
        bridge = {
      permissions = {
        "local.bridge" = "user";
        "@kelian:local.bridge" = "admin";
      };
      relay = {
        enabled = true;
message_formats = {
  ""         = "";
  "m.text"   = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>: {{ .Message }}";
  "m.notice" = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>: {{ .Message }}";
  "m.emote"  = "* <b>{{ or .Sender.Displayname .Sender.UserID }}</b> {{ .Message }}";
  "m.image"  = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>{{ if .Caption }}: {{ .Caption }}{{ end }}";
  "m.audio"  = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>{{ if .Caption }}: {{ .Caption }}{{ end }}";
  "m.video"  = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>{{ if .Caption }}: {{ .Caption }}{{ end }}";
  "m.file"   = "<b>{{ or .Sender.Displayname .Sender.UserID }}</b>{{ if .Caption }}: {{ .Caption }}{{ end }}";
};
      };
    };
    network = {
      displayname_template = "{{or .ProfileName .PhoneNumber \"Unknown user\"}}";
      use_contact_avatars = true;
      sync_contacts_on_startup = true;
      use_outdated_profiles = false;
      number_in_topic = true;
      device_name = "mautrix-signal";
      location_format = "https://www.google.com/maps/place/%[1]s,%[2]s";
      disappear_view_once = false;
      extev_polls = false;
    };
  };
};
  hardware.i2c.enable = true;

  services.nginx.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    dns = [ "1.1.1.1" "8.8.8.8" ];
  };

boot.kernelModules = [ "uinput" ];

  users.users.kelian.extraGroups = [ "input" "ydotool" "adbusers" "plugdev" "kvm" "docker" ];

  services.geoclue2.enable = true;

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde  ];
  config = {
    hyprland = {
      default = [ "hyprland" "kde" ];
    };
  };
};

}
