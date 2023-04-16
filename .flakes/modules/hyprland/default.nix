{ config, lib, pkgs, inputs, ... }:
{
  imports = [ ../programs/wayland/waybar/hyprland_waybar.nix ];
  programs = {
    dconf.enable = true;
  };


  # security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
