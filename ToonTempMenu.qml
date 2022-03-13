import QtQuick 2.1

import qb.components 1.0
import qb.base 1.0

MenuItem {
	id: toonTempMenu
	label: qsTr("toonTemp")
	image: "qrc:/tsc/temperatureLoggerTray_orig.png"
	weight: isNxt ? 50 : 40

	onClicked: {
		if (app.toonTempConfigScreen) app.toonTempConfigScreen.show();
	}
}
