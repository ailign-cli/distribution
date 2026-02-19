# Contributing to AILign CLI Distribution

This repository is primarily maintained through automated updates from [GoReleaser](https://goreleaser.com/) running in the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository.

## Automated updates

When a new release is created in `ailign-cli/cli`, GoReleaser:

1. Builds binaries for all platforms
2. Generates package manager manifests (Homebrew formula, Scoop JSON, Nix derivation)
3. Opens a pull request in this repository
4. Maintainers review and merge

## Manual contributions

Manual changes may be needed for:

- Fixing manifest errors
- Updating documentation
- Improving validation scripts

### How to contribute

1. Fork this repository
2. Create a branch with a descriptive name
3. Make your changes
4. Test the manifest if possible (see below)
5. Submit a pull request

### Testing manifests

#### Homebrew (`Formula/`)
- Follow the [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Test with `brew install --build-from-source ./Formula/ailign.rb`

#### Scoop (`*.json`)
- Follow the [Scoop Manifest Guidelines](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)
- Validate JSON: `python -m json.tool ailign.json`
- Test with `scoop install ./ailign.json`

#### Nix (`pkgs/`)
- Test with `nix-build` before submitting

## Reporting issues

If you encounter installation problems:

1. Determine if the issue is with the manifest (this repo) or the CLI itself ([ailign-cli/cli](https://github.com/ailign-cli/cli))
2. Open an issue in the appropriate repository
3. Include: package manager version, OS, error messages, and steps to reproduce
