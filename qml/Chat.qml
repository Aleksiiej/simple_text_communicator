import QtQuick


Rectangle
{
    id: chatRect
    color: "lightblue"

    property alias chatListModel: chatListModel

    ListView
    {
        id: chatListView
        anchors.fill: parent
        model: ListModel
        {
            id: chatListModel
            ListElement{message: "Hi!"}
        }
        delegate: Text
        {
            text: message
        }
        clip: true
    }
}