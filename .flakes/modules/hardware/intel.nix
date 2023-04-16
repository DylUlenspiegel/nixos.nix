 { config, pkgs, ... }: 
{ # Hardware support for Intel	
  nixpkgs.config.packageOverrides = pkgs: {
    	vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
    hardware.opengl = {
    	enable = true;
    	extraPackages = with pkgs; [
      		intel-media-driver # LIBVA_DRIVER_NAME=iHD
      		vaapiVdpau
      		libvdpau-va-gl
    	];
    };
}
