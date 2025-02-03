# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    

    programs.neovim.defaultEditor = true;
    networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
        networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "Europe/Warsaw";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "pl_PL.UTF-8";
        LC_IDENTIFICATION = "pl_PL.UTF-8";
        LC_MEASUREMENT = "pl_PL.UTF-8";
        LC_MONETARY = "pl_PL.UTF-8";
        LC_NAME = "pl_PL.UTF-8";
        LC_NUMERIC = "pl_PL.UTF-8";
        LC_PAPER = "pl_PL.UTF-8";
        LC_TELEPHONE = "pl_PL.UTF-8";
        LC_TIME = "pl_PL.UTF-8";
    };

# Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
        options = "ctrl:nocaps";
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.shafti = {
        isNormalUser = true;
        description = "Shafti-Code";
        extraGroups = ["sudoers" "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

# Set shell for all users to zsh, for some reason i forgor why but i like zsh
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    fonts.enableDefaultPackages = true;

    fonts.enableGhostscriptFonts = true;
# List packages installed in system profile. To search, run:
# $ nix search wget
    programs.hyprland.enable = true;
    fonts.packages = with pkgs;[
            fira-code
            fira-code-symbols
            texlivePackages.fontawesome
            nerdfonts
            noto-fonts-monochrome-emoji


    ];
    environment.systemPackages = with pkgs; [
            blender
            brightnessctl
            btop
            clang-tools
            emojione
            firefox
            freecad-wayland
            gcc
            gh
            ghostty
            git
            gnome-disk-utility
            gtk2
            gtk3
            gtk4
            hyprcursor
            hyprland
            hyprland-protocols
            hyprlock
            hyprshade
            hyprshot
            isoimagewriter
            kitty
            libgcc
            lua-language-server
            lxappearance
            lxappearance-gtk2
            nautilus
            neofetch
            neovim
            nwg-look
            python3
            rose-pine-cursor
            rose-pine-cursor
            rose-pine-gtk-theme
            spotify
            spotify-cli-linux
            swww
            vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            vlc
            waybar
            wireplumber
            wlogout
            wofi
            yazi
            zig
            zls
#  wget
    ];

  # Enable VirtualBox kernel modules
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Add your user to the vboxusers group
  users.extraGroups.vboxusers.members = [ "shafti" ];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

}
