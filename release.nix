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
  bye = pkgs.hello.overrideAttrs (oldAttrs: {
    pname = "bye";
    doCheck = false;
    postPatch = (oldAttrs.postPatch or "") + ''
      substituteInPlace src/hello.c \
        --replace-fail 'Hello, world!' 'Bye, world!'
    '';
  });
}
