import QtQuick
import QtQuick.Controls

Window 
{
    id: root
    visible: true

    width: 800
    height: 600
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    
    property var server: null
    property var client: null
    property alias chatListModel: chat.chatListModel

    Item
    {
        id: ui
        anchors.fill: parent
        property string state: "Disconnected"

        StatusBar
        {
            id: statusBar

            anchors
            {
                top: parent.top
                left: parent.left
                right: parent.right
            }
        }

        Chat
        {
            id: chat

            anchors
            {
                bottom: textBar.top
                left: parent.left
                right: parent.right
            }
        }

        TextBar
        {
            id: textBar

            anchors
            {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
        }
    }
}   