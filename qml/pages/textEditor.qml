import QtQuick 2.15
import QtQuick.Controls

Item {
    property string getText: textArea.text
    property string setText: ""

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Flickable {
            id: flickable
            anchors.fill: parent
            clip: true

            TextArea.flickable: TextArea{
                id: textArea
                padding: 10
                wrapMode: Text.WordWrap
                textFormat: Text.AutoText
                selectByMouse: true
                selectedTextColor: "#ffffff"
                selectionColor: "#ff007f"
                color: "#ffffff"
                font.pointSize: 12
                text: setText

                background: Rectangle{
                    color: "#2c313c"
                }
            }

            ScrollBar.vertical: ScrollBar{}
        }
    }
}
