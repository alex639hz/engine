# 📚 How to Develop and Rebuild - Complete Summary

Your package is ready for development! Here's everything you need to know.

---

## 🎯 What You Have

✅ **main.py** - Entry point (provided by you)  
✅ **engine/** - Main package folder (ready to edit)  
✅ **pyproject.toml** - Package configuration  
✅ **dist/engine-0.1.0-py3-none-any.whl** - Ready-to-distribute wheel  
✅ **Setup & Build Scripts** - Automated tools to help you

---

## 🚀 Quick Start (Choose One)

### Option 1: Automated Setup (Fastest - Recommended)

**Windows:**
```bash
setup_dev.bat
```

**macOS/Linux:**
```bash
chmod +x setup_dev.sh
./setup_dev.sh
```

**That's it! The script sets up everything you need.**

---

### Option 2: Manual Setup (5 minutes)

```bash
# Create virtual environment
python -m venv venv

# Activate it
# Windows: venv\Scripts\activate
# macOS/Linux: source venv/bin/activate

# Install in editable mode
pip install -e .

# Verify
python -c "from engine.framework import Framework; print('✓')"
```

---

## 💻 How to Develop

### Every Day

1. **Activate your virtual environment:**
   ```bash
   # Windows
   venv\Scripts\activate
   
   # macOS/Linux
   source venv/bin/activate
   ```

2. **Edit code in the `engine/` folder** - Any Python file there

3. **Test your changes immediately:**
   ```bash
   # Quick test
   python -c "from engine.framework import Framework; print('OK')"
   
   # Or run a test script
   python my_test.py
   
   # Or run main.py
   python main.py
   ```

4. **Make more changes** - Repeat steps 2-3

**Important:** You do NOT need to rebuild while developing. The editable install (`-e` flag) makes changes available instantly.

---

## 🔨 How to Rebuild (When Shipping)

### When Do You Rebuild?

**Rebuild when:**
- ✅ Ready to distribute/ship the package
- ✅ Publishing to PyPI
- ✅ Testing with a fresh installation
- ✅ Need to share the `.whl` file

**Don't rebuild for:**
- ❌ Day-to-day development (use editable install)
- ❌ Testing code changes
- ❌ Running main.py

### Rebuild Steps

**Option 1: Automated (Recommended)**

```bash
# Windows
rebuild.bat

# macOS/Linux
chmod +x rebuild.sh
./rebuild.sh
```

**Option 2: Manual**

```bash
# Install build tools
pip install build

# Build
python -m build

# Output: dist/engine-0.1.0-py3-none-any.whl
```

---

## 📊 Understanding the Workflow

```
First Time:
  ├─ Run: setup_dev.bat (or setup_dev.sh)
  └─ Done! Environment ready

Daily Development:
  ├─ Activate: venv\Scripts\activate
  ├─ Edit: engine/*.py (changes are instant)
  ├─ Test: python test.py
  └─ Repeat as needed

When Ready to Ship:
  ├─ Run: rebuild.bat (or rebuild.sh)
  ├─ Result: dist/engine-0.1.0-py3-none-any.whl
  └─ Share or publish this file
```

---

## 📁 Your Project Structure

```
C:\ats_py_package\

├── 📄 main.py                    ← Your entry point
├── 📄 pyproject.toml             ← Package config
│
├── 🔧 SETUP SCRIPTS (Run these):
│   ├── setup_dev.bat             ← Initial setup (Windows)
│   ├── setup_dev.sh              ← Initial setup (macOS/Linux)
│   ├── rebuild.bat               ← Rebuild (Windows)
│   └── rebuild.sh                ← Rebuild (macOS/Linux)
│
├── 📚 DOCUMENTATION:
│   ├── THIS FILE                 ← You are here
│   ├── SETUP_AND_BUILD_GUIDE.md  ← Detailed setup guide
│   ├── DEVELOPMENT.md            ← Full development guide
│   ├── QUICK_DEV_REFERENCE.md    ← Quick commands
│   ├── INSTALL.md                ← Installation help
│   └── DEPLOY_TO_PYPI.md         ← Publishing guide
│
├── 📁 engine/                    ← YOUR MAIN CODE
│   ├── __init__.py
│   ├── framework.py              ← Edit these files
│   ├── pipeline.py
│   ├── procedure.py
│   └── ... (20+ more files)
│
├── 📁 dist/                      ← Built packages
│   └── engine-0.1.0-py3-none-any.whl
│
└── 📁 venv/                      ← Virtual environment
    └── (created by setup script)
```

---

## 🎓 Development Example

### Scenario: Add a new method to the Framework class

**Step 1: Edit the code**
```python
# engine/framework.py
class Framework:
    def my_new_method(self):
        return "Hello from new method!"
```

**Step 2: Test immediately**
```bash
python
>>> from engine.framework import Framework
>>> fw = Framework()
>>> fw.my_new_method()
'Hello from new method!'
>>> exit()
```

**Step 3: Integrate into main.py if needed**
```python
# main.py
from engine.framework import framework
result = framework.my_new_method()
print(result)
```

**Step 4: Run and verify**
```bash
python main.py
```

**Step 5: When ready to ship, rebuild**
```bash
rebuild.bat  # or rebuild.sh
```

**Step 6: Share the new wheel**
```bash
# Share this file with others
dist/engine-0.1.0-py3-none-any.whl
```

---

## 🛠️ Common Tasks

| Task | Command |
|------|---------|
| **Setup (first time)** | `setup_dev.bat` or `setup_dev.sh` |
| **Activate venv** | `venv\Scripts\activate` |
| **Test changes** | `python test.py` |
| **Run main** | `python main.py` |
| **Rebuild package** | `rebuild.bat` or `rebuild.sh` |
| **Install from wheel** | `pip install dist/*.whl` |
| **Check installation** | `pip show engine` |
| **Deactivate venv** | `deactivate` |

---

## ❓ FAQ

### Q: Do I need to rebuild after making changes?
**A:** No! Use editable install (`pip install -e .`) for development. Rebuild only when shipping.

### Q: What does "editable mode" mean?
**A:** The package points to your source code. Changes are instantly available without reinstalling.

### Q: When do I use the `rebuild` scripts?
**A:** Only when you're ready to distribute/ship. Not for daily development.

### Q: Can I use an IDE?
**A:** Yes! VS Code, PyCharm, etc. all work fine. Just use the same virtual environment.

### Q: What if setup fails?
**A:** See "Troubleshooting" in [SETUP_AND_BUILD_GUIDE.md](SETUP_AND_BUILD_GUIDE.md)

### Q: How do I update the version?
**A:** Edit version in `pyproject.toml`, then rebuild.

### Q: How do I publish to PyPI?
**A:** See [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)

---

## 📚 Documentation Map

```
START → Choose what you need:

├─ Setup & Build
│  └─ Read: SETUP_AND_BUILD_GUIDE.md
│
├─ Daily Development  
│  └─ Read: QUICK_DEV_REFERENCE.md
│
├─ Full Details
│  ├─ DEVELOPMENT.md (complete dev guide)
│  ├─ INSTALL.md (installation help)
│  └─ DEPLOY_TO_PYPI.md (publishing)
│
└─ Quick Commands
   └─ QUICK_DEV_REFERENCE.md
```

---

## ✅ Checklist

Before you start coding:

- [ ] Python 3.9+ installed (`python --version`)
- [ ] You've read this file (HOW_TO_DEVELOP_AND_REBUILD.md) ← You're here!
- [ ] Run: `setup_dev.bat` (Windows) or `setup_dev.sh` (macOS/Linux)
- [ ] Verify: `python -c "from engine.framework import Framework; print('✓')"`
- [ ] Read: [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md)

---

## 🚀 Next Steps

1. **Run setup script** (Windows or macOS/Linux):
   ```bash
   setup_dev.bat    # Windows
   # OR
   ./setup_dev.sh   # macOS/Linux
   ```

2. **Read quick reference:**
   - [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md)

3. **Start editing code:**
   - Edit files in `engine/` folder
   - Test with `python test.py`
   - Run with `python main.py`

4. **When ready to ship:**
   ```bash
   rebuild.bat      # Windows
   # OR
   ./rebuild.sh     # macOS/Linux
   ```

---

## 📞 Support

**Getting Help:**
1. Check [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md) - Copy-paste commands
2. Read [SETUP_AND_BUILD_GUIDE.md](SETUP_AND_BUILD_GUIDE.md) - Detailed walkthrough
3. Check [DEVELOPMENT.md](DEVELOPMENT.md) - Complete guide
4. Email: alex.639hz@gmail.com

---

## 🎉 You're Ready!

Your package is fully set up for development. The scripts handle all the complexity:
- ✅ `setup_dev.bat/sh` - One-time setup
- ✅ `rebuild.bat/sh` - Rebuild when ready
- ✅ Documentation guides - Full instructions

**Next action: Run the setup script!**

```bash
# Windows
setup_dev.bat

# macOS/Linux
chmod +x setup_dev.sh
./setup_dev.sh
```

---

**Last Updated:** October 8, 2026  
**Package Version:** 0.1.0  
**Status:** Ready for Development! 🚀

---

For detailed setup instructions, see: [SETUP_AND_BUILD_GUIDE.md](SETUP_AND_BUILD_GUIDE.md)  
For quick command reference, see: [QUICK_DEV_REFERENCE.md](QUICK_DEV_REFERENCE.md)
