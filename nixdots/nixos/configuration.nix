
{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Hardware
    ./hardware/hardware-configuration.nix
    ./hardware/nvidia.nix

    # Boot
    ./boot

    # Core
    ./core/nix.nix
    ./core/users.nix
    ./core/locale-time.nix
    ./core/qemu.nix


    # Network
    ./network

    # Desktop
    ./desktop/xorg.nix
    ./desktop/river.nix
    ./desktop/niri.nix
    ./desktop/picom.nix
    ./desktop/xmonad.nix
  ];

  # Thermal Management
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
  };
  
  systemd = {
  packages = [ pkgs.waydroid-helper ];
  services.waydroid-mount.wantedBy = [ "multi-user.target" ];
};
 
 services.asusd.enable = true;
 virtualisation.waydroid.enable = true; 
 services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    clang
    gcc
    asusctl
    cage
    waydroid-helper
    waydroid
    bindfs
  ];

  networking.hostName = "nixos";

  # System version
  system.stateVersion = "25.11";
}
