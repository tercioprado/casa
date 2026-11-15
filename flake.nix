 {
      description = "Meu primeiro flake!";

        inputs = {
          nixpkgs.url = "nixpkgs/nixos-26.05";
   };

        outputs = { self, nixpkgs, ...  }:
          let
            lib = nixpkgs.lib;
          in {
          nixosConfigurations = {
                   casa = lib.nixosSystem {
                        system = "x86_64-linux";
                        modules = [ ./configuration.nix ];

        };      

     };

   };


}


