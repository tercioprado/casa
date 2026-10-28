
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define your hostname.
  networking.hostName = "casa";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enabe flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  # Enable virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
  
  # Enable the XFCE Desktop Environment.
   services.xserver.displayManager.lightdm.enable = true;
   services.xserver.desktopManager.xfce.enable = true;

  # 4. CORREÇÃO DO XDG_DATA_DIRS: Garante que os schemas do GNOME/GTK 
  # e os arquivos .desktop sejam indexados pelo ambiente do XFCE
  environment.sessionVariables = {
    XDG_DATA_DIRS = [
      "/run/current-system/sw/share"
      "$HOME/.nix-profile/share"
    ];
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users."tercio" = {
    isNormalUser = true;
    description = "tercio";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" ];
    packages = with pkgs; [
    ];
  };
  # Enable picom
  services.picom.enable = true;
  
  # Enable neovim
  programs.neovim.enable = true;

  # Install flatpak
  services.flatpak.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [ git
	xfce4-whiskermenu-plugin alacritty vim	libreoffice-qt	unzip	unrar	p7zip	hunspell hunspellDicts.pt_BR 
	chromium whatsapp-electron qemu spotify	xfwm4-themes elementary-xfce-icon-theme	tango-icon-theme candy-icons 
	nixos-icons qemu_kvm htop bat gh tree ghostty tealdeer xclip vscode nerd-fonts.jetbrains-mono nerd-fonts.arimo 
	juno-theme neovim pfetch wget sqlite sqlite-utils 
 ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
