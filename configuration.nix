{ ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.primaryUser = "mihirsushil";
  system.stateVersion = 6;
}

