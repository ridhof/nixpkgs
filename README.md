# Edo's / Ridho Febriansa's Home-Manager config

an example to run experimental nix command by using a template:
```bash
nix --extra-experimental-features "nix-command flakes" flake new -t templates#go-hello .
```

setup a development shell for a project with nix
1. add config below on flake.nix files
```nix
# after defaultApp

devShell = forAllSystems (system:
  let pkgs = nixpkgsFor.${system};
  in pkgs.mkShell {
    buildInputs = with pkgs; [ go gopls goimports go-tools ];
  });
```
2. run `nix flake update` or `nix --extra-experimental-features "nix-command flakes" flake update` to update flake config (if it has new update)
3. run `nix develop` or `nix --extra-experimental-features "nix-command flakes" develop` to install and use that config

Build flake for home 
```bash
nix --extra-experimental-features "nix-command flakes" build --no-link --impure ~/.config/nixpkgs#homeConfigurations.edo.activationPackage
```

home-manager switch with flake config
```bash
home-manager --extra-experimental-features "nix-command flakes" switch --flake ~/.config/nixpkgs#edo --impure
```

