#!/bin/bash
# Build script for Connect IQ Store (.iq files)

echo "🏗️  Building for Connect IQ Store..."

# Set SDK path
export PATH="/Users/travinov-sv/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-8.2.1-2025-06-19-f69b94140/bin:$PATH"

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -f bin/*.iq bin/*.prg

# Build .iq file for Connect IQ Store
echo "📦 Building .iq package..."
monkeyc -f monkey.jungle -o bin/DescentAnalogClassic.iq -y developer_key -e

if [ $? -eq 0 ]; then
    echo "✅ Store build successful!"
    echo "📦 File: bin/DescentAnalogClassic.iq ($(ls -lh bin/DescentAnalogClassic.iq | awk '{print $5}'))"
    echo ""
    echo "🎯 Ready for Connect IQ Store upload:"
    echo "   https://apps.garmin.com/developer/upload"
    echo ""
    echo "📋 Upload this file: bin/DescentAnalogClassic.iq"
else
    echo "❌ Build failed!"
fi
