@echo off
REM Package Rebuild Script for Windows
REM Rebuilds the distribution wheel

echo.
echo ========================================
echo Engine Package - Rebuild Script
echo ========================================
echo.

REM Check if we're in the right directory
if not exist "pyproject.toml" (
    echo ERROR: pyproject.toml not found
    echo Make sure you run this from the project root directory
    pause
    exit /b 1
)

REM Activate virtual environment if it exists
if exist venv (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo WARNING: Virtual environment not found
    echo You may need to run setup_dev.bat first
)
echo.

REM Install/update build tools
echo Step 1: Installing build tools...
pip install --upgrade build setuptools wheel >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Failed to install build tools
) else (
    echo [OK] Build tools ready
)
echo.

REM Clean old builds (optional)
echo Step 2: Cleaning old builds...
if exist build (
    rmdir /s /q build >nul 2>&1
    echo [OK] Removed build/ directory
) else (
    echo [SKIP] No build/ directory to clean
)

if exist dist (
    echo [OK] dist/ directory exists (will be updated)
) else (
    echo [CREATE] dist/ directory will be created
)
echo.

REM Build the package
echo Step 3: Building package...
python -m build
if errorlevel 1 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)
echo [OK] Build successful
echo.

REM Verify build output
echo Step 4: Verifying build output...
if exist "dist\engine-0.1.0-py3-none-any.whl" (
    echo [OK] Found: dist/engine-0.1.0-py3-none-any.whl
) else (
    echo [ERROR] Wheel file not found!
    pause
    exit /b 1
)

if exist "dist\engine-0.1.0.tar.gz" (
    echo [OK] Found: dist/engine-0.1.0.tar.gz
) else (
    echo [WARNING] Source distribution not found
)
echo.

REM Show file sizes
echo Step 5: Build artifacts:
dir dist\*.whl
echo.

echo ========================================
echo Rebuild Complete!
echo ========================================
echo.
echo Your package has been rebuilt successfully!
echo.
echo Location: dist/engine-0.1.0-py3-none-any.whl
echo.
echo You can now:
echo   - Install it: pip install dist/engine-0.1.0-py3-none-any.whl
echo   - Test it: (see instructions in QUICK_DEV_REFERENCE.md)
echo   - Share it: dist/engine-0.1.0-py3-none-any.whl
echo   - Upload to PyPI: twine upload dist/*
echo.
pause
