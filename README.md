# 🕰️ Garmin Descent MK3i Analog Watchface

Пользовательский аналоговый циферблат для дайвинг-часов **Garmin Descent MK3i 43mm**.

![Garmin Connect IQ](https://img.shields.io/badge/Garmin-Connect%20IQ-007ACC?style=for-the-badge&logo=garmin)
![Monkey C](https://img.shields.io/badge/Language-Monkey%20C-orange?style=for-the-badge)
![Device](https://img.shields.io/badge/Device-Descent%20MK3i%2043mm-blue?style=for-the-badge)

## ✨ Особенности

- 🎨 **Фоновое изображение** - пользовательский фон 390×390px
- ⏰ **Аналоговые стрелки** - классический дизайн часов
- 🎯 **Точное время** - 12-часовой формат с плавным движением
- 🔴 **Цветовая схема** - белые основные стрелки, красная секундная
- 🏊‍♂️ **Дайвинг-тематика** - специально для Descent MK3i

## 🎪 Дизайн стрелок

| Стрелка | Цвет | Длина | Толщина |
|---------|------|-------|---------|
| Часовая | Белая | 50% радиуса | 4px |
| Минутная | Белая | 70% радиуса | 3px |
| Секундная | Красная | 80% радиуса | 1px |

## 📁 Структура проекта

```
📁 Garmin/
├── 📁 source/                    # Исходный код Monkey C
│   ├── DescentWatchfaceApp.mc    # Главное приложение
│   └── DescentWatchfaceView.mc   # Логика отрисовки
├── 📁 resources/                 # Ресурсы приложения
│   ├── 📁 strings/               # Текстовые ресурсы
│   └── 📁 drawables/             # Изображения
│       ├── background.png        # Фон циферблата 390×390
│       ├── launcher_icon.jpg     # Иконка приложения
│       └── drawables.xml         # Конфигурация ресурсов
├── 📁 bin/                      # Собранные файлы
│   └── GarminmokeyC2.prg        # 🎯 Готовый циферблат!
├── 📁 .vscode/                  # Настройки VS Code
│   ├── launch.json              # Конфигурация запуска
│   ├── settings.json            # Настройки Monkey C
│   └── tasks.json               # Задачи сборки
├── manifest.xml                 # Манифест приложения
├── monkey.jungle                # Конфигурация сборки
├── developer_key                # Ключ разработчика
└── run_watchface.sh             # 🚀 Скрипт быстрого запуска
```

## 🚀 Быстрый старт

### 1️⃣ Установка циферблата

**Способ 1: Готовый файл**
```bash
# Скачайте bin/GarminmokeyC2.prg
# Загрузите через Garmin Express или Connect IQ Device Simulator
```

**Способ 2: Сборка из исходников**
```bash
git clone https://github.com/travinov/Garmin.git
cd Garmin
./run_watchface.sh
```

### 2️⃣ Разработка

**Требования:**
- [Connect IQ SDK 8.2.1+](https://developer.garmin.com/connect-iq/sdk/)
- [VS Code](https://code.visualstudio.com/) + [Monkey C Extension](https://marketplace.visualstudio.com/items?itemName=garmin.monkey-c)
- macOS с Xcode Command Line Tools

**Команды VS Code:**
```
Monkey C: Build Current Project    # Сборка
Monkey C: Build for Device        # Сборка для устройства
F5                                # Запуск с отладкой
```

## 🔧 Разработка и кастомизация

### Изменение фона
Замените `resources/drawables/background.png` на ваше изображение 390×390px.

### Изменение цветов стрелок
В файле `source/DescentWatchfaceView.mc`:
```javascript
// Часовая и минутная стрелки
dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

// Секундная стрелка
dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
```

### Изменение длины стрелок
```javascript
var hourLength = radius * 0.5;    // 50% радиуса
var minLength = radius * 0.7;     // 70% радиуса
var secLength = radius * 0.8;     // 80% радиуса
```

## 🎯 Совместимость

- ✅ **Garmin Descent MK3i 43mm** - основная цель
- ⚙️ **Connect IQ API 3.0.0+**
- 🛠️ **Monkey C SDK 8.2.1**

## 📝 Лицензия

MIT License - используйте свободно для личных и коммерческих проектов.

## 🤝 Вклад в проект

1. Fork репозитория
2. Создайте feature branch (`git checkout -b feature/amazing-feature`)
3. Commit изменения (`git commit -m 'Add amazing feature'`)
4. Push в branch (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

## 📞 Поддержка

- 🐛 [Issues](https://github.com/travinov/Garmin/issues) - сообщения об ошибках
- 💡 [Discussions](https://github.com/travinov/Garmin/discussions) - идеи и вопросы
- 📖 [Connect IQ Developer Guide](https://developer.garmin.com/connect-iq/connect-iq-basics/)

---

**Made with ❤️ for diving enthusiasts and Garmin Descent users**
