{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    potatoImg.url = "https://www.shutterstock.com/image-photo/young-potato-isolated-on-white-260nw-630239534.jpg";
    potatoImg.flake = false;
  };

  nixConfig = {
    extra-substituters = "https://bmabsout.cachix.org";
    extra-trusted-public-keys = "bmabsout.cachix.org-1:/GhCEayGQ3NHMIlJiUelQrLtHHXVdGjHtyDz32xNAo4=";
  };

  outputs = { self, nixpkgs, flake-utils, potatoImg }:
    flake-utils.lib.eachDefaultSystem (system: {
      defaultApp = with nixpkgs.legacyPackages.${system}; {
        type="app";
        program = "${writeShellApplication {
          name = "potato";
          text = "${feh}/bin/feh ${potatoImg}";
        }}/bin/potato";
      };
    });
}
