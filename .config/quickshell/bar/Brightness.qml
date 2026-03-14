import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    color: "transparent"

    // Mevcut parlaklığı tutmak için bir property
    property int brightnessValue: 0

    // Başlangıçta ve değişikliklerde parlaklığı okumak için
    function updateBrightness() {
        Shell.run("brightnessctl g", (exitCode, stdout) => {
            let current = parseInt(stdout);
            Shell.run("brightnessctl m", (exitCode, maxOut) => {
                let max = parseInt(maxOut);
                root.brightnessValue = Math.round((current / max) * 100);
            });
        });
    }

    Component.onCompleted: updateBrightness()

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 5

        Text {
            text: "󰃠" // Güneş/Parlaklık ikonu
            color: "#ac3231"
            font.family: "BigBlueTermPlusNerdFont"
            font.pointSize: 15
        }

        Text {
            text: root.brightnessValue + "%"
            color: "#52263e"
            font.family: "BigBlueTermPlusNerdFont"
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onWheel: e => {
            e.accepted = true;
            let delta = e.angleDelta.y / 120; // Yukarı +1, Aşağı -1
            let change = delta > 0 ? "+5%" : "5%-";
            
            // Parlaklığı değiştir ve arayüzü güncelle
            Shell.run(`brightnessctl s ${change}`, () => {
                updateBrightness();
            });
        }
    }
}