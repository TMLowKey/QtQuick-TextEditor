import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            height: 70
            color: "#5c667d"
            radius: 10
            border.color: "#5c667d"
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 75
            anchors.leftMargin: 75
            anchors.topMargin: 35


            GridLayout {
                id: gridLayout
                anchors.fill: parent
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                rowSpacing: 5
                columnSpacing: 5
                columns: 3

                CustomTextField {
                    id: textField
                    placeholderText: "Type your name"
                    Layout.rowSpan: 1
                    Layout.minimumWidth: 200
                    Layout.preferredWidth: 300
                    Layout.fillHeight: false
                    Layout.fillWidth: false
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 40
                    Keys.onEnterPressed: {
                        backend.welcomeText(textField.text)
                    }
                    Keys.onReturnPressed: {
                        backend.welcomeText(textField.text)
                    }
                }

                CustomButton {
                    id: btnChangeName
                    text: qsTr("Change Name")
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 150
                    Layout.minimumWidth: 100
                    Layout.rowSpan: 1
                    Layout.fillWidth: true
                    onClicked: {
                        backend.welcomeText(textField.text)
                    }
                }

                Switch {
                    id: switchHome
                    checked: true
                    Layout.minimumHeight: 30
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 68
                    // Change Show/Hide Frame
                    onToggled:{
                        backend.showHideRectangle(switchHome.checked)
                    }
                }
            }
        }

        Rectangle {
            id: rectangleVisible
            x: 75
            y: 75
            color: "#1a1d23"
            radius: 10
            border.color: "#1a1d23"
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 35
            anchors.topMargin: 10
            anchors.rightMargin: 75
            anchors.leftMargin: 75

            Label {
                id: labelTextName
                color: "#a1a1a1"
                text: qsTr("Welcome")
                anchors.top: parent.top
                font.pointSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 0
            }

            Label {
                id: labelDate
                x: 5
                y: 5
                color: "#4891d9"
                text: qsTr("Date")
                anchors.top: labelTextName.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 0
                font.pointSize: 12
            }

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelDate.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                clip: true
                Text {
                                        id: textHome
                                        color: "#a9b2c8"
                                        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">GNU GENERAL PUBLIC LICENSE</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Version 3, 29 June 2007</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Copyright (c) 2020 <span style=\" font-weight:600;\">Wanderson M. Pimenta</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#55aaff;\">Attention</span>: this project was created with the Open Souce tools from Qt Company,</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">this project can be used for studies or personal non-commercial projects. </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">If you are going to use it for </span><span style=\" font-weight:600; color:#55aaff;\">commercial use</span><span style=\" font-weight:600;\">, you need to purchase a license at &quot;https://www.qt.io&quot;.</span></p></body></html>"
                                        anchors.right: parent.right
                                        anchors.fill: parent
                                        font.pixelSize: 12
                                        anchors.rightMargin: 0
                                        textFormat: Text.RichText
                }
            }
        }
    }

    Connections{
        target: backend
        ignoreUnknownSignals: true

        function onSetName(name){
            labelTextName.text = name
        }

        function onPrintTime(time){
            labelDate.text = time
        }

        function onIsVisible(isVisible){
            rectangleVisible.visible = isVisible
        }
    }
}
