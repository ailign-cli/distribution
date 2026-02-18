# Contributing to AILign CLI Distribution

Thank you for your interest in the AILign CLI distribution repository!

## 🤖 Automated Updates

This repository is primarily maintained through automated updates from [GoReleaser](https://goreleaser.com/) running in the [ailign-cli/cli](https://github.com/ailign-cli/cli) repository.

### How It Works

1. When a new release is created in `ailign-cli/cli`, GoReleaser automatically:
   - Builds binaries for multiple platforms
   - Generates checksums
   - Creates package manager manifests (Homebrew, Scoop, NUR, WinGet)
   - Opens a pull request in this repository with the updated manifests

2. The automated PR includes:
   - Release notes
   - Version information
   - Binary download URLs
   - Updated manifests for all supported package managers

3. Maintainers review and merge the PR

## 📝 Manual Contributions

While most updates are automated, manual contributions may be needed for:

- Fixing manifest errors
- Updating documentation
- Improving repository structure
- Adding support for new package managers

### Making Manual Changes

If you need to make manual changes:

1. **Fork** this repository
2. **Create a branch** with a descriptive name
3. **Make your changes** following the guidelines below
4. **Test** your changes (install the package if possible)
5. **Submit a pull request** with a clear description

### Package Manager Guidelines

#### Homebrew (Formula/)
- Follow the [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Test with `brew install --build-from-source ./Formula/ailign.rb`
- Ensure checksums are correct

#### Scoop (*.json)
- Follow the [Scoop Manifest Guidelines](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)
- Validate JSON syntax
- Test installation with `scoop install ./ailign.json`

#### NUR
- Follow [NUR Guidelines](https://github.com/nix-community/NUR#guidelines)
- Test with `nix-build` before submitting

#### WinGet
- Follow the [WinGet Manifest Schema](https://github.com/microsoft/winget-pkgs/tree/master/doc/manifest/schema)
- Validate YAML syntax
- Use the WinGet validation tools

## 🐛 Reporting Issues

If you encounter issues with package installation:

1. Check if the issue is with the package manifest (this repo) or the CLI itself (main repo)
2. Open an issue in the appropriate repository
3. Include:
   - Package manager and version
   - Operating system
   - Error messages
   - Steps to reproduce

## 📋 Code of Conduct

Please be respectful and constructive in all interactions. This project follows the standard open-source code of conduct.

## ❓ Questions

For questions about:
- **Using the CLI**: See the [main repository](https://github.com/ailign-cli/cli)
- **Package installation**: Open an issue in this repository
- **Contributing code to the CLI**: See the main repository's contributing guide
