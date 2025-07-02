import Toybox.Application;
import Toybox.WatchUi;

class DescentWatchfaceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        return [ new DescentWatchfaceView() ];
    }

}
