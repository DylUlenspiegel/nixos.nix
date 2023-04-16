{ config, lib, pkgs, ... }:

{
  imports = [
   (import ./hypr-variables.nix)
  ];
  # Auto-Hyprland
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    nvidiaPatches = false;
    extraConfig = ''
	# █▀▀ ▀▄▀ █▀▀ █▀▀
	# ██▄ █░█ ██▄ █▄▄

		exec-once = wpaperd
		exec-once = wl-clipboard-history -t
     	 #------------#
     	 # auto start #
     	 #------------#
     	 exec-once = waybar 
     	 exec-once = maco 
     	 exec-once = nm-applet --indicator 
	

      $mainMod = SUPER
      monitor=,2560x1600@165,auto,1 
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options = 
        kb_rules =
        follow_mouse = 1 # 0|1|2|3
        float_switch_override_focus = 2
        numlock_by_default = true
        touchpad {
        	natural_scroll = yes
        }
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      general {
        gaps_in = 3
        gaps_out = 5
        border_size = 0
        no_border_on_floating = true
	layout = dwindle # master|dwindle
	cursor_inactive_timeout = 4
      }
      dwindle {
        no_gaps_when_only = false
        force_split = 0 
        special_scale_factor = 0.8
        split_width_multiplier = 1.0 
        use_active_for_splits = true
        pseudotile = yes 
        preserve_split = yes 
      }
      master {
        new_is_master = true
        special_scale_factor = 0.8
        new_is_master = true
        no_gaps_when_only = false
      }
      # █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
      # █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█
      decoration {
        multisample_edges = true
        rounding = 6
        blur = yes 
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = true
        blur_xray = true

	# █▀█ █▀█ ▄▀█ █▀▀ █ ▀█▀ █▄█
    # █▄█ █▀▀ █▀█ █▄▄ █ ░█░ ░█░

        active_opacity = 0.9
        inactive_opacity = 0.8
        fullscreen_opacity = 1.0
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        shadow_ignore_window = true
        col.shadow = rgba(1a1a1aee)
      }
      animations {
        enabled = yes
    
    	bezier = overshot, 0.05, 0.9, 0.1, 1.05
    	bezier = smoothOut, 0.36, 0, 0.66, -0.56
    	bezier = smoothIn, 0.25, 1, 0.5, 1

    	animation = windows, 1, 5, overshot, slide
    	animation = windowsOut, 1, 4, smoothOut, slide
   	animation = windowsMove, 1, 4, default
	animation = border, 1, 10, default
    	animation = fade, 1, 10, smoothIn
    	animation = fadeDim, 1, 10, smoothIn
   	animation = workspaces, 1, 6, default      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 15
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_create_new = false
      }
      # █▀▄▀█ █ █▀ █▀▀
      # █░▀░█ █ ▄█ █▄▄

      misc {
        disable_autoreload = true
        disable_hyprland_logo = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        animate_manual_resizes = false
        enable_swallow = true
        swallow_regex =  ^(kitty)$
        focus_on_activate = true
      }
      device:epic mouse V1 {
        sensitivity = -0.5
      }
      #-----------------------#
      # Toggle grouped layout #
      #-----------------------#
      bind = $mainMod, K, togglegroup,
      bind = $mainMod, Tab, changegroupactive, f
      #--------------------------------------#
      # Move focus with mainMod + arrow keys #
      #--------------------------------------#
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d
      #----------------------------------------#
      # Switch workspaces with mainMod + [0-9] #
      #----------------------------------------#
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      #----------------------------------#
      # move window in current workspace #
      #----------------------------------#
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, J, movewindow, d
      #---------------------------------------------------------------#
      # Move active window to a workspace with mainMod + ctrl + [0-9] #
      #---------------------------------------------------------------#
      bind = $mainMod CTRL, 1, movetoworkspace, 1
      bind = $mainMod CTRL, 2, movetoworkspace, 2
      bind = $mainMod CTRL, 3, movetoworkspace, 3
      bind = $mainMod CTRL, 4, movetoworkspace, 4
      bind = $mainMod CTRL, 5, movetoworkspace, 5
      bind = $mainMod CTRL, left, movetoworkspace, -1
      bind = $mainMod CTRL, right, movetoworkspace, +1
      # same as above, but doesnt switch to the workspace
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      #-------------------------------------------#
      # switch between current and last workspace #
      #-------------------------------------------#
      binds {
           workspace_back_and_forth = 1 
           allow_workspace_cycles = 1
      }
      #------------------------#
      # quickly launch program #
      #------------------------# 
    bind = $mainMod, T, exec, kitty
	bind = $mainMod, Q, killactive, 
	bind = $mainMod SHIFT, Q, exit, 
	bind = $mainMod, W, exec, librewolf 
	bind = $mainMod, I, exec, idea-ultimate
	bind = $mainMod, E, exec, thunar
	bind = $mainMod, F, fullscreen
	bind = $mainMod, V, togglefloating, 
	bind = $mainMod, R, exec, wofi --show drun
  # █▀▄▀█ █░█ █░░ ▀█▀ █ █▀▄▀█ █▀▀ █▀▄ █ ▄▀█
  # █░▀░█ █▄█ █▄▄ ░█░ █ █░▀░█ ██▄ █▄▀ █ █▀█
	binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
	binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
	binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	binde=, XF86MonBrightnessUp, exec, brightnessctl s +10%
	binde=, XF86MonBrightnessDown, exec, brightnessctl s 10%-
      #---------------#
      # waybar toggle #
      # --------------#
      bind=$mainMod,O,exec,killall -SIGUSR1 .waybar-wrapped
      #---------------#
      # resize window #
      #---------------#
      bind=CTRL SHIFT, left, resizeactive,-15 0
      bind=CTRL SHIFT, right, resizeactive,15 0
      bind=CTRL SHIFT, up, resizeactive,0 -15
      bind=CTRL SHIFT, down, resizeactive,0 15
      bind=CTRL SHIFT, l, resizeactive, 15 0
      bind=CTRL SHIFT, h, resizeactive,-15 0
      bind=CTRL SHIFT, k, resizeactive, 0 -15
      bind=CTRL SHIFT, j, resizeactive, 0 15
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      #-----------------------#
      # wall(by swww service) #
      #-----------------------#
      # exec-once = default_wall 

      #---------------#
      # windows rules #
      #---------------#
# █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
# ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█
	windowrule = float, file_progress
	windowrule = float, confirm
	windowrule = float, dialog
	windowrule = float, download
	windowrule = float, notification
	windowrule = float, error
	windowrule = float, splash
	windowrule = float, confirmreset
	windowrule = float, title:Open File
	windowrule = float, title:branchdialog
	windowrule = float, wofi
	windowrule = float, xarchiver
	windowrule = idleinhibit fullscreen, Librewolf
	windowrule = float, title:^(Media viewer)$
	windowrule = float, title:^(Volume Control)$
	windowrule = float, title:^(Picture-in-Picture)$
	windowrule = size 800 600, title:^(Volume Control)$
	windowrule = move 75 44%, title:^(Volume Control)$
    '';
  };
}
