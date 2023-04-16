{ lib, user, ... }:

{ 
	home.file.".config/wpaperd/wallpaper.toml".source = ./wallpaper.toml;
}
