{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
    	neovim
		gcc
		git
		curl
    	kitty
    	librewolf
    	neofetch
		xarchiver
    	xfce.thunar
		xfce.thunar-archive-plugin
		xfce.thunar-media-tags-plugin
		xfce.thunar-volman
		xfce.tumbler
    	megasync
    	qbittorrent
    	brightnessctl
    	jetbrains.idea-ultimate
    	opencv3WithoutCuda
    	# Basic GUI utilities
		# telegram-desktop
		# ciscoPacketTracer8
		wofi
		geany
    	waybar
    	wpaperd
    	wl-clipboard
    	ffmpegthumbnailer
    	feh
    	wlr-randr
    	libxkbcommon
		networkmanagerapplet
		flameshot
    ];  
}

