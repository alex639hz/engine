# 🔧 Engine Package - Development Guide

Complete guide for developing, rebuilding, and testing the Engine ATS framework package.

---

## Table of Contents

1. [Development Setup](#development-setup)
2. [Project Structure](#project-structure)
3. [Making Changes](#making-changes)
4. [Rebuilding the Package](#rebuilding-the-package)
5. [Testing Your Changes](#testing-your-changes)
6. [Common Development Tasks](#common-development-tasks)
7. [Troubleshooting](#troubleshooting)

---

## Development Setup

### Prerequisites

- **Python 3.9+** installed (`python --version`)
- **pip** installed (`pip --version`)
- **Git** installed (optional, but recommended)
- **Virtual environment** (strongly recommended)

### Step 1: Set Up Virtual Environment

Navigate to the project directory and create a virtual environment:

```bash
# Windows (Command Prompt or PowerShell)
cd C:\ats_py_package
python -m venv venv
venv\Scripts\activate

# macOS/Linux
cd /path/to/ats_py_package
python3 -m venv venv
source venv/bin/activate
```

You should see `(venv)` at the beginning of your terminal prompt after activation.

### Step 2: Install Package in Editable Mode

Install the package in editable mode so changes are immediately reflected:

```bash
pip install -e .
```

This command:
- Installs the package in development mode
- Creates a `.egg-link` file that points to your source code
- Allows you to modify code without reinstalling
- Installs all dependencies from `pyproject.toml`

### Step 3: Verify Development Installation

```bash
python -c "from engine.framework import Framework; print('✓ Development setup complete!')"
```

### Step 4: (Optional) Install Development Dependencies

For testing, linting, and formatting:

```bash
pip install pytest pytest-mock black flake8 mypy build twine
```

---

## Project Structure

```
C:\ats_py_package\
│
├── 📄 pyproject.toml          ← Package configuration (DON'T change version lightly)
├── 📄 main.py                 ← Main entry point
│
├── 📁 engine/                 ← Main package (EDIT HERE)
│   ├── __init__.py
│   ├── framework.py           ← Core Framework class
│   ├── procedure.py           ← Procedure definitions
│   ├── context.py             ← State management
│   ├── pipeline.py            ← Message pipeline
│   ├── step.py                ← Step definitions
│   ├── step_functions.py      ← Step operations
│   ├── procedure_builder.py   ← Procedure builder
│   ├── worker.py              ← Worker threads
│   ├── constants.py           ← Constants and config
│   ├── types.py               ← Type definitions
│   ├── utils.py               ← Utility functions
│   ├── logger.py              ← Logging system
│   ├── db.py                  ← Database operations
│   ├── json.py                ← JSON utilities
│   └── server/                ← REST API (FastAPI)
│       ├── __init__.py
│       ├── server_main.py
│       ├── server_api.py
│       ├── server_utils.py
│       └── routes/
│           └── routes_general.py
│
├── 📁 dist/                   ← Built packages (REBUILD HERE)
│   └── engine-0.1.0-py3-none-any.whl
│
└── 📁 build/                  ← Temporary build files (auto-generated, ignore)
    └── lib/
        └── engine/
```

---

## Making Changes

### Editing Code

1. **Make your changes** in the `engine/` folder
2. **Changes are immediately available** with editable install (no rebuild needed for imports)
3. **Save the file** - Python will hot-reload on next import

### Example: Modifying `framework.py`

```python
# engine/framework.py
class Framework:
    def __init__(self):
        # Your changes here
        pass
```

### Testing Changes Immediately

```bash
python
```

Then in the Python REPL:

```python
from engine.framework import Framework
fw = Framework()
# Test your changes
```

---

## Rebuilding the Package

### When to Rebuild

**You need to rebuild the wheel file (`.whl`) when:**
- You're ready to distribute/package the code
- You've made changes and want to test with a fresh installation
- You're publishing to PyPI
- You want to share the package as a standalone file

**You DON'T need to rebuild for:**
- Testing changes in your own code (editable mode handles this)
- Running `main.py`
- Importing modules in scripts

### Full Rebuild Process

**Step 1: Clean Old Build Artifacts** (optional but recommended)

```bash
# Windows
rmdir /s /q build dist

# macOS/Linux
rm -rf build dist
```

**Step 2: Install Build Tools**

```bash
pip install build twine
```

**Step 3: Build the Package**

```bash
python -m build
```

This creates two files:
- `dist/engine-0.1.0-py3-none-any.whl` - The wheel (faster to install)
- `dist/engine-0.1.0.tar.gz` - Source distribution

**Step 4: Verify Build**

```bash
ls dist/
# or on Windows: dir dist
```

You should see:
```
engine-0.1.0-py3-none-any.whl
engine-0.1.0.tar.gz
```

### Complete Rebuild Command (One-Liner)

```bash
pip install build && python -m build
```

---

## Testing Your Changes

### Test 1: Verify Imports

```bash
python -c "from engine.framework import Framework; from engine.pipeline import Pipeline; print('✓ All imports OK')"
```

### Test 2: Quick Function Test

Create `test_changes.py`:

```python
from engine.framework import Framework
from engine.context import Context

# Test your changes
fw = Framework()
print(f"✓ Framework initialized: {fw}")
print(f"✓ Context: {fw.context}")
```

Run it:

```bash
python test_changes.py
```

### Test 3: Run Existing Tests (if available)

```bash
pytest
# or with verbose output:
pytest -v
```

### Test 4: Test Installed Wheel

After rebuilding, test the wheel file:

```bash
# Create a new temporary virtual environment
python -m venv venv_test
venv_test\Scripts\activate  # Windows: venv_test\Scripts\activate

# Install from wheel
pip install dist/engine-0.1.0-py3-none-any.whl

# Test
python -c "from engine.framework import Framework; print('✓ Wheel works!')"

# Clean up
deactivate
# Remove the test venv
rmdir /s venv_test
```

---

## Common Development Tasks

### Task 1: Add a New Function

1. Add the function to the appropriate module in `engine/`
2. Add type hints
3. Test in a Python REPL or test file
4. If needed, export it in `engine/__init__.py`

### Task 2: Add a New Module

1. Create new file in `engine/` folder (e.g., `engine/my_module.py`)
2. Add code and type hints
3. Import in dependent modules
4. No rebuild needed yet

### Task 3: Update Dependencies

Edit `pyproject.toml` and update the `dependencies` list:

```toml
[project]
dependencies = [
    "fastapi==0.135.3",
    "pydantic==2.12.5",
    # Add new dependency here
    "new-package==1.0.0",
]
```

Then reinstall:

```bash
pip install -e .
```

### Task 4: Update Version Before Publishing

Edit `pyproject.toml`:

```toml
[project]
version = "0.2.0"  # Change this
```

Then rebuild:

```bash
python -m build
```

### Task 5: Run Code Formatter (Optional)

```bash
# Install formatter
pip install black

# Format all Python files
black engine/

# Or specific file
black engine/framework.py
```

### Task 6: Run Linter (Optional)

```bash
# Install linter
pip install flake8

# Check code
flake8 engine/

# Get detailed errors
flake8 engine/ --show-source
```

### Task 7: Type Checking (Optional)

```bash
# Install type checker
pip install mypy

# Check types
mypy engine/
```

---

## Workflow Example: Add New Feature

### Scenario: Add a new logger method

**Step 1: Edit the code**

```bash
# Edit engine/logger.py
# Add your new method
```

**Step 2: Test immediately**

```python
# In Python REPL
from engine.logger import Logger
logger = Logger()
logger.my_new_method()  # Test it
```

**Step 3: Update main.py if needed**

```python
# Edit main.py
# Import and use the new feature
```

**Step 4: Run main.py**

```bash
python main.py
```

**Step 5: When ready to release, rebuild**

```bash
python -m build
```

**Step 6: Distribute the new `.whl` file**

Share `dist/engine-0.1.0-py3-none-any.whl` (update version if changed)

---

## Environment Variables

Set environment variables for development:

```bash
# Windows (PowerShell)
$env:DEBUG = "true"
$env:PYTHONPATH = "C:\ats_py_package"

# Windows (Command Prompt)
set DEBUG=true
set PYTHONPATH=C:\ats_py_package

# macOS/Linux
export DEBUG=true
export PYTHONPATH=/path/to/ats_py_package
```

In your code, access them:

```python
import os
debug_mode = os.getenv('DEBUG', 'false') == 'true'
```

---

## Troubleshooting

### Problem: "ModuleNotFoundError: No module named 'engine'"

**Solution 1:** Verify editable install

```bash
pip list | grep engine
```

If not present:

```bash
pip install -e .
```

**Solution 2:** Check virtual environment

```bash
# Make sure you're in the right venv
which python  # macOS/Linux
where python  # Windows
```

### Problem: Changes not reflected in imports

**Solution:** Python is caching modules

```bash
# Restart Python interpreter
# Or in code use importlib.reload:
import importlib
import engine.framework
importlib.reload(engine.framework)
```

### Problem: "Permission denied" during install

**Solution:** Use virtual environment

```bash
python -m venv venv
venv\Scripts\activate  # Windows
# or
source venv/bin/activate  # macOS/Linux

pip install -e .
```

### Problem: Dependency conflicts

**Solution:** Install in clean environment

```bash
# Create new venv
python -m venv venv_clean
venv_clean\Scripts\activate

# Install fresh
pip install -e .
```

### Problem: Wheel build fails

**Solution 1:** Install build tools

```bash
pip install --upgrade build setuptools wheel
```

**Solution 2:** Clean and rebuild

```bash
rmdir /s build dist
python -m build
```

### Problem: Tests fail after changes

**Solution:** Check what changed

```bash
# Run tests with verbose output
pytest -v

# Run specific test
pytest tests/test_module.py -v
```

---

## Development Workflow Summary

```
1. Activate venv
   venv\Scripts\activate

2. Install in editable mode (once)
   pip install -e .

3. Edit code in engine/ folder
   (Changes are immediately available)

4. Test your changes
   python test_file.py
   or
   python -c "from engine.x import y; ..."

5. Run main.py
   python main.py

6. When ready to release, rebuild
   python -m build

7. Share or publish the wheel
   dist/engine-0.1.0-py3-none-any.whl
```

---

## Quick Reference

| Task | Command |
|------|---------|
| Activate venv | `venv\Scripts\activate` |
| Install for development | `pip install -e .` |
| Rebuild package | `python -m build` |
| Run tests | `pytest` |
| Format code | `black engine/` |
| Lint code | `flake8 engine/` |
| Check types | `mypy engine/` |
| Run main | `python main.py` |
| Clean build | `rmdir /s build dist` |
| Check package info | `pip show engine` |

---

## Next Steps

1. **Set up your development environment** (follow Development Setup above)
2. **Make a test change** to verify everything works
3. **Create test scripts** to validate changes
4. **Use the workflow example** above as a template
5. **When ready to release**, follow the rebuild process

---

## Additional Resources

- **Full Documentation:** [README.md](README.md)
- **Installation Guide:** [INSTALL.md](INSTALL.md)
- **Quick Start:** [QUICKSTART.md](QUICKSTART.md)
- **Publishing to PyPI:** [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)

---

## Support

- **Email:** alex.639hz@gmail.com
- **License:** MIT
- **Version:** 0.1.0
- **Last Updated:** October 8, 2026

---

**Ready to develop? Start with [Development Setup](#development-setup) above!** 🚀
