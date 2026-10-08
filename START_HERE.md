# 🚀 Engine Package - Start Here!

Welcome to the Engine ATS Python Testing Framework package!

This guide will help you navigate all the documentation and get started quickly.

---

## 📋 Quick Navigation

Choose your path based on what you need:

### 🏃 Just Want to Install and Use?
→ **[QUICKSTART.md](QUICKSTART.md)** (5 minutes)
- Fast installation steps
- First program example
- Common tasks
- Troubleshooting basics

### 📦 Need Detailed Installation Help?
→ **[INSTALL.md](INSTALL.md)** (Complete reference)
- System requirements
- 4 different installation methods
- Virtual environment setup
- Detailed troubleshooting
- Uninstallation steps

### 📚 Want Full Documentation?
→ **[README.md](README.md)** (Complete guide)
- Comprehensive feature list
- Usage examples
- Project structure
- Configuration
- Module reference
- Development guide

### 🌐 Ready to Publish to PyPI?
→ **[DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)** (Step-by-step)
- PyPI account setup
- TestPyPI testing
- Publishing to PyPI
- Version updates
- CI/CD integration

---

## ⚡ Super Quick Start (2 minutes)

### Windows (Command Prompt)

```batch
python -m venv venv
venv\Scripts\activate
pip install dist/engine-0.1.0-py3-none-any.whl
python -c "from engine.framework import Framework; print('Ready!')"
```

### macOS/Linux (Terminal)

```bash
python3 -m venv venv
source venv/bin/activate
pip install dist/engine-0.1.0-py3-none-any.whl
python -c "from engine.framework import Framework; print('Ready!')"
```

### Your First Program

Create `test.py`:

```python
from engine.framework import Framework

fw = Framework()
print("✓ Framework initialized successfully!")
print(f"Context: {fw.context}")
print(f"Database: {fw.db}")
print(f"Server: {fw.server}")
```

Run it:
```bash
python test.py
```

---

## 📂 Project Structure

```
C:\ats_py_package\
│
├── 📄 START_HERE.md           ← YOU ARE HERE
├── 📄 README.md               ← Full documentation
├── 📄 QUICKSTART.md           ← Quick start (5 min)
├── 📄 INSTALL.md              ← Installation guide
├── 📄 DEPLOY_TO_PYPI.md       ← Publishing guide
├── 📄 LICENSE                 ← MIT License
├── 📄 .gitignore              ← Git configuration
├── 📄 pyproject.toml          ← Package configuration
│
├── 📁 engine/                 ← Main package folder
│   ├── __init__.py
│   ├── framework.py           ← Core Framework class
│   ├── procedure.py           ← Procedures
│   ├── context.py             ← State management
│   ├── pipeline.py            ← Message pipeline
│   ├── step.py                ← Step definitions
│   ├── step_functions.py      ← Step operations
│   ├── procedure_builder.py   ← Procedure builder
│   ├── worker.py              ← Worker threads
│   ├── constants.py           ← Constants
│   ├── types.py               ← Type definitions
│   ├── utils.py               ← Utilities
│   ├── logger.py              ← Logging
│   ├── db.py                  ← Database
│   ├── json.py                ← JSON utilities
│   └── server/                ← FastAPI server
│       ├── __init__.py
│       ├── server_main.py
│       ├── server_api.py
│       ├── server_utils.py
│       └── routes/
│           └── routes_general.py
│
├── 📁 dist/                   ← Built packages
│   └── engine-0.1.0-py3-none-any.whl
│
└── 📁 docs/                   ← Additional documentation (optional)
```

---

## ❓ Common Questions

### Q: How do I install this package?

**A:** See [QUICKSTART.md](QUICKSTART.md) (quick) or [INSTALL.md](INSTALL.md) (detailed)

```bash
pip install dist/engine-0.1.0-py3-none-any.whl
```

### Q: What are the system requirements?

**A:** Python 3.9+. See [INSTALL.md](INSTALL.md) for details.

### Q: How do I use the Framework?

**A:** See [QUICKSTART.md](QUICKSTART.md) or [README.md](README.md)

```python
from engine.framework import Framework
fw = Framework()
```

### Q: How do I publish to PyPI?

**A:** See [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)

```bash
twine upload dist/engine-0.1.0-py3-none-any.whl
```

### Q: What's included in the package?

**A:** See [README.md](README.md) - Features section

### Q: I'm getting import errors. What do I do?

**A:** See [INSTALL.md](INSTALL.md) - Troubleshooting section

### Q: Can I use this in production?

**A:** This is a v0.1.0 alpha release. Thoroughly test before production use.

### Q: How do I update the package version?

**A:** See [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md) - Updating Versions section

---

## 🎯 Your Path Forward

### Path 1: Get It Working Today ⚡

1. Run: `pip install dist/engine-0.1.0-py3-none-any.whl`
2. Read: [QUICKSTART.md](QUICKSTART.md)
3. Start coding! 💻

### Path 2: Understand Everything 📚

1. Read: [README.md](README.md) - Full documentation
2. Explore: `engine/` folder
3. Review: Code comments and type hints
4. Start building! 🏗️

### Path 3: Publish to PyPI 🌐

1. Read: [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)
2. Create PyPI account: https://pypi.org/account/register/
3. Test on TestPyPI: https://test.pypi.org
4. Publish to PyPI
5. Share with the world! 🎉

### Path 4: Contribute & Develop 🔧

1. Read: [INSTALL.md](INSTALL.md) - Development Install
2. Set up virtual environment with `-e` flag
3. Modify engine/ code
4. Run tests: `pytest`
5. Submit pull requests!

---

## ✅ Installation Verification

Run this command to verify your installation:

```bash
python -c "from engine.framework import Framework; fw = Framework(); print('✓ All systems go!')"
```

If you see `✓ All systems go!` - you're ready to use the package!

---

## 📞 Support & Help

### Documentation
- 📖 **Full README:** [README.md](README.md)
- ⚡ **Quick Start:** [QUICKSTART.md](QUICKSTART.md)
- 🔧 **Installation:** [INSTALL.md](INSTALL.md)
- 🚀 **Publishing:** [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)

### Contact
- **Email:** alex.639hz@gmail.com
- **License:** MIT (see [LICENSE](LICENSE))

### Package Info
- **Version:** 0.1.0
- **Python:** 3.9+
- **Status:** Alpha Release

---

## 🎓 Learning Resources

### Understanding the Engine

The Engine framework consists of these core concepts:

1. **Framework** - Main orchestrator (framework.py)
2. **Pipeline** - Message queue (pipeline.py)
3. **Procedure** - Test procedures (procedure.py)
4. **Context** - Shared state (context.py)
5. **Server** - REST API (server/)
6. **Database** - Data persistence (db.py)
7. **Logging** - Event logging (logger.py)

See [README.md](README.md) for detailed explanations.

---

## 🔥 Pro Tips

1. **Always use virtual environments** - Keeps dependencies isolated
2. **Test on TestPyPI first** - Before publishing to PyPI
3. **Read error messages carefully** - They usually tell you what's wrong
4. **Check the module source** - Best documentation is the code itself
5. **Use type hints** - Framework includes full type hints

---

## 🚀 Next Steps

**Choose one:**

### Option A: Install & Start Using
→ [QUICKSTART.md](QUICKSTART.md)

### Option B: Deep Dive Documentation
→ [README.md](README.md)

### Option C: Detailed Installation Help
→ [INSTALL.md](INSTALL.md)

### Option D: Publish to PyPI
→ [DEPLOY_TO_PYPI.md](DEPLOY_TO_PYPI.md)

---

## 📋 Checklist

Before you get started, make sure you have:

- [ ] Python 3.9 or higher installed (`python --version`)
- [ ] pip installed (`pip --version`)
- [ ] This package (`engine-0.1.0-py3-none-any.whl`)
- [ ] 30 seconds to read this file ✓
- [ ] A text editor or IDE ready
- [ ] 5 minutes for QUICKSTART ✓

You're all set! 🎉

---

**Last Updated:** October 8, 2026  
**Package Version:** 0.1.0  
**Author:** Alex Zvuluny

Ready to build? Start with [QUICKSTART.md](QUICKSTART.md)! 🚀
