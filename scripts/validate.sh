#!/bin/bash
# Validation script to verify the distribution repository structure
# This ensures the repository is ready to receive GoReleaser PRs

set -e

echo "🔍 Validating AILign CLI Distribution Repository Structure..."
echo ""

# Check for required directories
echo "📁 Checking required directories..."
directories=("Formula" "Casks" ".github")
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "  ✅ $dir/ exists"
    else
        echo "  ❌ $dir/ is missing"
        exit 1
    fi
done
echo ""

# Check for required files
echo "📄 Checking required files..."
files=("README.md" ".gitignore" "CONTRIBUTING.md")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file exists"
    else
        echo "  ❌ $file is missing"
        exit 1
    fi
done
echo ""

# Check for documentation files
echo "📚 Checking documentation files..."
doc_files=("SCOOP.md" "NUR.md" "WINGET.md" ".github/GORELEASER_INTEGRATION.md")
for file in "${doc_files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file exists"
    else
        echo "  ⚠️  $file is missing (optional but recommended)"
    fi
done
echo ""

# Verify README content
echo "📖 Checking README.md content..."
readme_keywords=("Homebrew" "Scoop" "NUR" "WinGet" "GoReleaser")
for keyword in "${readme_keywords[@]}"; do
    if grep -q "$keyword" README.md; then
        echo "  ✅ README mentions $keyword"
    else
        echo "  ⚠️  README doesn't mention $keyword"
    fi
done
echo ""

# Check .gitignore
echo "🚫 Checking .gitignore..."
if [ -f ".gitignore" ] && [ -s ".gitignore" ]; then
    echo "  ✅ .gitignore is present and not empty"
else
    echo "  ⚠️  .gitignore is missing or empty"
fi
echo ""

# Summary
echo "✨ Repository structure validation complete!"
echo ""
echo "Next steps:"
echo "1. Configure GoReleaser in the ailign-cli/cli repository"
echo "2. Test with a release to verify manifest generation"
echo "3. Merge GoReleaser PRs to publish packages"
echo ""
echo "For more information, see .github/GORELEASER_INTEGRATION.md"
