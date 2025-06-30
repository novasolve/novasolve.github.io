#!/bin/bash
# Test Nova locally without GitHub release

echo "🚀 Testing Nova Solve locally..."
echo ""

# Install directly from local file
echo "📦 Installing nova binary..."
sudo cp dist/nova /usr/local/bin/nova
sudo chmod +x /usr/local/bin/nova

echo "✅ Nova installed!"
echo ""

# Test it
echo "🧪 Testing nova command..."
nova --help

echo ""
echo "🎯 Try it out:"
echo "  nova solve test_file.py"
echo "  nova health"
echo "  nova analyze test_file.py" 