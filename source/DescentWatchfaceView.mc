import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Math;

class DescentWatchfaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        // Простая инициализация без layout файла
    }

    function onUpdate(dc) {
        // Очищаем экран
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var centerY = height / 2;

        // Отображаем фоновое изображение
        var background = WatchUi.loadResource(Rez.Drawables.Background);
        if (background != null) {
            // Центрируем изображение
            var bgWidth = background.getWidth();
            var bgHeight = background.getHeight();
            var bgX = centerX - (bgWidth / 2);
            var bgY = centerY - (bgHeight / 2);
            dc.drawBitmap(bgX, bgY, background);
        }

        // Получаем текущее время
        var clockTime = System.getClockTime();
        var hour = clockTime.hour % 12; // 12-часовой формат
        var min = clockTime.min;
        var sec = clockTime.sec;

        // Рисуем аналоговые стрелки
        drawAnalogHands(dc, centerX, centerY, hour, min, sec);
    }

    function drawAnalogHands(dc, centerX, centerY, hour, min, sec) {
        // Используем минимальный радиус (простое сравнение вместо Math.min)
        var radius = (centerX < centerY) ? centerX * 0.8 : centerY * 0.8;

        // Углы для стрелок (в радианах)
        // 12 часов = 0°, поворот по часовой стрелке
        var hourAngle = (Math.PI / 6) * (hour + min / 60.0) - Math.PI / 2; // Часовая стрелка
        var minAngle = (Math.PI / 30) * min - Math.PI / 2; // Минутная стрелка
        var secAngle = (Math.PI / 30) * sec - Math.PI / 2; // Секундная стрелка

        // Длины стрелок
        var hourLength = radius * 0.5;
        var minLength = radius * 0.7;
        var secLength = radius * 0.8;

        // Координаты концов стрелок
        var hourX = centerX + hourLength * Math.cos(hourAngle);
        var hourY = centerY + hourLength * Math.sin(hourAngle);

        var minX = centerX + minLength * Math.cos(minAngle);
        var minY = centerY + minLength * Math.sin(minAngle);

        var secX = centerX + secLength * Math.cos(secAngle);
        var secY = centerY + secLength * Math.sin(secAngle);

        // Рисуем стрелки
        dc.setPenWidth(4);

        // Часовая стрелка (белая, толстая)
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(centerX, centerY, hourX, hourY);

        // Минутная стрелка (белая, средняя)
        dc.setPenWidth(3);
        dc.drawLine(centerX, centerY, minX, minY);

        // Секундная стрелка (красная, тонкая)
        dc.setPenWidth(1);
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(centerX, centerY, secX, secY);

        // Центральная точка
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.fillCircle(centerX, centerY, 5);
    }

    function onPartialUpdate(dc) {
        // Для экономии батареи можно обновлять только время
        onUpdate(dc);
    }

}
