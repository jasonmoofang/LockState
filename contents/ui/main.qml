import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
    Plasma5Support.DataSource {
        id: keystateSource
        engine: "keystate"
        connectedSources: ["Caps Lock", "Num Lock", "Scroll Lock"]
    }
    compactRepresentation: PlasmaComponents.Label {
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
            if (keystateSource.data["Num Lock"]) {
                text += "<br />Num: "
                if (keystateSource.data["Num Lock"]["Locked"]) {
                    text += "<strong>ON</strong>"
                } else {
                    text += "off"
                }
            }
            if (keystateSource.data["Scroll Lock"]) {
                text += "<br />Scroll: "
                if (keystateSource.data["Scroll Lock"]["Locked"]) {
                    text += "<strong>ON</strong>"
                } else {
                    text += "off"
                }
            }
            return text
        }
    }
    fullRepresentation: Item {
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
                if (keystateSource.data["Num Lock"]) {
                    text += "<br />Num Lock is "
                    if (keystateSource.data["Num Lock"]["Locked"]) {
                        text += "<strong>ON</strong>"
                    } else {
                        text += "off"
                    }
                }
                if (keystateSource.data["Scroll Lock"]) {
                    text += "<br />Scroll Lock is "
                    if (keystateSource.data["Scroll Lock"]["Locked"]) {
                        text += "<strong>ON</strong>"
                    } else {
                        text += "off"
                    }
                }
                return text
            }
        }
    }
}
