#!/bin/bash
# Development Environment Setup Script for macOS/Linux
# Run this script once to set up your development environment

echo ""
echo "========================================"
echo "Engine Package - Development Setup"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python is not installed"
    echo "Please install Python 3.9+ from python.org"
    exit 1
fi

echo "Step 1: Checking Python version..."
python3 --version
echo "[OK] Python is installed"
echo ""

# Create virtual environment
echo "Step 2: Creating virtual environment..."
if [ -d "venv" ]; then
    echo "[SKIP] Virtual environment already exists"
else
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to create virtual environment"
        exit 1
    fi
    echo "[OK] Virtual environment created"
fi
echo ""

# Activate virtual environment
echo "Step 3: Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to activate virtual environment"
    exit 1
fi
echo "[OK] Virtual environment activated"
echo ""

# Upgrade pip
echo "Step 4: Upgrading pip..."
python -m pip install --upgrade pip > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[WARNING] Failed to upgrade pip (continuing anyway)"
else
    echo "[OK] pip upgraded"
fi
echo ""

# Install in editable mode
echo "Step 5: Installing package in editable mode..."
pip install -e . > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to install package"
    exit 1
fi
echo "[OK] Package installed in editable mode"
echo ""

# Verify installation
echo "Step 6: Verifying installation..."
python -c "from engine.framework import Framework; print('[OK] Framework imported successfully')" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[ERROR] Framework import failed"
    exit 1
fi
echo ""

# Optional: Install dev tools
echo "Step 7: Would you like to install development tools? (pytest, black, flake8, mypy)"
read -p "Enter Y for yes, N for no (default N): " install_dev
if [ "$install_dev" = "Y" ] || [ "$install_dev" = "y" ]; then
    echo "Installing development tools..."
    pip install pytest pytest-mock black flake8 mypy > /dev/null 2>&1
    echo "[OK] Development tools installed"
else
    echo "[SKIP] Development tools not installed (you can install later with: pip install pytest black flake8 mypy)"
fi
echo ""

echo "========================================"
echo "Setup Complete!"
echo "========================================"
echo ""
echo "Your development environment is ready to use."
echo ""
echo "Next steps:"
echo "  1. Make changes to files in the engine/ folder"
echo "  2. Test with: python test_file.py"
echo "  3. Run main: python main.py"
echo "  4. Rebuild when ready: python -m build"
echo ""
echo "For more information, see DEVELOPMENT.md"
echo ""
