# Quick Development Reference

**Copy-paste commands for rapid development.**

---

## First Time Setup (5 minutes)

```bash
# Windows
python -m venv venv
venv\Scripts\activate
pip install -e .

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
pip install -e .
```

---

## Daily Development Workflow

### Activate Virtual Environment

```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

### Edit Code

```bash
# Edit any file in engine/ folder
# Changes are available immediately with editable install
```

### Test Changes

```bash
# Quick test
python -c "from engine.framework import Framework; print('✓ OK')"

# Or in Python REPL
python
>>> from engine.framework import Framework
>>> fw = Framework()
>>> # Test your changes
```

### Run Main Script

```bash
python main.py
```

### Format Code (Optional)

```bash
pip install black
black engine/
```

---

## Rebuilding the Package

### When You Need to Rebuild

- Ready to distribute/package
- Publishing to PyPI
- Testing fresh installation
- Sharing standalone wheel file

### Rebuild Commands

```bash
# Install build tools (once)
pip install build

# Clean old builds (optional but recommended)
# Windows: rmdir /s /q build dist
# macOS/Linux: rm -rf build dist

# Build new package
python -m build

# Output: dist/engine-0.1.0-py3-none-any.whl
```

### One-Liner Build

```bash
python -m build
```

---

## Testing the New Wheel

```bash
# Create test environment
python -m venv venv_test
venv_test\Scripts\activate  # Windows or source venv_test/bin/activate

# Install wheel
pip install dist/engine-0.1.0-py3-none-any.whl

# Test
python -c "from engine.framework import Framework; print('✓ Works!')"

# Cleanup
deactivate
# Remove: rmdir /s venv_test (or rm -rf venv_test)
```

---

## Common Tasks

| Task | Command |
|------|---------|
| **Activate venv** | `venv\Scripts\activate` |
| **Install for dev** | `pip install -e .` |
| **Run main** | `python main.py` |
| **Quick test** | `python -c "from engine.x import y"` |
| **List installed** | `pip list \| grep engine` |
| **Rebuild** | `python -m build` |
| **Format code** | `black engine/` |
| **Lint** | `flake8 engine/` |
| **Clean build** | `rmdir /s build dist` |
| **Show package info** | `pip show engine` |

---

## File Locations

- **Main code:** `engine/` - Edit here
- **Built wheels:** `dist/engine-0.1.0-py3-none-any.whl`
- **Entry point:** `main.py`
- **Configuration:** `pyproject.toml`
- **Full dev guide:** [DEVELOPMENT.md](DEVELOPMENT.md)

---

## Key Points

✅ **Use virtual environment** - Always  
✅ **Install with `-e` flag** - For editable mode  
✅ **Changes are immediate** - No rebuild needed for testing  
✅ **Rebuild before shipping** - For distribution  
✅ **Use Python REPL** - For quick testing  

---

## Troubleshooting Quick Fixes

```bash
# "ModuleNotFoundError: No module named 'engine'"
pip install -e .

# "Permission denied"
# Make sure you're in venv first
venv\Scripts\activate

# Changes not showing up
# Restart Python REPL (exit and python again)

# Build fails
pip install --upgrade build setuptools wheel
python -m build
```

---

## Full Documentation

- **Development Guide:** [DEVELOPMENT.md](DEVELOPMENT.md) ← Read this for details
- **Installation:** [INSTALL.md](INSTALL.md)
- **Quick Start:** [QUICKSTART.md](QUICKSTART.md)
- **Full README:** [README.md](README.md)

---

**Last Updated:** October 8, 2026
