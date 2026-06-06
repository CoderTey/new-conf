{ pkgs, ... }: {
  # This enables udev rules for Logitech devices (Unifying and Lightspeed)
  hardware.logitech.wireless.enable = true;

  # (Optional) Enables Solaar and its graphical management
  hardware.logitech.wireless.enableGraphical = true; 

  # Ensure your user is in the 'plugdev' or 'input' group if needed
  users.users.tey.extraGroups = [ "plugdev" "input" ];
}
