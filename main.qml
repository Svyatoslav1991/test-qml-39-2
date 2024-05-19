import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Make Transition")

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "InitialState" // Начальное состояние

        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightGrey"
            width: 100
            height: 100
            border.color: "black"
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ball.x += 30
                    if (ball.x >= rightRectangle.x) {
                        scene.state = "InitialState"
                    } else {
                        scene.state = "OtherState"
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "move"
            }
        }

        Rectangle {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightGrey"
            width: 100
            height: 100
            border.color: "black"
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }

            Text {
                anchors.centerIn: parent
                text: "return"
            }
        }

        Rectangle {
            id: ball
            color: "darkGreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }

        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                    y: leftRectangle.y + 5
                }
            },
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x // Сохраняем текущее значение x
                }
            }
        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"
                NumberAnimation {
                    target: ball
                    property: "x"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
