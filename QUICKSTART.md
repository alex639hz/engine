# Engine - Quick Start Guide

Get up and running with the Engine framework in 5 minutes!

---

## Installation (2 minutes)

### Option A: Windows Command Prompt

```batch
# Create virtual environment
python -m venv venv
venv\Scripts\activate

# Install the package
pip install dist/engine-0.1.0-py3-none-any.whl

# Verify installation
python -c "from engine.framework import Framework; print('Ready!')"
```

### Option B: macOS/Linux Terminal

```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install the package
pip install dist/engine-0.1.0-py3-none-any.whl

# Verify installation
python -c "from engine.framework import Framework; print('Ready!')"
```

---

## Your First Framework Program (3 minutes)

Create a file named `first_app.py`:

```python
from engine.framework import Framework

# Initialize the framework
fw = Framework()
print("✓ Framework initialized successfully!")

# Access components
print(f"Context: {fw.context}")
print(f"Database: {fw.db}")
print(f"Server: {fw.server}")

# Access core properties
print(f"Procedures: {len(fw._procedure_list)}")
print(f"Framework running on separate threads")
```

Run it:

```bash
python first_app.py
```

Expected output:
```
✓ Framework initialized successfully!
Context: <engine.context.Context object at 0x...>
Database: <pymongo.mongo_client.MongoClient object at 0x...>
Server: <engine.server.server_main.Server object at 0x...>
Procedures: 0
Framework running on separate threads
```

---

## Core Components Overview

### 1. Framework
The main class that orchestrates everything:

```python
from engine.framework import Framework

fw = Framework()
```

### 2. Context
Thread-safe state management:

```python
context = fw.context
# Use context to store/retrieve shared data
```

### 3. Database
MongoDB integration:

```python
db = fw.db
# Use for data persistence
```

### 4. Server
FastAPI-based HTTP server:

```python
server = fw.server
# Provides REST API endpoints
```

### 5. Logging
Built-in logging system:

```python
import logging
logger = logging.getLogger("[my_module]")
logger.info("Something happened")
```

---

## Common Tasks

### Task 1: Create a Procedure

```python
from engine.framework import Framework
from engine.procedure import Procedure

fw = Framework()

# Create a procedure (see engine.procedure for details)
procedure = Procedure()

# Add to framework
fw._procedure_list.append(procedure)
```

### Task 2: Use the Pipeline

```python
from engine.pipeline import Pipeline

# Create a pipeline
pipe = Pipeline(queue_size=1000, name="my_pipe")

# Put data in
pipe.put_pipe("some_data")

# Get data out
data = pipe.get_pipe()
```

### Task 3: Work with Context

```python
from engine.context import Context

fw = Framework()
context = fw.context

# Store values
context.set("key", "value")

# Retrieve values
value = context.get("key")
```

### Task 4: Use Utils

```python
from engine.utils import Utils

# Thread management
thread = Utils.thread_define("MyThread", target_function)

# Other utilities available
```

### Task 5: Access Constants

```python
from engine.constants import *

# All constants defined in engine.constants are available
```

---

## Project Structure in Your Code

Create a folder structure for your project:

```
my_test_project/
├── venv/                    # Virtual environment
├── config/
│   ├── __init__.py
│   └── settings.py          # Configuration settings
├── tests/
│   ├── __init__.py
│   └── test_basic.py        # Your tests
├── src/
│   ├── __init__.py
│   ├── main.py              # Entry point
│   └── components/
│       ├── __init__.py
│       └── my_procedures.py # Custom procedures
└── requirements.txt         # Additional dependencies
```

### Example: main.py

```python
from engine.framework import Framework
import logging

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def main():
    # Initialize framework
    fw = Framework()
    logger.info("Framework initialized")
    
    # Add your custom logic here
    
    # Keep framework running
    try:
        fw.engine_thread.join()
    except KeyboardInterrupt:
        logger.info("Shutting down...")
        fw.event_shutdown.set()

if __name__ == "__main__":
    main()
```

---

## Testing Your Installation

### Test 1: Import Check

```bash
python -c "import engine; print(f'Engine installed at: {engine.__file__}')"
```

### Test 2: Framework Creation

```bash
python -c "from engine.framework import Framework; fw = Framework(); print('Framework OK')"
```

### Test 3: Module Check

```python
# Run this as a Python script
from engine import framework, procedure, context, pipeline, db, logger

modules = [framework, procedure, context, pipeline, db, logger]
print(f"✓ All {len(modules)} modules loaded successfully")
```

---

## Next Steps

1. **Read the main README** for detailed documentation
2. **Check INSTALL.md** for installation troubleshooting
3. **Explore the engine folder** to understand the codebase
4. **Build your test procedures** using the framework
5. **Configure the database** for your specific use case

---

## Troubleshooting

### ImportError: No module named 'engine'

Make sure you:
1. Activated the virtual environment
2. Installed the package: `pip install dist/engine-0.1.0-py3-none-any.whl`
3. Check: `pip list | grep engine`

### Module 'XXX' not found

Install missing dependencies:
```bash
pip install -r requirements.txt
```

Or install all at once:
```bash
pip install dist/engine-0.1.0-py3-none-any.whl
```

---

## Useful Commands

```bash
# Activate virtual environment
source venv/Scripts/activate          # Windows
source venv/bin/activate             # macOS/Linux

# List installed packages
pip list

# Check engine installation
pip show engine

# Uninstall package
pip uninstall engine

# Upgrade package
pip install --upgrade dist/engine-0.1.0-py3-none-any.whl

# Run Python REPL
python

# Run a script
python your_script.py

# Deactivate virtual environment
deactivate
```

---

## API Quick Reference

### Framework Methods

```python
fw = Framework()

# Properties
fw.context          # Context object for state management
fw.db              # MongoDB database connection
fw.server          # FastAPI server instance
fw.pipe_eng        # Main engine pipeline
fw.pipe_timer      # Timer pipeline
fw.pipe_log        # Logging pipeline

# Procedures
fw._procedure_list   # List of procedures
fw._procedure_dict   # Dictionary of procedures

# Control
fw.event_shutdown    # Threading event for shutdown
fw.engine_thread     # Main engine thread
fw.engine_timer      # Timer thread
```

### Logging

```python
import logging

# Get logger
logger = logging.getLogger("[module_name]")

# Log levels
logger.debug("Debug message")
logger.info("Info message")
logger.warning("Warning message")
logger.error("Error message")
logger.critical("Critical message")
```

### Pipeline

```python
from engine.pipeline import Pipeline

# Create pipeline
pipe = Pipeline(queue_size=1000000, name="my_pipeline")

# Operations
pipe.put_pipe(data)      # Add data
pipe.get_pipe()          # Get data
```

---

## Resources

- **Official Docs:** See README.md
- **Installation Help:** See INSTALL.md
- **Module Reference:** engine/
- **Author:** alex.639hz@gmail.com

---

**Version:** 0.1.0  
**Last Updated:** October 8, 2026

Ready to build something amazing with Engine! 🚀
