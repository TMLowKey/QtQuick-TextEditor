import QtQuick 2.15
import QtQuick.Controls

AbstractButton {
    id: btnLeftMenu
    text: qsTr("Left Menu Text")
    // CUSTOM PROPERTIES
    property url btnIconSource: ""
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#55aaff"
    property color activeMenuRightColor: "#2c313c"
    property bool isActiveMenu: false

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuRightColor
            width: 5
            visible: isActiveMenu
        }
    }
    contentItem: Item{
        anchors.fill: parent
        id: content

        Image{
            id: iconBtn
            source: btnIconSource
            antialiasing: true
            anchors.leftMargin: 26
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: iconHeight
            fillMode: Image.PreserveAspectFit
        }

        Text{
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }

    }
}
