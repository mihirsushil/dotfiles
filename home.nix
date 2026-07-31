{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{
  home.username = "mihirsushil";
  home.homeDirectory = "/Users/mihirsushil";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    jq
    lazygit
    neovim
    nerd-fonts.hack
  ];

  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";
  home.sessionPath = [
    "/Users/mihirsushil/.local/bin"
    "/Applications/ChatGPT.app/Contents/Resources"
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      bindkey '^f' autosuggest-accept
    '';
    shellAliases = {
      ".." = "cd ..";
      add = "git add .";
      push = "git push";
      pull = "git pull";
      m = "git switch main";
      co = "codex";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mihir Sushil";
        email = "mihirsushilkumar@gmail.com";
      };
      credential = {
        "https://github.com".helper = [ "" "!/opt/homebrew/bin/gh auth git-credential" ];
        "https://gist.github.com".helper = [ "" "!/opt/homebrew/bin/gh auth git-credential" ];
      };
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/wezterm";

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
}
