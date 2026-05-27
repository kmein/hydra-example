{
  nixpkgs ? <nixpkgs>,
  system ? builtins.currentSystem,
}:
let
  pkgs = import nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  };
in
{
  hello = pkgs.hello;
}
