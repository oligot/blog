{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
}:

pkgs.mkShell {

  buildInputs = [
    pkgs.nil
    pkgs.hugo
  ];

}
