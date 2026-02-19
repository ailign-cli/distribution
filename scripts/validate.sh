#!/bin/bash
# Validate distribution repository manifests.
# Checks Homebrew formulas (Ruby syntax), Scoop manifests (JSON syntax),
# and Nix derivations (nix-instantiate) when files are present.

set -euo pipefail

errors=0

fail() {
  echo "FAIL: $1" >&2
  errors=$((errors + 1))
}

pass() {
  echo "  ok: $1"
}

# --- Directory structure ---
echo "Checking directory structure..."
for dir in Formula .github scripts; do
  if [ -d "$dir" ]; then
    pass "$dir/ exists"
  else
    fail "$dir/ is missing"
  fi
done

# --- Homebrew formulas ---
echo "Checking Homebrew formulas..."
formulas=(Formula/*.rb)
if [ -e "${formulas[0]}" ]; then
  for f in "${formulas[@]}"; do
    if ruby -c "$f" > /dev/null 2>&1; then
      pass "$f syntax valid"
    else
      fail "$f has Ruby syntax errors"
    fi
  done
else
  echo "  skip: no formulas found (Formula/*.rb)"
fi

# --- Scoop manifests ---
echo "Checking Scoop manifests..."
scoops=(*.json)
if [ -e "${scoops[0]}" ]; then
  for f in "${scoops[@]}"; do
    # Skip non-scoop JSON (e.g. package.json)
    if [ "$f" = "package.json" ] || [ "$f" = "package-lock.json" ]; then
      continue
    fi
    if python3 -m json.tool "$f" > /dev/null 2>&1; then
      pass "$f is valid JSON"
    else
      fail "$f has JSON syntax errors"
    fi
  done
else
  echo "  skip: no Scoop manifests found (*.json)"
fi

# --- Nix derivations ---
echo "Checking Nix derivations..."
if [ -d "pkgs" ]; then
  nix_files=$(find pkgs -name '*.nix' 2>/dev/null)
  if [ -n "$nix_files" ]; then
    if command -v nix-instantiate > /dev/null 2>&1; then
      for f in $nix_files; do
        if nix-instantiate --parse "$f" > /dev/null 2>&1; then
          pass "$f syntax valid"
        else
          fail "$f has Nix syntax errors"
        fi
      done
    else
      echo "  skip: nix-instantiate not available"
    fi
  else
    echo "  skip: no Nix files found in pkgs/"
  fi
else
  echo "  skip: pkgs/ directory not found"
fi

# --- Required files ---
echo "Checking required files..."
for f in README.md LICENSE .gitignore CONTRIBUTING.md; do
  if [ -f "$f" ]; then
    pass "$f exists"
  else
    fail "$f is missing"
  fi
done

# --- Summary ---
echo ""
if [ "$errors" -gt 0 ]; then
  echo "Validation failed with $errors error(s)."
  exit 1
else
  echo "Validation passed."
fi
