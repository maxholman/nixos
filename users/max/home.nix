{ pkgs, ... }: {

  home.packages = with pkgs; [
    dconf
    firefox
    chromium
    arandr
    autorandr
    gnome.nautilus
    xsecurelock
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "alacritty";
      fonts = {
        names = [ "Noto Sans" ];
        size = 10.0;
      };
      bars = [
        {
          position = "top";
          trayOutput = "primary";
          statusCommand = "${pkgs.i3blocks}/bin/i3blocks";
          fonts = {
            names = [ "Noto Sans" ];
            size = 10.0;
          };
        }
      ];
    };
  };

  programs.i3blocks = {
    enable = true;
    bars = {
      config = {
        # title = {
        #   interval = "persist";
        #   command = "xtitle -s";
        # };

        time = {
          command = "date +%r";
          interval = 5;
        };
      };
    };
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "xsecurelock";
  };

  services.xidlehook.enable = true;

  services.gammastep.enable = true;
  services.gammastep.longitude = 103.8198;
  services.gammastep.latitude = 1.3521;

  programs.bash.enable = true;

  programs.rofi.enable = true;
  programs.rofi.font = "Noto Sans 24";

  services.picom.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Noto Sans Mono";
        };

        size = 11;

        offset = {
          x = -1;
          y = 1;
        };
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Max";
    userEmail = "max@example.com";
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    #extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
    #  ...
    #'';
  };

  programs.vscode = {
    enable = true;
    # package = unstable.vscode;
    extensions = with pkgs.vscode-extensions; [
      # langs
      bbenoist.nix

      # lint
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode

      # looks
      dracula-theme.theme-dracula

      # lemote dev
      # GitHub.codespaces

      # lol AI
      github.copilot
      # github.copilot-chat

    ];

    mutableExtensionsDir = false;

    userSettings = {
      "files.autoSave" = "onFocusChange";
      "[nix]"."editor.tabSize" = 2;
    };

  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    font.name = "Noto Sans 11";

    theme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # cursorTheme = {
    #   name = "Numix-Cursor";
    #   package = pkgs.numix-cursor-theme;
    # };

    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };

    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };
  home.sessionVariables.GTK_THEME = "Arc-Darker";

}
