import Quickshell
import QtQuick
import "./colors-loader.qml" as Theme

ShellRoot {
    id: root
    property var theme: Theme.theme

    Rectangle {
        anchors.fill: parent
        color: theme.background
    }
}
