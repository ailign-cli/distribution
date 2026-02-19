# distribution

Distribution channels for [ailign-cli/cli](https://github.com/ailign-cli/cli).

This repository hosts package manager manifests for the AILign CLI. GoReleaser in the CLI repository automatically creates pull requests here when a new release is published.

## Supported package managers

| Manager | Platform | Manifests in this repo |
|---------|----------|----------------------|
| [Homebrew](https://brew.sh/) | macOS / Linux | `Formula/ailign.rb` |
| [Scoop](https://scoop.sh/) | Windows | `ailign.json` |
| [Nix](https://nixos.org/) | macOS / Linux | `pkgs/ailign/default.nix` |

WinGet manifests are submitted directly to [microsoft/winget-pkgs](https://github.com/microsoft/winget-pkgs) by GoReleaser and are not stored in this repository.

## Installation

### Homebrew (macOS / Linux)

```bash
brew tap ailign-cli/distribution
brew install ailign
```

### Scoop (Windows)

```powershell
scoop bucket add ailign https://github.com/ailign-cli/distribution
scoop install ailign
```

### Nix

```bash
nix-env -iA ailign -f https://github.com/ailign-cli/distribution/archive/main.tar.gz
```

### WinGet (Windows)

```powershell
winget install ailign-cli.ailign
```

## How it works

1. A release is tagged in `ailign-cli/cli`.
2. GoReleaser builds binaries, generates manifests, and opens a PR in this repository.
3. Maintainers review and merge the PR.
4. Packages become available through their respective managers.

See [`.github/GORELEASER_INTEGRATION.md`](.github/GORELEASER_INTEGRATION.md) for configuration details.

## Repository structure

```
distribution/
├── Formula/          # Homebrew formulas
├── *.json            # Scoop manifests
├── pkgs/             # Nix derivations
├── scripts/          # Validation tooling
└── .github/          # GoReleaser integration docs
```

## License

Apache-2.0. See [LICENSE](LICENSE).
