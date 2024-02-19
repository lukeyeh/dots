{ ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_vi_key_bindings
    '';
  };
}
