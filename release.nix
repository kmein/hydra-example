{
  nixpkgs ? <nixpkgs>,
}:
let
  pkgs = import nixpkgs {
    overlays = [ ];
    config = { };
  };
in
{
  hello = pkgs.hello;
}
