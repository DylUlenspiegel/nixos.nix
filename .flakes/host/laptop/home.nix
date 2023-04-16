{ config, lib, pkgs, user, ... }:

{
  imports =
    [ (import ../../modules/hyprland/home.nix) ] ++
    (import ../../modules/shell) ++
    # [(import ../../modules/nvim)] ++
    (import ../../modules/programs/wayland) ++
    (import ../../modules/theme/catppuccin-dark/wayland);
    # (import ../../modules/theme/catppuccin-light/wayland) ++
    # (import ../../modules/theme/nord/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
