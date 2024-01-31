{ config, lib, pkgs, ... }:

{

  networking.hostName = "ws9";

  imports =
    [
      ../../common.nix
      ./hardware-configuration.nix
    ];


  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

}
