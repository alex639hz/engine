# Deploy Engine to PyPI

Complete guide to publish your engine package to Python Package Index (PyPI).

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step-by-Step Deployment](#step-by-step-deployment)
3. [Testing on TestPyPI](#testing-on-testpypi)
4. [Publishing to PyPI](#publishing-to-pypi)
5. [Post-Publication](#post-publication)
6. [Updating Versions](#updating-versions)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### 1. PyPI Account

Create a free account at https://pypi.org/account/register/

**Save your credentials:**
- Username
- Password
- (Or API token - recommended)

### 2. Install Required Tools

```bash
pip install twine build
```

### 3. Verify Package Contents

```bash
# Check that wheel file exists
ls -la dist/engine-0.1.0-py3-none-any.whl  # Windows: dir dist\
```

---

## Step-by-Step Deployment

### Step 1: Create PyPI API Token (Recommended)

1. Go to https://pypi.org/account/
2. Click "Account settings"
3. Scroll to "API tokens"
4. Click "Create token"
5. Name it: `engine-package`
6. Scope: Entire account
7. Copy the token (starts with `pypi-`)

### Step 2: Configure Credentials

#### Option A: Using ~/.pypirc (Recommended)

Create file `~/.pypirc`:

```ini
[distutils]
index-servers =
    pypi
    testpypi

[pypi]
repository = https://upload.pypi.org/legacy/
username = __token__
password = pypi-YOUR_FULL_TOKEN_HERE

[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = pypi-YOUR_TEST_TOKEN_HERE
```

**Important:**
- Replace `YOUR_FULL_TOKEN_HERE` with your actual token from https://pypi.org/account/
- Use `__token__` as username (literal string)
- Save with proper permissions:
  ```bash
  chmod 600 ~/.pypirc  # On macOS/Linux
  ```

#### Option B: Environment Variables

```bash
# Windows (Command Prompt)
set TWINE_USERNAME=__token__
set TWINE_PASSWORD=pypi-YOUR_TOKEN_HERE

# macOS/Linux (Bash)
export TWINE_USERNAME=__token__
export TWINE_PASSWORD=pypi-YOUR_TOKEN_HERE
```

#### Option C: Command Line (Not Recommended)

```bash
twine upload dist/engine-0.1.0-py3-none-any.whl \
    --username __token__ \
    --password pypi-YOUR_TOKEN_HERE
```

### Step 3: Verify Wheel Contents

```bash
# List contents of wheel
unzip -l dist/engine-0.1.0-py3-none-any.whl

# Or use wheel CLI
pip install wheel
wheel unpack dist/engine-0.1.0-py3-none-any.whl
```

Expected structure:
```
engine/
  __init__.py
  framework.py
  procedure.py
  ... (all modules)
  server/
    __init__.py
    server_main.py
    ... (server modules)

engine-0.1.0.dist-info/
  METADATA
  WHEEL
  RECORD
```

---

## Testing on TestPyPI

**HIGHLY RECOMMENDED** - Test your package before publishing to PyPI!

### Test Step 1: Create TestPyPI Account

1. Go to https://test.pypi.org/account/register/
2. Create account
3. Generate API token (same process as PyPI)

### Test Step 2: Upload to TestPyPI

```bash
twine upload --repository testpypi dist/engine-0.1.0-py3-none-any.whl
```

**Output:**
```
Uploading distributions to https://test.pypi.org/legacy/
Uploading engine-0.1.0-py3-none-any.whl
100% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 20.1/20.1 kB • 00:02
```

### Test Step 3: Verify TestPyPI Package

Visit: https://test.pypi.org/project/engine/

### Test Step 4: Install from TestPyPI

```bash
# Create test environment
python -m venv test_env
source test_env/Scripts/activate  # Windows: test_env\Scripts\activate

# Install from TestPyPI
pip install -i https://test.pypi.org/simple/ engine

# Test import
python -c "from engine.framework import Framework; print('Success!')"
```

### Test Step 5: Fix Any Issues

If tests fail:
1. Fix the issue
2. Update version in `pyproject.toml`
3. Rebuild: `python -m build --wheel`
4. Re-test on TestPyPI

---

## Publishing to PyPI

### Production Step 1: Final Checks

```bash
# Verify version in pyproject.toml
grep "version" pyproject.toml

# Check that dist folder exists
ls dist/

# Verify wheel file size is reasonable (10-50 KB for this package)
ls -lh dist/engine-0.1.0-py3-none-any.whl
```

### Production Step 2: Upload to PyPI

```bash
twine upload dist/engine-0.1.0-py3-none-any.whl
```

**Expected output:**
```
Uploading distributions to https://upload.pypi.org/legacy/
Uploading engine-0.1.0-py3-none-any.whl
100% ━━━━━━━━━━━━━━━━━ 20.1/20.1 kB • 00:03

View at:
https://pypi.org/project/engine/
```

### Production Step 3: Verify PyPI Package

Visit: https://pypi.org/project/engine/

Check that:
- ✅ Package name is correct
- ✅ Version is correct
- ✅ Description is visible
- ✅ README is displayed
- ✅ Metadata is complete

### Production Step 4: Install from PyPI

```bash
# Create new test environment
python -m venv final_test
source final_test/Scripts/activate

# Install from PyPI
pip install engine

# Verify
python -c "from engine.framework import Framework; print('PyPI install successful!')"
```

---

## Post-Publication

### Announce Your Package

1. **GitHub:** Add a release tag
   ```bash
   git tag v0.1.0
   git push origin v0.1.0
   ```

2. **GitHub Release:** Create release on GitHub with:
   - Tag: `v0.1.0`
   - Title: `Engine 0.1.0`
   - Description: What's new, changes, features

3. **Social Media:** Announce the release

4. **Documentation:** Update links if they point to `dist/` files

---

## Updating Versions

### For Patch Update (0.1.0 → 0.1.1)

**Step 1:** Update `pyproject.toml`
```toml
version = "0.1.1"
```

**Step 2:** Rebuild
```bash
python -m build --wheel
```

**Step 3:** Upload
```bash
twine upload dist/engine-0.1.1-py3-none-any.whl
```

### For Minor Update (0.1.0 → 0.2.0)

Same process, update version to `0.2.0`

### For Major Update (0.1.0 → 1.0.0)

Same process, update version to `1.0.0`

---

## Troubleshooting

### Error: "401 Unauthorized"

**Cause:** Invalid credentials or token

**Solution:**
1. Check PyPI credentials in `~/.pypirc`
2. Verify API token hasn't expired: https://pypi.org/account/
3. Generate new token if needed

### Error: "File already exists"

**Cause:** Trying to upload same version twice

**Solution:**
```bash
# Increment version in pyproject.toml
# Rebuild
python -m build --wheel

# Re-upload with new version
twine upload dist/engine-0.1.1-py3-none-any.whl
```

### Error: "Invalid distribution"

**Cause:** Corrupted wheel file

**Solution:**
1. Delete `dist/` folder
2. Rebuild: `python -m build --wheel`
3. Re-upload

### Error: "SSL certificate problem"

**Cause:** Network/SSL issue

**Solution:**
```bash
# Upgrade certifi
pip install --upgrade certifi

# Try upload again
twine upload dist/engine-0.1.0-py3-none-any.whl
```

### Error: "twine not found"

**Cause:** twine not installed

**Solution:**
```bash
pip install twine
```

### Package appears on PyPI but pip install fails

**Cause:** Indexing delay (usually 5-10 minutes)

**Solution:**
```bash
# Wait a few minutes, then try again
pip install engine  # (with --upgrade flag if needed)
```

---

## Security Best Practices

1. **Use API Token** instead of password
2. **Never commit credentials** to Git
3. **Store credentials securely** in `~/.pypirc` with `chmod 600`
4. **Use environment variables** in CI/CD
5. **Regenerate tokens periodically**
6. **Delete old test tokens** from PyPI

---

## Continuous Integration (CI/CD)

### GitHub Actions Example

Create `.github/workflows/publish.yml`:

```yaml
name: Publish to PyPI

on:
  push:
    tags:
      - v*

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.11'
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install build twine
    - name: Build distribution
      run: python -m build
    - name: Publish to PyPI
      env:
        TWINE_USERNAME: __token__
        TWINE_PASSWORD: ${{ secrets.PYPI_TOKEN }}
      run: twine upload dist/*
```

---

## Checklist

Before publishing:

- [ ] Version updated in `pyproject.toml`
- [ ] Wheel built successfully
- [ ] Tested on TestPyPI
- [ ] All imports working
- [ ] README.md complete and displays correctly
- [ ] All dependencies listed in `pyproject.toml`
- [ ] License file included (optional)
- [ ] API token configured in `~/.pypirc` or env vars
- [ ] No sensitive information in code
- [ ] No large binary files included

---

## Reference

- **PyPI:** https://pypi.org
- **TestPyPI:** https://test.pypi.org
- **Twine Documentation:** https://twine.readthedocs.io
- **PEP 517 (Build):** https://www.python.org/dev/peps/pep-0517/

---

## Support

- **Issues:** Check PyPI project page
- **Questions:** Email alex.639hz@gmail.com
- **Documentation:** See README.md

---

**Version:** 0.1.0  
**Last Updated:** October 8, 2026

Happy packaging! 🎉
