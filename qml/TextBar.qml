import QtQuick
import QtQuick.Controls


Rectangle
{
    id: textBar
    height: 30

    property int buttonWidth: 60

    signal clearTextBar()

    onClearTextBar:
    {
        sendMsgTextArea.clear()
    }

    TextArea
    {
        id: sendMsgTextArea
        height: parent.height
        width: parent.width - parent.buttonWidth
        anchors
        {
            bottom: parent.bottom
            left: parent.left
        }
        placeholderText: "Enter text here"
        placeholderTextColor: "black"
        color: "black"
        enabled: ui.state != "Disconnected"
    }

    Rectangle
    {
        height: parent.height
        width: parent.buttonWidth
        anchors
        {
            bottom: parent.bottom
            right: parent.right
        }
        color:"gray"

        Text
        {
            anchors.centerIn: parent
            text: "Send"
        }

        MouseArea
        {
            id: sendMsgMouseArea
            anchors.fill: parent
            enabled: ui.state != "Disconnected"
            onClicked: 
            {
                if(server)
                {
                    server.sendMessage(server.username_ + ": " + sendMsgTextArea.text)
                }
                else if(client)
                {
                    client.sendMessage(sendMsgTextArea.text)
                }
                sendMsgTextArea.clear()
            }
            onPressed: parent.color = "lightgrey"
            onReleased: parent.color = "gray"
        }
    }
}