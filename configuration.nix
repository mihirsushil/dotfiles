{ user, ... }:


{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.primaryUser = user;
  users.users.${user}.home = "/Users/${user}";
  system.stateVersion = 6;

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      _HIHideMenuBar = true;
      AppleShowAllExtensions = true;
    };

    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";
    finder.CreateDesktop = false;
    trackpad.Clicking = true;
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    inherit user;
    autoMigrate = true;
  };

  homebrew = {
    enable = true; 
    onActivation.autoUpdate = true;
    brews = [ "herdr" ];
    casks = [
      "basictex"
      "claude-code"
      "font-hack-nerd-font"
      "wezterm"
    ];
  };
}
