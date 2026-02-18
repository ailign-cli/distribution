# WinGet Manifests

This section describes the WinGet integration for the AILign CLI.

## About WinGet

WinGet (Windows Package Manager) is Microsoft's official package manager for Windows 10 and Windows 11.

## Usage

To install the AILign CLI using WinGet:

```powershell
winget install ailign-cli.ailign
```

Or search for it:

```powershell
winget search ailign
```

## Manifest Location

WinGet manifests are typically submitted to the official [microsoft/winget-pkgs](https://github.com/microsoft/winget-pkgs) repository. GoReleaser can generate these manifests automatically during the release process.

The manifests follow this structure:
```
manifests/
└── a/
    └── ailign-cli/
        └── ailign/
            └── <version>/
                ├── ailign-cli.ailign.installer.yaml
                ├── ailign-cli.ailign.locale.en-US.yaml
                └── ailign-cli.ailign.yaml
```

## Automated Updates

When a new version is released from [ailign-cli/cli](https://github.com/ailign-cli/cli), GoReleaser will:

1. Generate the required WinGet YAML manifests
2. Submit them to the official winget-pkgs repository (or store them here for manual submission)

## More Information

- [WinGet Documentation](https://docs.microsoft.com/en-us/windows/package-manager/)
- [WinGet Manifest Schema](https://github.com/microsoft/winget-pkgs/tree/master/doc/manifest/schema)
