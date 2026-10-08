@echo off
REM Development Environment Setup Script for Windows
REM Run this script once to set up your development environment

echo.
echo ========================================
echo Engine Package - Development Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.9+ from python.org
    pause
    exit /b 1
)

echo Step 1: Checking Python version...
python --version
echo [OK] Python is installed
echo.

REM Create virtual environment
echo Step 2: Creating virtual environment...
if exist venv (
    echo [SKIP] Virtual environment already exists
) else (
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment
        pause
        exit /b 1
    )
    echo [OK] Virtual environment created
)
echo.

REM Activate virtual environment
echo Step 3: Activating virtual environment...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo [ERROR] Failed to activate virtual environment
    pause
    exit /b 1
)
echo [OK] Virtual environment activated
echo.

REM Upgrade pip
echo Step 4: Upgrading pip...
python -m pip install --upgrade pip >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Failed to upgrade pip (continuing anyway)
) else (
    echo [OK] pip upgraded
)
echo.

REM Install in editable mode
echo Step 5: Installing package in editable mode...
pip install -e . >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed to install package
    pause
    exit /b 1
)
echo [OK] Package installed in editable mode
echo.

REM Verify installation
echo Step 6: Verifying installation...
python -c "from engine.framework import Framework; print('[OK] Framework imported successfully')" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Framework import failed
    pause
    exit /b 1
)
echo.

REM Optional: Install dev tools
echo Step 7: Would you like to install development tools? (pytest, black, flake8, mypy)
set /p install_dev="Enter Y for yes, N for no (default N): "
if /i "%install_dev%"=="Y" (
    echo Installing development tools...
    pip install pytest pytest-mock black flake8 mypy >nul 2>&1
    echo [OK] Development tools installed
) else (
    echo [SKIP] Development tools not installed (you can install later with: pip install pytest black flake8 mypy)
)
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Your development environment is ready to use.
echo.
echo Next steps:
echo   1. Make changes to files in the engine/ folder
echo   2. Test with: python test_file.py
echo   3. Run main: python main.py
echo   4. Rebuild when ready: python -m build
echo.
echo For more information, see DEVELOPMENT.md
echo.
pause
