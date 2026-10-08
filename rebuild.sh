#!/bin/bash
# Package Rebuild Script for macOS/Linux
# Rebuilds the distribution wheel

echo ""
echo "========================================"
echo "Engine Package - Rebuild Script"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "pyproject.toml" ]; then
    echo "ERROR: pyproject.toml not found"
    echo "Make sure you run this from the project root directory"
    exit 1
fi

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    echo "Activating virtual environment..."
    source venv/bin/activate
else
    echo "WARNING: Virtual environment not found"
    echo "You may need to run setup_dev.sh first"
fi
echo ""

# Install/update build tools
echo "Step 1: Installing build tools..."
pip install --upgrade build setuptools wheel > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[WARNING] Failed to install build tools"
else
    echo "[OK] Build tools ready"
fi
echo ""

# Clean old builds (optional)
echo "Step 2: Cleaning old builds..."
if [ -d "build" ]; then
    rm -rf build
    echo "[OK] Removed build/ directory"
else
    echo "[SKIP] No build/ directory to clean"
fi

if [ -d "dist" ]; then
    echo "[OK] dist/ directory exists (will be updated)"
else
    echo "[CREATE] dist/ directory will be created"
fi
echo ""

# Build the package
echo "Step 3: Building package..."
python -m build
if [ $? -ne 0 ]; then
    echo "[ERROR] Build failed!"
    exit 1
fi
echo "[OK] Build successful"
echo ""

# Verify build output
echo "Step 4: Verifying build output..."
if [ -f "dist/engine-0.1.0-py3-none-any.whl" ]; then
    echo "[OK] Found: dist/engine-0.1.0-py3-none-any.whl"
else
    echo "[ERROR] Wheel file not found!"
    exit 1
fi

if [ -f "dist/engine-0.1.0.tar.gz" ]; then
    echo "[OK] Found: dist/engine-0.1.0.tar.gz"
else
    echo "[WARNING] Source distribution not found"
fi
echo ""

# Show file sizes
echo "Step 5: Build artifacts:"
ls -lh dist/
echo ""

echo "========================================"
echo "Rebuild Complete!"
echo "========================================"
echo ""
echo "Your package has been rebuilt successfully!"
echo ""
echo "Location: dist/engine-0.1.0-py3-none-any.whl"
echo ""
echo "You can now:"
echo "  - Install it: pip install dist/engine-0.1.0-py3-none-any.whl"
echo "  - Test it: (see instructions in QUICK_DEV_REFERENCE.md)"
echo "  - Share it: dist/engine-0.1.0-py3-none-any.whl"
echo "  - Upload to PyPI: twine upload dist/*"
echo ""
