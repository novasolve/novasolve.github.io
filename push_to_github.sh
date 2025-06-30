#!/bin/bash

echo "🚀 Pushing Nova Solve landing page to GitHub..."

git remote add origin https://github.com/novasolve/novasolve.github.io.git
git branch -M main
git push -u origin main

echo "✅ Done! Your site will be live at:"
echo "   https://novasolve.github.io (in a few minutes)"
echo "   https://joinnova.com (once DNS propagates)" 