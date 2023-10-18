import QtQuick 2.15
import QtQuick.Controls

TextField {
    id: textField
    placeholderTextColor: "#46ffffff"
    placeholderText: "Type something"
    selectedTextColor: "#ffffff"
    selectionColor: "#5c667d"
    color: "white"
    text: ""
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
    hoverEnabled: false
    background: Rectangle{
        color:"#2c313c"
        radius: 10
        border.color: "#2c313c"
        border.width: 1}
}
