{ config, pkgs, lib, inputs, user, ... }:

{
  nixpkgs.system = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
  };
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
 # services = {
 #   openssh = {
  #    enable = true;
   # };
  #};
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
  };
  services.dbus.enable = true;

  nix = {
    settings = {
		auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.05";
  };
}
