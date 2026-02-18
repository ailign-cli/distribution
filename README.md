# distribution

Distribution channels for [ailign-cli/cli](https://github.com/ailign-cli/cli)

This repository contains distribution manifests for the AILign CLI, supporting multiple package managers:

- **Homebrew** (macOS/Linux)
- **Scoop** (Windows)
- **NUR** (Nix User Repository)
- **WinGet** (Windows Package Manager)

## 📦 Installation

### Homebrew (macOS/Linux)

```bash
brew tap ailign-cli/distribution
brew install ailign
```

### Scoop (Windows)

```powershell
scoop bucket add ailign https://github.com/ailign-cli/distribution
scoop install ailign
```

### Nix (via NUR)

```bash
# Add this repository to your NUR configuration
# Then install with:
nix-env -iA nur.repos.ailign-cli.ailign
```

### WinGet (Windows)

```powershell
winget install ailign-cli.ailign
```

## 🤖 Automated Updates

This repository is automatically updated by [GoReleaser](https://goreleaser.com/) running in the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository. When a new release is created, GoReleaser will:

1. Generate updated manifests for each package manager
2. Create a pull request in this repository
3. Include release notes, version information, and binary locations

## 📁 Repository Structure

```
distribution/
├── Formula/          # Homebrew formulas (macOS/Linux CLI tools)
├── Casks/           # Homebrew casks (macOS GUI applications)
├── *.json           # Scoop manifests (Windows)
└── README.md        # This file
```

## 🔧 Manual Updates

In most cases, you should not need to manually update manifests. However, if needed:

1. Fork this repository
2. Make your changes to the appropriate manifest file
3. Create a pull request
4. Ensure the manifest follows the package manager's guidelines

## 📝 License

See the [main CLI repository](https://github.com/ailign-cli/cli) for license information.
