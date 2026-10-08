# 🚀 Setup and Build Guide - Complete Instructions

Complete step-by-step guide to set up your development environment and rebuild the package.

---

## 📋 Overview

This guide covers:
1. **Initial Setup** - Get your development environment ready (one-time)
2. **Daily Development** - Work on code and test changes
3. **Building/Rebuilding** - Create distribution packages
4. **Distribution** - Share or publish your package

---

## Part 1: Initial Setup (First Time)

### Option A: Automated Setup (Recommended)

#### Windows Users

1. **Open Command Prompt or PowerShell**
   - Press `Win + R` → type `cmd` → Enter

2. **Navigate to project folder**
   ```batch
   cd C:\ats_py_package
   ```

3. **Run setup script**
   ```batch
   setup_dev.bat
   ```

4. **Follow the prompts** - The script will:
   - Create a virtual environment
   - Install the package in editable mode
   - Verify the installation
   - Optionally install development tools

#### macOS/Linux Users

1. **Open Terminal**

2. **Navigate to project folder**
   ```bash
   cd /path/to/ats_py_package
   ```

3. **Make script executable and run it**
   ```bash
   chmod +x setup_dev.sh
   ./setup_dev.sh
   ```

4. **Follow the prompts** - Same as Windows above

---

### Option B: Manual Setup

#### Step 1: Create Virtual Environment

```bash
# Windows
python -m venv venv

# macOS/Linux
python3 -m venv venv
```

#### Step 2: Activate Virtual Environment

```bash
# Windows (Command Prompt)
venv\Scripts\activate.bat

# Windows (PowerShell)
venv\Scripts\Activate.ps1

# macOS/Linux
source venv/bin/activate
```

**You should see `(venv)` at the start of your terminal prompt.**

#### Step 3: Upgrade pip

```bash
python -m pip install --upgrade pip
```

#### Step 4: Install Package in Editable Mode

```bash
pip install -e .
```

This installs the package with all dependencies, but changes to code are immediately reflected.

#### Step 5: Verify Installation

```bash
python -c "from engine.framework import Framework; print('✓ Ready!')"
```

You should see: `✓ Ready!`

---

## Part 2: Daily Development Workflow

### Start Your Day

1. **Open terminal/command prompt**

2. **Navigate to project**
   ```bash
   cd C:\ats_py_package
   ```

3. **Activate virtual environment**
   ```bash
   # Windows
   venv\Scripts\activate

   # macOS/Linux
   source venv/bin/activate
   ```

### Make Changes

1. **Edit files in the `engine/` folder**
   - Use any text editor or IDE
   - Changes are immediately available (no rebuild needed yet)

### Example Changes

```python
# Edit engine/framework.py
class Framework:
    def __init__(self):
        # Your changes here
        pass
```

### Test Your Changes

**Option 1: Python REPL (Fastest)**

```bash
python
>>> from engine.framework import Framework
>>> fw = Framework()
>>> # Test your changes here
>>> exit()
```

**Option 2: Create a test script**

Create `test_changes.py`:

```python
from engine.framework import Framework
from engine.pipeline import Pipeline

# Test your changes
fw = Framework()
print(f"✓ Framework: {fw}")
print(f"✓ Pipeline: {fw.pipeline}")
```

Run it:

```bash
python test_changes.py
```

**Option 3: Run main.py**

```bash
python main.py
```

### Continue Working

- Make more changes
- Test again
- **No rebuild needed** - editable install handles this

---

## Part 3: Rebuilding the Package

### When Do You Need to Rebuild?

**Rebuild ONLY when:**
- ✅ You're ready to distribute/ship
- ✅ You want to test with a fresh installation
- ✅ You're publishing to PyPI
- ✅ You need to share the `.whl` file

**You DON'T need to rebuild for:**
- ❌ Testing changes (use editable install)
- ❌ Running main.py
- ❌ Importing modules in scripts
- ❌ Daily development work

### Option A: Automated Rebuild (Recommended)

#### Windows Users

1. **From your project directory, run:**
   ```batch
   rebuild.bat
   ```

2. **The script will:**
   - Install build tools
   - Clean old builds
   - Build the package
   - Verify the output
   - Show you where the file is

#### macOS/Linux Users

1. **From your project directory, run:**
   ```bash
   chmod +x rebuild.sh
   ./rebuild.sh
   ```

2. **Same as Windows above**

---

### Option B: Manual Rebuild

#### Step 1: Make Sure You're in Your Virtual Environment

```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

#### Step 2: Install Build Tools

```bash
pip install --upgrade build setuptools wheel
```

#### Step 3: Clean Old Builds (Optional but Recommended)

```bash
# Windows
rmdir /s /q build
rmdir /s /q dist

# macOS/Linux
rm -rf build dist
```

#### Step 4: Build the Package

```bash
python -m build
```

This creates two files in the `dist/` folder:
- `engine-0.1.0-py3-none-any.whl` ← This is what you distribute
- `engine-0.1.0.tar.gz` ← Source distribution (optional)

#### Step 5: Verify the Build

```bash
# Windows
dir dist

# macOS/Linux
ls -lh dist/
```

You should see: `engine-0.1.0-py3-none-any.whl`

---

## Part 4: Testing Your Rebuild

### Quick Test

```bash
# Test the wheel file works
pip install dist/engine-0.1.0-py3-none-any.whl
python -c "from engine.framework import Framework; print('✓ Works!')"
```

### Full Test in Clean Environment

```bash
# Create a separate test virtual environment
python -m venv venv_test

# Activate it
# Windows: venv_test\Scripts\activate
# macOS/Linux: source venv_test/bin/activate

# Install from wheel
pip install dist/engine-0.1.0-py3-none-any.whl

# Test everything
python -c "from engine.framework import Framework; fw = Framework(); print('✓ All OK!')"

# When done, deactivate and remove
deactivate
# Windows: rmdir /s venv_test
# macOS/Linux: rm -rf venv_test
```

---

## Part 5: Distribution

### Option A: Share the Wheel File

Simply copy `dist/engine-0.1.0-py3-none-any.whl` to anyone who needs it.

Recipients install with:
```bash
pip install engine-0.1.0-py3-none-any.whl
```

### Option B: Publish to PyPI

See [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md) for detailed instructions.

Quick version:
```bash
pip install twine
twine upload dist/*
```

---

## Quick Reference

### First Time Setup

```bash
# Windows
cd C:\ats_py_package
setup_dev.bat

# macOS/Linux
cd /path/to/ats_py_package
chmod +x setup_dev.sh
./setup_dev.sh
```

### Daily Workflow

```bash
# Activate venv
venv\Scripts\activate  # Windows or source venv/bin/activate

# Make changes in engine/ folder

# Test changes
python -c "from engine.x import y; print('OK')"

# Run main
python main.py
```

### Rebuild Package

```bash
# Windows
rebuild.bat

# macOS/Linux
chmod +x rebuild.sh
./rebuild.sh
```

### Test the Wheel

```bash
pip install dist/engine-0.1.0-py3-none-any.whl
python -c "from engine.framework import Framework; print('OK')"
```

---

## Troubleshooting

### Problem: "ModuleNotFoundError: No module named 'engine'"

**Solution:**
```bash
pip install -e .
```

### Problem: "Virtual environment not found"

**Solution:**
```bash
python -m venv venv
# Then activate it (see above)
```

### Problem: "Permission denied" on macOS/Linux

**Solution:**
```bash
chmod +x setup_dev.sh
chmod +x rebuild.sh
```

### Problem: "Build failed"

**Solution:**
```bash
pip install --upgrade build setuptools wheel
python -m build
```

### Problem: Changes not showing up

**Solution:**
```bash
# Exit Python and restart it
exit()
python
# Re-import the module
```

---

## Summary

```
SETUP (first time):
  setup_dev.bat (Windows) or setup_dev.sh (macOS/Linux)
  ↓
DEVELOP (every day):
  Edit code in engine/ folder
  Test with: python test_file.py
  Run with: python main.py
  ↓
REBUILD (when shipping):
  rebuild.bat (Windows) or rebuild.sh (macOS/Linux)
  ↓
DISTRIBUTE:
  Share dist/engine-0.1.0-py3-none-any.whl
  or publish to PyPI (see DEPLOY_TO_PYPI.md)
```

---

## File Guide

| File | Purpose |
|------|---------|
| `setup_dev.bat` | Windows automatic setup |
| `setup_dev.sh` | macOS/Linux automatic setup |
| `rebuild.bat` | Windows automatic rebuild |
| `rebuild.sh` | macOS/Linux automatic rebuild |
| `DEVELOPMENT.md` | Full development guide |
| `QUICK_DEV_REFERENCE.md` | Quick command reference |
| `INSTALL.md` | Installation documentation |
| `DEPLOY_TO_PYPI.md` | Publishing to PyPI |

---

## Next Steps

1. **Choose your setup method** (Automated or Manual - above)
2. **Follow the setup instructions**
3. **Verify with:** `python -c "from engine.framework import Framework; print('✓')"`
4. **Read:** [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md)
5. **Start developing!**

---

## Support

- **Full Development Guide:** [DEVELOPMENT.md](DEVELOPMENT.md)
- **Quick Reference:** [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md)
- **Installation Help:** [INSTALL.md](INSTALL.md)
- **Email:** alex.639hz@gmail.com

---

**Last Updated:** October 8, 2026  
**Package Version:** 0.1.0  
**Python Required:** 3.9+

Ready to get started? Run the setup script above! 🚀
