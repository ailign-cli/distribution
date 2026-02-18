# GoReleaser Integration

This document explains how GoReleaser in the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository integrates with this distribution repository.

## Workflow Overview

When a release is created in `ailign-cli/cli`:

1. **GoReleaser runs** as part of the release workflow
2. **Builds binaries** for multiple platforms (Linux, macOS, Windows)
3. **Generates manifests** for each package manager:
   - Homebrew Formula (`Formula/ailign.rb`)
   - Scoop manifest (`ailign.json`)
   - NUR packages (Nix expressions)
   - WinGet manifests (YAML files)
4. **Creates a Pull Request** in this repository with:
   - Updated manifests
   - Release notes in the PR description
   - Version information
   - Links to binaries and checksums

## GoReleaser Configuration

The GoReleaser configuration in `ailign-cli/cli` should include sections for each package manager. Here's an example structure:

### Homebrew Tap

```yaml
brews:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    folder: Formula
    homepage: https://github.com/ailign-cli/cli
    description: "AILign CLI tool"
    license: "MIT"  # Adjust based on actual license
    install: |
      bin.install "ailign"
```

### Scoop Bucket

```yaml
scoop:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    homepage: https://github.com/ailign-cli/cli
    description: "AILign CLI tool"
    license: "MIT"  # Adjust based on actual license
```

### NUR (Nix User Repository)

```yaml
nix:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    homepage: https://github.com/ailign-cli/cli
    description: "AILign CLI tool"
    license: "mit"  # Adjust based on actual license
```

### WinGet

```yaml
winget:
  - name: ailign
    publisher: ailign-cli
    license: "MIT"  # Adjust based on actual license
    homepage: https://github.com/ailign-cli/cli
    short_description: "AILign CLI tool"
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
```

## Pull Request Process

1. **Automated PR Creation**: GoReleaser creates a PR with manifest updates
2. **Review**: Maintainers review the PR to ensure:
   - Version numbers are correct
   - Download URLs are valid
   - Checksums match
   - Installation instructions work
3. **Merge**: Once approved, the PR is merged
4. **Availability**: Updated packages become available through their respective package managers

## Testing

After merging, test installations:

```bash
# Homebrew
brew tap ailign-cli/distribution
brew install ailign

# Scoop
scoop bucket add ailign https://github.com/ailign-cli/distribution
scoop install ailign

# WinGet (may take time to propagate)
winget install ailign-cli.ailign
```

## Troubleshooting

Common issues and solutions:

### PR Not Created
- Check GoReleaser logs in the CLI repository
- Verify GitHub token has write permissions to this repository
- Ensure repository settings allow PRs from workflows

### Invalid Checksums
- Verify the binary upload completed successfully
- Check that the download URL is accessible
- Re-run the GoReleaser build if needed

### Installation Failures
- Test the manifest locally before merging
- Verify binary compatibility with target platform
- Check package manager documentation for specific requirements

## References

- [GoReleaser Documentation](https://goreleaser.com/)
- [GoReleaser Homebrew Integration](https://goreleaser.com/customization/homebrew/)
- [GoReleaser Scoop Integration](https://goreleaser.com/customization/scoop/)
- [GoReleaser Nix Integration](https://goreleaser.com/customization/nix/)
- [GoReleaser WinGet Integration](https://goreleaser.com/customization/winget/)
