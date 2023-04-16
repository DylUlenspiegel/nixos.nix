{ config, pkgs, user, inputs, ... }:

{
  imports =
    (import ../../modules/hardware) ++
    [
      ./hardware-configuration.nix
      ../../modules/fonts
    ] ++ [
      ../../modules/hyprland
    ] ++ [
	  ./pkgs.nix
	  ./services.nix
    ];
  programs.fish.enable = true;
  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
   };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 3;
    };
    kernelParams = [
      "quiet"
      "splash"
   #  "nvidia-drm.modeset=1"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
 #services = {
  #  dbus.packages = [ pkgs.gcr ];
    # getty.autologinUser = "${user}";
 # };

  # security.polkit.enable = true;
  security.sudo = {
    enable = false;
    extraConfig = ''
      ${user} ALL=(ALL) NOPASSWD:ALL
    '';
  };
  security.doas = {
    enable = true;
    extraConfig = ''
      permit nopass :wheel
    '';
  };

}
