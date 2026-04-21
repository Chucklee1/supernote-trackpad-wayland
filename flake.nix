{
  description = "Simple program that allows you to use a supernote as a fake-mouse on wayland";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux"];

      allSystemsWithPkgs = f:
      nixpkgs.lib.foldl'
      (
        acc: system: let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
          nixpkgs.lib.recursiveUpdate acc (f system pkgs)
      )
      {}
      systems;
  in
    allSystemsWithPkgs (system: pkgs: {
      pyEnv = pkgs.python3.withPackages (py: [
        py.evdev
      ]);
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          self.outputs.pyEnv
          pkgs.android-tools
          pkgs.android-studio
        ];
      };
    });
}
