# Engine - ATS Python Testing Framework

A comprehensive, production-ready testing framework for automated test systems (ATS) with pipeline-based architecture, context management, database integration, and server API support.

**Version:** 0.1.0  
**Author:** Alex Zvuluny  
**Email:** alex.639hz@gmail.com

---

## Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
  - [Option 1: From Local Wheel (Offline)](#option-1-from-local-wheel-offline)
  - [Option 2: From PyPI (Online)](#option-2-from-pypi-online)
  - [Option 3: Development Install](#option-3-development-install)
- [Usage](#usage)
- [Features](#features)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [Publishing to PyPI](#publishing-to-pypi)
- [License](#license)

---

## Quick Start

```python
from engine.framework import Framework

# Create a framework instance
framework = Framework()
print("Framework initialized successfully!")
```

---

## Installation

### Option 1: From Local Wheel (Offline)

This is the recommended method for testing before uploading to PyPI. Use the pre-built wheel file in the `dist/` folder.

#### Step 1: Locate the wheel file
```
C:\ats_py_package\dist\engine-0.1.0-py3-none-any.whl
```

#### Step 2: Install using pip
```bash
# Create a virtual environment (recommended)
python -m venv venv
source venv/Scripts/activate  # On Windows
# OR
source venv/bin/activate  # On macOS/Linux

# Install the wheel
pip install dist/engine-0.1.0-py3-none-any.whl
```

#### Step 3: Verify installation
```bash
python -c "from engine.framework import Framework; print('Success!')"
```

---

### Option 2: From PyPI (Online)

Once the package is published to PyPI, install it directly:

```bash
pip install engine
```

**Note:** As of October 2026, the package is not yet on PyPI. See [Publishing to PyPI](#publishing-to-pypi) section for upload instructions.

---

### Option 3: Development Install

For development or contributing to the engine, install in editable mode:

```bash
# Clone or navigate to the package directory
cd C:\ats_py_package

# Create virtual environment
python -m venv venv
source venv/Scripts/activate

# Install in editable mode
pip install -e .

# Install development dependencies (optional)
pip install pytest pytest-mock
```

This allows you to modify the source code and see changes immediately without reinstalling.

---

## Usage

### Basic Framework Initialization

```python
from engine.framework import Framework

# Create framework instance
fw = Framework()

# Access core components
context = fw.context
database = fw.db
server = fw.server

# The framework runs on separate threads:
# - engine_thread: Main processing pipeline
# - engine_timer: Timer-based operations
# - log_listener: Logging pipeline

print(f"Framework initialized with {len(fw._procedure_list)} procedures")
```

### Working with Procedures

```python
from engine.framework import Framework
from engine.procedure import Procedure

fw = Framework()

# Procedures can be added and executed
# See engine.procedure module for detailed documentation
```

### Server API

```python
# The framework includes a FastAPI-based server
# Access at configured host and port
server = fw.server
```

### Database Operations

```python
from engine.db import database

# MongoDB integration for data persistence
# Configure connection details in your project
```

### Logging

```python
import logging

# Logger is automatically configured
logger = logging.getLogger("[your_module]")
logger.info("Message here")
```

---

## Features

✅ **Pipeline-based Architecture** - Efficient queue-based message passing  
✅ **Async Context Management** - Thread-safe state management  
✅ **Database Integration** - MongoDB support with engine.db  
✅ **Server API** - Built-in FastAPI server for HTTP endpoints  
✅ **Logging System** - Structured logging with queue-based handler  
✅ **Procedure Execution** - Framework for running test procedures  
✅ **Step Functions** - Rich step execution and manipulation  
✅ **Worker Threads** - Multi-threaded execution support  
✅ **Type Safety** - Full type hints throughout  
✅ **Constants & Utils** - Pre-built utilities for common operations  

---

## Project Structure

```
C:\ats_py_package\
│
├── engine/                              # Main package folder
│   ├── __init__.py                     # Package initialization
│   ├── framework.py                    # Core Framework class
│   ├── procedure.py                    # Procedure execution
│   ├── context.py                      # Context management
│   ├── pipeline.py                     # Message pipeline
│   ├── step.py                         # Step definitions
│   ├── step_functions.py               # Step operations
│   ├── procedure_builder.py            # Builder for procedures
│   ├── worker.py                       # Worker thread management
│   ├── constants.py                    # Global constants
│   ├── types.py                        # Type definitions
│   ├── utils.py                        # Utility functions
│   ├── logger.py                       # Logging setup
│   ├── db.py                           # Database connection
│   ├── json.py                         # JSON utilities
│   └── server/                         # FastAPI server
│       ├── __init__.py
│       ├── server_main.py              # Server initialization
│       ├── server_api.py               # API endpoints
│       ├── server_utils.py             # Server utilities
│       └── routes/
│           └── routes_general.py       # General routes
│
├── dist/                               # Built distribution files
│   └── engine-0.1.0-py3-none-any.whl  # Ready-to-install wheel
│
├── pyproject.toml                      # Package configuration
├── README.md                           # This file
├── LICENSE                             # License file (optional)
└── docs/                               # Documentation (optional)
```

---

## Configuration

### Dependencies in pyproject.toml

The package requires the following dependencies:

```
annotated-doc==0.0.4
annotated-types==0.7.0
anyio==4.13.0
certifi==2026.4.22
click==8.3.1
colorama==0.4.6
dnspython==2.8.0
fastapi==0.135.3
h11==0.16.0
httpcore==1.0.9
httpx==0.28.1
idna==3.11
iniconfig==2.3.0
numpy==2.4.4
packaging==26.2
pluggy==1.6.0
pydantic==2.12.5
pydantic_core==2.41.5
Pygments==2.20.0
pymongo==4.17.0
pytest==9.0.3
pytest-mock==3.15.1
PyVISA==1.16.2
starlette==1.0.0
typing-inspection==0.4.2
typing_extensions==4.15.0
uvicorn==0.42.0
```

These are automatically installed when you install the package.

---

## Troubleshooting

### Issue: "ModuleNotFoundError: No module named 'engine'"

**Solution:** Ensure the package is properly installed:
```bash
pip list | grep engine
```

If not listed, reinstall:
```bash
pip install dist/engine-0.1.0-py3-none-any.whl
```

### Issue: Dependency conflicts

**Solution:** Create a fresh virtual environment:
```bash
python -m venv venv_clean
source venv_clean/Scripts/activate
pip install dist/engine-0.1.0-py3-none-any.whl
```

### Issue: Port already in use (Server)

**Solution:** The server uses a configurable port. Check `engine/server/server_main.py` to modify the port configuration.

### Issue: Database connection errors

**Solution:** Verify MongoDB is running and connection string is correct in `engine/db.py`.

---

## Publishing to PyPI

### Prerequisites

1. Create an account at [pypi.org](https://pypi.org)
2. Install twine:
   ```bash
   pip install twine
   ```

### Publishing Steps

1. **Prepare your credentials** (optional but recommended - use token authentication):
   ```bash
   # Create ~/.pypirc with:
   [distutils]
   index-servers =
       pypi
       testpypi

   [pypi]
   repository = https://upload.pypi.org/legacy/
   username = __token__
   password = pypi-YOUR_TOKEN_HERE

   [testpypi]
   repository = https://test.pypi.org/legacy/
   username = __token__
   password = pypi-YOUR_TOKEN_HERE
   ```

2. **Test upload to TestPyPI** (recommended first step):
   ```bash
   twine upload --repository testpypi dist/engine-0.1.0-py3-none-any.whl
   ```

3. **Upload to PyPI**:
   ```bash
   twine upload dist/engine-0.1.0-py3-none-any.whl
   ```

4. **Verify upload**:
   ```bash
   pip install engine  # Install from PyPI
   ```

### Updating the package

After making changes:

1. Update version in `pyproject.toml`
2. Rebuild: `python -m build --wheel`
3. Upload new version to PyPI

---

## Development

### Running Tests

```bash
# Install development dependencies
pip install pytest pytest-mock

# Run tests
pytest engine/
```

### Building from Source

```bash
# Install build tools
pip install build

# Build wheel and source distribution
python -m build

# Files will be in dist/ folder
ls dist/
```

---

## Module Reference

### Core Modules

| Module | Purpose |
|--------|---------|
| `framework.py` | Main Framework class - orchestrates all components |
| `procedure.py` | Procedure execution and management |
| `context.py` | Thread-safe context for sharing state |
| `pipeline.py` | Queue-based message pipeline |
| `step.py` | Step definitions and execution |
| `worker.py` | Worker thread management |
| `server/` | FastAPI server and HTTP API |
| `logger.py` | Logging configuration and setup |
| `db.py` | Database (MongoDB) integration |
| `constants.py` | Global constants and configuration |
| `utils.py` | Utility functions and helpers |

---

## License

MIT License - See LICENSE file for details

---

## Support

For issues, questions, or contributions:
- **Email:** alex.639hz@gmail.com
- **Repository:** (Add your GitHub URL here)

---

## Changelog

### Version 0.1.0 (Oct 8, 2026)
- Initial release
- Core framework with pipeline architecture
- Server API support
- Database integration
- Comprehensive logging system
- Multi-threaded execution support

---

**Last Updated:** October 8, 2026
