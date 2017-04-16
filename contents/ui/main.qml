import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    PlasmaCore.DataSource {
        id: keystateSource
        engine: "keystate"
        connectedSources: ["Caps Lock", "Num Lock"]
    }
    PlasmaComponents.Label {
        anchors.centerIn: parent
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
}
