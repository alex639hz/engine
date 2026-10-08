# Engine Package - Installation Guide

Complete step-by-step installation instructions for different scenarios.

---

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installation Methods](#installation-methods)
3. [Verification](#verification)
4. [Uninstalling](#uninstalling)

---

## System Requirements

### Python Version
- **Python 3.9** or higher (tested with 3.9, 3.10, 3.11, 3.12)
- Check your Python version:
  ```bash
  python --version
  ```

### Operating Systems
- Windows 10/11
- macOS (Intel or Apple Silicon)
- Linux (Ubuntu, CentOS, etc.)

### Required Tools
- **pip** (Python package manager) - comes with Python 3.4+
- **Virtual environment** (recommended)

### Disk Space
- Minimum: 100 MB
- Recommended: 500 MB (with all dependencies)

---

## Installation Methods

### Method 1: Quick Install from Wheel (Recommended)

Best for: Production use, testing, distribution

**Step 1: Create Virtual Environment**

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

**Step 2: Install from Wheel**

```bash
pip install dist/engine-0.1.0-py3-none-any.whl
```

**Step 3: Verify Installation**

```bash
python -c "from engine.framework import Framework; print('Installation successful!')"
```

**Time to complete:** ~2-5 minutes

---

### Method 2: Development Install (Editable Mode)

Best for: Development, contribution, testing changes

**Step 1: Navigate to Package Directory**

```bash
cd C:\ats_py_package
# or cd /path/to/ats_py_package on macOS/Linux
```

**Step 2: Create Virtual Environment**

```bash
python -m venv venv
source venv/Scripts/activate  # Windows: venv\Scripts\activate
```

**Step 3: Install in Editable Mode**

```bash
pip install -e .
```

**Step 4: Verify Installation**

```bash
python -c "from engine.framework import Framework; print('Development install successful!')"
```

**Step 5 (Optional): Install Development Tools**

```bash
pip install pytest pytest-mock black flake8
```

**Time to complete:** ~3-7 minutes

---

### Method 3: Install with Specific Python Version

If you have multiple Python versions installed:

**Windows:**
```bash
py -3.11 -m venv venv
venv\Scripts\activate
pip install dist/engine-0.1.0-py3-none-any.whl
```

**macOS/Linux:**
```bash
python3.11 -m venv venv
source venv/bin/activate
pip install dist/engine-0.1.0-py3-none-any.whl
```

---

### Method 4: Offline Installation

For environments without internet access:

**Step 1: Prepare Files on Online Computer**

```bash
# Download the wheel file (already in dist/ folder)
# Transfer dist/engine-0.1.0-py3-none-any.whl to offline computer
```

**Step 2: Install on Offline Computer**

```bash
python -m venv venv
source venv/Scripts/activate  # Or venv\Scripts\activate on Windows
pip install engine-0.1.0-py3-none-any.whl
```

---

## Verification

### Quick Verification

```bash
python -c "from engine.framework import Framework; print('✓ Installation successful!')"
```

### Detailed Verification

```bash
python
```

Then in the Python REPL:

```python
# Test core imports
from engine.framework import Framework
from engine.procedure import Procedure
from engine.context import Context
from engine.pipeline import Pipeline
from engine.server.server_main import Server

# Create framework instance
fw = Framework()
print(f"Framework version: {fw.__class__.__module__}")
print(f"✓ All core modules imported successfully")

# Check installed version
import engine
print(f"Engine package location: {engine.__file__}")

exit()
```

### Check Installed Package

```bash
pip show engine
```

Expected output:
```
Name: engine
Version: 0.1.0
Summary: ATS Python Testing Framework Engine
Home-page: https://github.com/yourusername/engine
Author: Alex Zvuluny
Author-email: alex.639hz@gmail.com
Location: C:\Users\username\venv\lib\site-packages
Requires: fastapi, pydantic, pymongo, numpy, ...
```

---

## Troubleshooting

### Problem: "Command not found: python"

**Solution:** Python is not in your PATH

```bash
# Windows: Use python launcher
py --version

# macOS/Linux: Use python3
python3 --version

# If still not working, install Python from python.org
```

---

### Problem: "ModuleNotFoundError: No module named 'engine'"

**Solution 1:** Verify installation

```bash
pip list | grep engine
```

If not listed:
```bash
pip install dist/engine-0.1.0-py3-none-any.whl
```

**Solution 2:** Check virtual environment

Make sure you're in the correct virtual environment:

```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate

# Verify (prompt should show venv name)
which python  # or 'where python' on Windows
```

---

### Problem: "Permission denied" during installation

**Solution 1:** Use virtual environment

```bash
python -m venv venv
source venv/Scripts/activate
pip install dist/engine-0.1.0-py3-none-any.whl
```

**Solution 2:** Install with --user flag

```bash
pip install --user dist/engine-0.1.0-py3-none-any.whl
```

---

### Problem: "wheel has unsupported version"

**Solution:** Update pip

```bash
pip install --upgrade pip setuptools wheel
pip install dist/engine-0.1.0-py3-none-any.whl
```

---

### Problem: Dependency installation fails

**Solution 1:** Upgrade pip

```bash
pip install --upgrade pip
pip install dist/engine-0.1.0-py3-none-any.whl
```

**Solution 2:** Install dependencies manually

```bash
pip install fastapi pydantic pymongo numpy starlette uvicorn
pip install dist/engine-0.1.0-py3-none-any.whl
```

---

### Problem: "No module named 'engine'" in IDE

**Solution:** Configure IDE Python Interpreter

#### PyCharm
1. File → Settings → Project → Python Interpreter
2. Select your virtual environment (venv)
3. IDE will detect the installation

#### VS Code
1. Open Command Palette (Ctrl+Shift+P)
2. Select "Python: Select Interpreter"
3. Choose virtual environment path

#### Jupyter Notebook
```python
import sys
sys.path.insert(0, r'C:\path\to\venv\lib\site-packages')
from engine.framework import Framework
```

---

## Uninstalling

### Remove Package

```bash
pip uninstall engine
```

### Remove Virtual Environment

```bash
# Windows
rmdir /s venv

# macOS/Linux
rm -rf venv
```

### Clean Up

```bash
# Remove cache
pip cache purge

# Remove build artifacts
rm -rf build/ dist/ engine.egg-info/
```

---

## Next Steps

1. Read [README.md](README.md) for basic usage
2. Check [docs/](docs/) for detailed documentation
3. Review example scripts in the package
4. Test installation with your own code

---

## Support

- **Email:** alex.639hz@gmail.com
- **Issues:** Check GitHub issues repository
- **Documentation:** See README.md and docs/ folder

---

**Version:** 0.1.0  
**Last Updated:** October 8, 2026
