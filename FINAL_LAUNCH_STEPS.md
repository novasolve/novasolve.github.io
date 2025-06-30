# 🚀 Nova Solve - Final Launch Steps

## ✅ Status Check
- [x] Landing page live at https://novasolve.github.io
- [x] Binary built and packaged
- [x] GitHub release created with binary
- [x] Homebrew formula updated
- [ ] Test installation
- [ ] Remove placeholder text from landing page
- [ ] Launch!

---

## 📋 Step-by-Step Instructions

### 1. Test Homebrew Installation (2 minutes)

Open a new terminal and run these commands exactly:

```bash
# Add the tap
brew tap novasolve/novasolve

# Install nova
brew install novasolve/novasolve/nova

# Test it works
nova --help
```

If you see the Nova help message, it's working! ✅

### 2. Fix Landing Page Quote (1 minute)

The landing page has a stray quote at the bottom. Let's remove it:

```bash
cd /Users/sebheyneman/novasolve-launch

# Open the file and remove the quote at the very bottom
# Look for a single " character near the end and delete it
```

I'll fix it for you right now...

### 3. Create a Demo Test File (2 minutes)

Create a simple test to demonstrate Nova:

```bash
cd ~
mkdir nova-demo
cd nova-demo

# Create a broken test
cat > test_math.py << 'EOF'
def add(a, b):
    return a - b  # Bug: should be addition

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
EOF

# Test Nova on it
nova solve test_math.py
```

### 4. Update DNS for joinnova.com (5 minutes)

1. Log into your domain registrar (GoDaddy/Namecheap/etc)
2. Add these DNS records:
   - Type: A
   - Name: @ (or leave blank)
   - Value: 185.199.108.153
   - TTL: 600

   Add all 4 GitHub Pages IPs:
   - 185.199.108.153
   - 185.199.109.153
   - 185.199.110.153
   - 185.199.111.153

3. Add CNAME record:
   - Type: CNAME
   - Name: www
   - Value: novasolve.github.io
   - TTL: 600

### 5. Configure GitHub Pages Custom Domain (2 minutes)

1. Go to https://github.com/novasolve/novasolve.github.io/settings/pages
2. Under "Custom domain", enter: joinnova.com
3. Click Save
4. Check "Enforce HTTPS" (may take a few minutes to be available)

### 6. Final Checklist

- [ ] `brew install novasolve/novasolve/nova` works
- [ ] `nova solve test_math.py` fixes the test
- [ ] https://novasolve.github.io looks perfect
- [ ] joinnova.com redirects to your site (after DNS propagates)

---

## 🎉 Launch Announcement Template

Once everything is working:

**Twitter/X:**
```
🚀 Launching Nova Solve - AI-powered test fixing for Python

Fix any failing test with one command:
nova solve test_file.py

✨ Pattern recognition for instant fixes
🧠 Multiple AI models (GPT-4o, O3-Pro)
⚡ Faster than debugging yourself

Install now:
brew install novasolve/novasolve/nova

joinnova.com
```

**Hacker News:**
```
Show HN: Nova Solve – AI-powered Python test fixing

I built Nova Solve to automatically fix failing Python tests using AI. It analyzes test failures, understands the root cause, and generates fixes that actually work.

Key features:
- One command: nova solve test_file.py
- Smart pattern matching for common bugs
- Fallback to powerful AI models when needed
- Works with pytest and unittest

Install with: brew install novasolve/novasolve/nova

Landing page: https://joinnova.com
GitHub: https://github.com/novasolve/nova

Would love feedback from the community!
```

---

## 🚨 If Something Goes Wrong

**Homebrew not working?**
```bash
# Force refresh
brew update
brew tap --repair novasolve/novasolve
```

**Binary not executing?**
```bash
# Check permissions
ls -la $(which nova)
# Should show -rwxr-xr-x

# If not, fix it:
chmod +x $(which nova)
```

**DNS not propagating?**
- It can take 1-48 hours
- Check status at: https://dnschecker.org/#A/joinnova.com

---

## 🎯 You're 10 minutes away from launch!

Just follow the steps above in order. The hardest part (building everything) is already done! 