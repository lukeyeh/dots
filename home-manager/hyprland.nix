{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = [
        "waybar"
        "dunst"
        "hyprpaper"
      ];

      monitor = [ ",preferred,auto,auto" ];

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "ctrl:swapcaps";
        kb_rules = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = -1; # Set to 0 to disable the anime mascot wallpapers
      };

      opengl = {
        nvidia_anti_flicker = false;
      };

      bind =
        let
          main_mod = "ALT";
        in
        [
          "${main_mod}, RETURN, exec, alacritty"
          "${main_mod}, G, exec, firefox"

          "${main_mod} SHIFT, Q, killactive"
          "${main_mod} SHIFT, E, exit"
          "${main_mod}, V, togglefloating"
          "${main_mod}, TAB, exec, rofi -show drun -show-icons"

          "${main_mod}, w, togglesplit"
          "${main_mod}, E, togglegroup"
          "${main_mod}, F, changegroupactive, f"
          "${main_mod}, B, changegroupactive, b"

          "${main_mod}, l, movefocus, r"
          "${main_mod}, h, movefocus, l"
          "${main_mod}, k, movefocus, u"
          "${main_mod}, j, movefocus, d"

          "${main_mod}, 1, workspace, 1"
          "${main_mod}, 2, workspace, 2"
          "${main_mod}, 3, workspace, 3"
          "${main_mod}, 4, workspace, 4"
          "${main_mod}, 5, workspace, 5"
          "${main_mod}, 6, workspace, 6"
          "${main_mod}, 7, workspace, 7"
          "${main_mod}, 8, workspace, 8"
          "${main_mod}, 9, workspace, 9"
          "${main_mod}, 0, workspace, 10"

          "${main_mod} SHIFT, 1, movetoworkspace, 1"
          "${main_mod} SHIFT, 2, movetoworkspace, 2"
          "${main_mod} SHIFT, 3, movetoworkspace, 3"
          "${main_mod} SHIFT, 4, movetoworkspace, 4"
          "${main_mod} SHIFT, 5, movetoworkspace, 5"
          "${main_mod} SHIFT, 6, movetoworkspace, 6"
          "${main_mod} SHIFT, 7, movetoworkspace, 7"
          "${main_mod} SHIFT, 8, movetoworkspace, 8"
          "${main_mod} SHIFT, 9, movetoworkspace, 9"
          "${main_mod} SHIFT, 0, movetoworkspace, 10"


          "${main_mod} SHIFT, H, movewindow, l"
          "${main_mod} SHIFT, L, movewindow, r"
          "${main_mod} SHIFT, K, movewindow, u"
          "${main_mod} SHIFT, J, movewindow, d "
        ];

      bindm =
        let
          main_mod = "ALT";
        in
        [
          "${main_mod}, mouse:272, movewindow"
          "${main_mod}, mouse:273, resizewindow"
        ];
    };
  };
}
