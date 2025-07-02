#!/bin/bash
# Скрипт для запуска аналогового циферблата Descent MK3i

echo "🔧 Собираю аналоговые часы..."
monkeyc -f monkey.jungle -o bin/GarminmokeyC2.prg -y developer_key -d descentmk343mm

if [ $? -eq 0 ]; then
    echo "✅ Сборка успешна!"
    echo "🎯 Запускаю аналоговые часы с фоном..."
    "/Users/travinov-sv/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-8.2.1-2025-06-19-f69b94140/bin/monkeydo" bin/GarminmokeyC2.prg descentmk343mm
else
    echo "❌ Ошибка сборки!"
fi
