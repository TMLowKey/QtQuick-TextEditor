import QtQuick 2.15
import QtQuick.Controls

AbstractButton {
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: ""
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 35
    implicitHeight: 35

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image{
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            visible: true
            width: 16
            fillMode: Image.PreserveAspectFit
        }
    }
}
