# { services, ...}:
{
  services = {
  	flatpak.enable = true;
	pipewire = {
		enable = true;
  		wireplumber.enable = true;
		alsa.enable = true;
		audio.enable = true;
	};
	# CPU services
	thermald.enable = true;
  	auto-cpufreq.enable = true;
	# Disk mounting
	gvfs.enable = true;
	# Change screen color depending on the sun
	# redshift.enable = true;
  };
}
