{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    potatoImg.url = "https://www.shutterstock.com/image-photo/young-potato-isolated-on-white-260nw-630239534.jpg";
    potatoImg.flake = false;
  };

  nixConfig = {
    extra-substituters = "https://bmabsout.cachix.org";

    extra-trusted-public-keys = "bmabsout.cachix.org-1:/GhCEayGQ3NHMIlJiUelQrLtHHXVdGjHtyDz32xNAo4=";
  };

  outputs = { self, nixpkgs, potatoImg }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      defaultApp.x86_64-linux = {
	type="app";
        program = "${pkgs.writeShellApplication {
		name= "potato";
		text= "${pkgs.feh}/bin/feh ${potatoImg}";
	}}/bin/potato";
      };
    };
}
