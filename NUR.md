# Nix User Repository (NUR)

This section describes the NUR integration for the AILign CLI.

## About NUR

NUR (Nix User Repository) is a community-driven Nix package repository that complements the official nixpkgs. It allows users to share and discover Nix packages that may not be in the official repository.

## Usage

To use packages from this NUR:

1. Add this repository to your NUR configuration in `~/.config/nixpkgs/config.nix` or your NixOS configuration:

```nix
{
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
```

2. Install the AILign CLI:

```bash
nix-env -iA nur.repos.ailign-cli.ailign
```

Or in your configuration:

```nix
environment.systemPackages = with pkgs; [
  nur.repos.ailign-cli.ailign
];
```

## Automated Updates

NUR packages are automatically updated by GoReleaser when new releases are published from the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository.

## More Information

- [NUR Documentation](https://github.com/nix-community/NUR)
- [NUR Guidelines](https://github.com/nix-community/NUR#guidelines)
