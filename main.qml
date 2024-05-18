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
        state: "LeftState" // Начальное состояние сцены

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
                onClicked: scene.state = "LeftState" // Устанавливаем состояние сцены в LeftState при клике
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
                onClicked: scene.state = "RightState" // Устанавливаем состояние сцены в RightState при клике
            }
        }

        Rectangle {
            id: ball
            color: "darkGreen"
            x: leftRectangle.x + 5 // Начальная позиция мяча совпадает с позицией левого прямоугольника
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2 // Радиус мяча для округлости
        }

        states: [
            State {
                name: "RightState" // Определение состояния RightState
                PropertyChanges {
                    target: ball
                    x: rightRectangle.x + 5 // Изменение координаты x мяча при переходе в RightState
                }
            },

            State {
                name: "LeftState" // Определение состояния LeftState
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5 // Изменение координаты x мяча при переходе в LeftState
                }
            }
        ]

        transitions: [
            Transition {
                from: "LeftState"
                to: "RightState"
                // Анимация перехода из LeftState в RightState
                NumberAnimation {
                    target: ball
                    property: "x" // Анимация изменения свойства x
                    duration: 1000 // Длительность анимации в миллисекундах
                    easing.type: Easing.OutBounce // Тип анимации (отскок)
                }
            },

            Transition {
                from: "RightState"
                to: "LeftState"
                // Анимация перехода из RightState в LeftState
                NumberAnimation {
                    target: ball
                    property: "x" // Анимация изменения свойства x
                    duration: 1000 // Длительность анимации в миллисекундах
                    easing.type: Easing.InOutExpo // Тип анимации (экспоненциальная)
                }
            }
        ]
    }
}
