{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = inputs: {
    hydraJobs = inputs.nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (
      system:
      import ./release.nix {
        inherit (inputs) nixpkgs;
        inherit system;
      }
    );
  };
}
