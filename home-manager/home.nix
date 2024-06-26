{ nixpkgs, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./hyprland.nix
    ./fish.nix
    ./git.nix
    ./ssh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "luke";
  home.homeDirectory = "/home/luke";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    fish
    discord
    hyprpaper
    nerdfonts
    protobuf
    nil
    nixpkgs-fmt
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    lua-language-server
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
}
