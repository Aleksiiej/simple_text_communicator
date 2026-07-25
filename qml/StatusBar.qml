import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle
{
    id: statusBarRect
    height: 28
    color: "lightblue"

    RowLayout
    {
        id: statusBar
        anchors.fill: parent

        Button
        {
            id: createServerButton
            text: ui.state == "Server" ? "Close Server" : "Create Server"
            onClicked:
            {
                if(!server)
                {
                    var serverComponent = Qt.createComponent("TcpServer.qml")
                    if(serverComponent.status === Component.Ready)
                    {
                        server = serverComponent.createObject(root)
                        server.username_ = usernameTextArea.text
                        ui.state = "Server"
                        chatListModel.append({message: "Server created. Listening..."})
                    }
                }
                else
                {
                    server.destroy()
                    ui.state = "Disconnected"
                    chatListModel.append({message: "Server removed"})
                }
            }
        }

        Rectangle
        {
            id: usernameRect
            height: parent.height
            width: 300
            color: ui.state == "Disconnected" ? "white" : "lightgrey"

            TextArea
            {
                id: usernameTextArea
                anchors.fill: parent
                placeholderText: qsTr("Enter username")
                placeholderTextColor: "black"
                enabled: ui.state == "Disconnected" ? true : false
                color: "black"
            }
        }

        Rectangle
        {
            id: serverAddressRect
            height: parent.height
            width: 300
            color: ui.state == "Disconnected" ? "white" : "lightgrey"

            TextArea
            {
                id: serverAddressTextArea
                anchors.fill: parent
                placeholderText: qsTr("Enter IP address")
                placeholderTextColor: "black"
                enabled: ui.state == "Disconnected" ? true : false
                color: "black"
            }
        }

        Button
        {
            id: joinServerButton
            text: ui.state == "Client" ? "Disconnect" : "Join Server"
            onClicked:
            {
                if(!client)
                {
                    var clientComponent = Qt.createComponent("Client.qml")
                    if(clientComponent.status === Component.Ready)
                    {
                        client = clientComponent.createObject(root)
                        client.username_ = usernameTextArea.text
                        if(client.connectToServer(serverAddressTextArea.text))
                        {
                            ui.state = "Client"
                        }
                        else
                        {
                            client.destroy()
                            ui.state = "Disconnected"
                        }
                    }
                }
                else
                {
                    client.destroy()
                    ui.state = "Disconnected"
                    chatListModel.append({message: "Disconnected from server"})
                }
            }
        }
    }
}