# Scoop Manifests

This directory (root level) contains Scoop bucket manifests for Windows users.

Scoop manifests are JSON files that describe how to install and configure applications on Windows. They are automatically generated and updated by GoReleaser from the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository.

## Usage

To use this Scoop bucket:

```powershell
scoop bucket add ailign https://github.com/ailign-cli/distribution
scoop install ailign
```

## Manifest Structure

Each manifest is a JSON file named after the application (e.g., `ailign.json`) containing:
- Version information
- Download URLs for binaries
- Installation instructions
- Checksum verification
- Auto-update configuration

## More Information

- [Scoop Documentation](https://scoop.sh/)
- [Creating Scoop Manifests](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)
