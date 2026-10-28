{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs =  { self, nixpkgs }: {
	nixosConfigurations.casa = nixpkgs.lib.nixosSystem {
		modules = [ ./configuration.nix ];

	};
    };
}
