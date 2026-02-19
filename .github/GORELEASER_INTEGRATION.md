# GoReleaser Integration

How GoReleaser in [ailign-cli/cli](https://github.com/ailign-cli/cli) integrates with this distribution repository.

## Workflow

1. A release is tagged in `ailign-cli/cli`.
2. GoReleaser builds binaries for Linux, macOS, and Windows.
3. GoReleaser generates manifests and opens a PR in this repository with updated files, release notes, and checksums.
4. Maintainers review and merge.

## GoReleaser v2 configuration

Add these sections to `.goreleaser.yaml` in the CLI repository.

### Homebrew

```yaml
brews:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    folder: Formula
    homepage: https://github.com/ailign-cli/cli
    description: "Instruction governance and distribution for engineering organizations"
    license: "Apache-2.0"
    install: |
      bin.install "ailign"
    test: |
      system "#{bin}/ailign", "version"
```

### Scoop

```yaml
scoops:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    homepage: https://github.com/ailign-cli/cli
    description: "Instruction governance and distribution for engineering organizations"
    license: "Apache-2.0"
```

### Nix

```yaml
nix:
  - name: ailign
    repository:
      owner: ailign-cli
      name: distribution
      branch: main
    homepage: https://github.com/ailign-cli/cli
    description: "Instruction governance and distribution for engineering organizations"
    license: asl20
    path: pkgs/ailign/default.nix
```

### WinGet

WinGet manifests are submitted directly to [microsoft/winget-pkgs](https://github.com/microsoft/winget-pkgs) via a fork, not to this repository.

```yaml
winget:
  - name: ailign
    publisher: ailign-cli
    publisher_url: https://github.com/ailign-cli
    license: "Apache-2.0"
    homepage: https://github.com/ailign-cli/cli
    short_description: "Instruction governance and distribution for engineering organizations"
    repository:
      owner: ailign-cli
      name: winget-pkgs
      branch: "ailign-{{.Version}}"
    pull_request:
      enabled: true
      base:
        owner: microsoft
        name: winget-pkgs
        branch: master
```

## PR review checklist

When reviewing an automated GoReleaser PR:

- Version numbers are correct
- Download URLs are accessible
- Checksums match the release artifacts
- Formula/manifest syntax is valid

## Testing after merge

```bash
# Homebrew
brew tap ailign-cli/distribution
brew install ailign

# Scoop
scoop bucket add ailign https://github.com/ailign-cli/distribution
scoop install ailign
```

## Troubleshooting

### PR not created
- Check GoReleaser logs in the CLI repository's release workflow
- Verify the GitHub token has write access to this repository
- Ensure repository settings allow PRs from workflows

### Invalid checksums
- Verify the release binary upload completed before GoReleaser ran
- Check that download URLs are publicly accessible

## References

- [GoReleaser Documentation](https://goreleaser.com/)
- [GoReleaser Homebrew](https://goreleaser.com/customization/homebrew/)
- [GoReleaser Scoop](https://goreleaser.com/customization/scoop/)
- [GoReleaser Nix](https://goreleaser.com/customization/nix/)
- [GoReleaser WinGet](https://goreleaser.com/customization/winget/)
