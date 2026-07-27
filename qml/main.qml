import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow 
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

    ColumnLayout
    {
        id: ui
        anchors.fill: parent
        property string state: "Disconnected"

        signal clearTextBar()

        StatusBar
        {
            id: statusBar

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
        }

        Chat
        {
            id: chat

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        TextBar
        {
            id: textBar

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Connections
        {
            target: statusBar

            function onClearTextBar()
            {
                textBar.clearTextBar()
            }
        }
    }
}   