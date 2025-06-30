# 🚀 Nova Solve Launch Checklist - Ship Tonight!

## ⏰ Time Estimate: 45-60 minutes total

---

## Phase 1: GitHub Setup (10 min)

### Step 1: Create GitHub Repositories
1. Go to https://github.com/novasolve
2. Create **3 repositories**:

   a) **novasolve.github.io** (PUBLIC)
   - Click "New repository"
   - Name: `novasolve.github.io`
   - Description: "Nova Solve - AI-powered test fixing"
   - Public
   - DO NOT initialize with README
   - Create repository

   b) **homebrew-novasolve** (PUBLIC)
   - Click "New repository"
   - Name: `homebrew-novasolve`
   - Description: "Homebrew tap for Nova Solve"
   - Public
   - DO NOT initialize with README
   - Create repository

   c) **nova** (PRIVATE)
   - Click "New repository"
   - Name: `nova`
   - Description: "Nova Solve source code"
   - **PRIVATE** ← Important!
   - Initialize WITH README
   - Create repository

### Step 2: Push Landing Page
```bash
cd ~/novasolve-launch
./push_to_github.sh
```

### Step 3: Enable GitHub Pages
1. Go to https://github.com/novasolve/novasolve.github.io/settings/pages
2. Source: Deploy from a branch
3. Branch: main
4. Folder: / (root)
5. Save

✅ **Check**: Visit https://novasolve.github.io - should see your landing page!

---

## Phase 2: Prepare Your Nova Binary (15 min)

### Step 4: Build Your Binary
```bash
# Go to your nova source code directory
cd ~/board  # or wherever your code is

# Create distribution directory
mkdir -p ~/novasolve-launch/dist

# If using Python, create standalone executable:
pip install pyinstaller
pyinstaller --onefile --name nova nova_cli.py

# Or if you already have a working binary:
cp nova ~/novasolve-launch/dist/nova
```

### Step 5: Test Binary Works
```bash
cd ~/novasolve-launch/dist
./nova --version
# Should output: Nova Solve v1.0.0 (or similar)
```

### Step 6: Create Release Archives
```bash
cd ~/novasolve-launch/dist

# For ARM64 Macs (M1/M2)
tar -czf nova-1.0.0-arm64.tar.gz nova
shasum -a 256 nova-1.0.0-arm64.tar.gz > nova-1.0.0-arm64.sha256

# If you have Intel Mac or can cross-compile:
# tar -czf nova-1.0.0-x86_64.tar.gz nova
# shasum -a 256 nova-1.0.0-x86_64.tar.gz > nova-1.0.0-x86_64.sha256
```

---

## Phase 3: Create GitHub Release (10 min)

### Step 7: Create Release
1. Go to https://github.com/novasolve/homebrew-novasolve/releases/new
2. Click "Choose a tag" → Type `v1.0.0` → Create new tag
3. Release title: `Nova Solve v1.0.0`
4. Description:
   ```
   ## 🎉 First Release!
   
   Nova Solve - AI-powered Python test fixing
   
   ### Installation
   ```
   brew install novasolve/novasolve/nova
   ```
   
   ### Features
   - Automatically detects failing tests
   - Generates AI-powered fixes
   - Simple CLI interface
   ```
5. Attach binaries:
   - Drag `nova-1.0.0-arm64.tar.gz`
   - Drag `nova-1.0.0-x86_64.tar.gz` (if you have it)
6. ✅ Publish release

### Step 8: Get SHA256 for Formula
```bash
# Copy the SHA256 hash
cat ~/novasolve-launch/dist/nova-1.0.0-arm64.sha256
# Example: a1b2c3d4e5f6... (copy this!)
```

---

## Phase 4: Setup Homebrew Tap (10 min)

### Step 9: Clone Homebrew Repo
```bash
cd ~/novasolve-launch
git clone https://github.com/novasolve/homebrew-novasolve.git
cd homebrew-novasolve
```

### Step 10: Create Formula
```bash
mkdir -p Formula
cp ../nova_binary_formula.rb Formula/nova.rb
```

### Step 11: Update Formula with SHA256
Edit `Formula/nova.rb`:
- Replace `YOUR_SHA256_HERE` with actual SHA256 from Step 8
- If only ARM64, remove the Intel section

### Step 12: Push Formula
```bash
git add Formula/nova.rb
git commit -m "Add Nova Solve formula v1.0.0"
git push origin main
```

---

## Phase 5: Test Installation (5 min)

### Step 13: Test Homebrew Install
```bash
# Add your tap
brew tap novasolve/novasolve

# Install nova
brew install novasolve/novasolve/nova

# Test it works
nova --version
```

---

## Phase 6: Final Launch Steps (5 min)

### Step 14: Update Landing Page
If needed, update the install command on your landing page to remove "Coming tonight!"

### Step 15: Announce! 🎉
- Twitter/X
- Hacker News
- Reddit r/Python
- Your network

---

## 🚨 Troubleshooting

**"Formula not found"**
- Wait 2-3 minutes for GitHub to update
- Try `brew update` then retry

**"SHA256 mismatch"**
- Rerun `shasum -a 256` on your tar.gz file
- Update formula with correct hash

**"Binary doesn't run"**
- Make sure binary is executable: `chmod +x nova`
- Test locally before packaging

---

## ✅ Success Checklist
- [ ] Landing page live at novasolve.github.io
- [ ] Binary uploaded to GitHub releases
- [ ] Formula pushed to homebrew-novasolve
- [ ] `brew install novasolve/novasolve/nova` works
- [ ] joinnova.com will work once DNS propagates

---

## 🎯 You're Done!
People can now install Nova Solve with:
```bash
brew install novasolve/novasolve/nova
```

Ship it! 🚀 