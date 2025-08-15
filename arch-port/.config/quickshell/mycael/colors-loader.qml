pragma Singleton
import QtQuick
import Quickshell.Io

QtObject {
    id: root
    property var theme: {}

    function load() {
        var obj = {};
        if (Qt.include(Qt.resolvedUrl("colors/colors-generated.js"), obj) && obj.theme) {
            root.theme = obj.theme;
        } else {
            obj = {};
            Qt.include(Qt.resolvedUrl("colors-fallback.js"), obj);
            root.theme = obj.theme;
        }
    }

    Component.onCompleted: load()

    FileView {
        path: Qt.resolvedUrl("colors/colors-generated.js")
        watchChanges: true
        onFileChanged: root.load()
    }
}
