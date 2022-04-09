{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "edo";
  home.homeDirectory = "/home/edo";
  
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    ripgrep
    nodejs
    slack
    spotify
    discord
    vscode
    obsidian
    tmate
    xclip
    yarn
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
      italic-text = "always";
    };
  };

  programs.git = {
    enable = true;
    delta = {
      enable = true;      
      options = {
        navigate = true;
        line-numbers = true;
        syntax-theme = "GitHub";
      };
    };
    userName = "Ridho Febriansa";
    userEmail = "21301894+ridhof@users.noreply.github.com";
    aliases = {
      prettylog = "...";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      push = {
        default = "simple";
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      ".DS_Store"
      "*.pyc"
    ];
  };

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "nix-env";
	src = pkgs.fetchFromGitHub {
	  owner = "lilyball";
	  repo = "nix-env.fish";
	  rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
	  sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
	};
      }
    ];
    interactiveShellInit = ''
	# Activate the iTerm 2 shell integration iterm2_shell_integration
    '';
    shellInit = ''
      # Set syntax highlighting colours; var names defined here:
      # http://fishshell.com/docs/current/index.html#variables-color
      set fish_color_autosuggestion brblack
    '';
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
    };
    shellAbbrs = {
      g = "git";
      m = "make";
      n = "nvim";
      o = "open";
      p = "python3";
    };
    functions = {
      fish_greeting = {
        description = "Greeting to show when starting a fish shell";
	body = "";
      };
      mkdcd = {
	description = "Make a directory tree and enter it";
	body = "mkdir -p $argv[1]; and cd $argv[1]";
      };
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscodium;
  #   extensions = with pkgs.vscode-extensions; [
  #    dracula-theme.theme-dracula
  #    vscodevim.vim
  #    yzhang.markdown-all-in-one
  #  ];
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
