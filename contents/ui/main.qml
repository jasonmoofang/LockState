import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    PlasmaCore.DataSource {
        id: keystateSource
        engine: "keystate"
        connectedSources: ["Caps Lock", "Num Lock"]
    }
    Plasmoid.compactRepresentation: PlasmaComponents.Label {
        id: mainLabel
        anchors.centerIn: parent
        Layout.minimumWidth: units.gridUnit * 4
        text: {
            var text = "Caps: "
            if (keystateSource.data["Caps Lock"]["Locked"]) {
                text += "<strong>ON</strong>"
            } else {
                text += "off"
            }
            text += "<br />Num: "
            if (keystateSource.data["Num Lock"]["Locked"]) {
                text += "<strong>ON</strong>"
            } else {
                text += "off"
            }
            return text
        }
    }
    Plasmoid.fullRepresentation: Item {
        Layout.minimumWidth: units.gridUnit * 6
        Layout.minimumHeight: units.gridUnit * 6
        PlasmaComponents.Label {
            id: mainLabel
            anchors.centerIn: parent
            text: {
                var text = "Caps Lock is "
                if (keystateSource.data["Caps Lock"]["Locked"]) {
                    text += "<strong>ON</strong>"
                } else {
                    text += "off"
                }
                text += "<br />Num Lock is "
                if (keystateSource.data["Num Lock"]["Locked"]) {
                    text += "<strong>ON</strong>"
                } else {
                    text += "off"
                }
                return text
            }
        }
    }
}
