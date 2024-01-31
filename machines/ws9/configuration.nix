{ config, lib, pkgs, ... }:

{

  networking.hostName = "ws9";

  imports =
    [
      ../../common.nix
      ./hardware-configuration.nix
    ];
}
