import QtQuick 2.1
import qb.components 1.0

Tile {
    id: toonTempTile1
    
	property int index: 3
    property string toonTempStr : app.tempCurrent[index]
	property string toonHumStr : app.humCurrent[index]
	property string toonHidStr : app.hidCurrent[index]
	property string sensorNamesStr : app.sensorNames[index]
	property bool isDHT : app.dht[index]
	
	
	onClicked: {
			stage.openFullscreen(app.toonTempScreenUrl)
	}

	Component.onCompleted: {
		app.temperaturesUpdated4.connect(updateTile);
	}

	function updateTile() {
		console.log(app.tempCurrent[index]])
		toonTempStr = app.tempCurrent[index]
		toonHumStr = app.humCurrent[index]
		toonHidStr = app.hidCurrent[index]
		sensorNamesStr = app.sensorNames[index]
		isDHT = app.dht[index]
	}

//IF NOT DHT SENSOR

	Text {
		id: toonTemp
		text:  toonTempStr
		color: dimmableColors.clockTileColor
		anchors.centerIn: parent
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: dimState ? qfont.clockFaceText : qfont.timeAndTemperatureText
		font.family: qfont.regular.name
		visible: !isDHT
	}

    Text {
        id: degree1
        text: "o"
        color: dimmableColors.clockTileColor
        anchors {
            top: toonTemp.top
            left: toonTemp.right
            leftMargin: isNxt ? 6 : 5
        }
        font.pixelSize:  isNxt ? 32 : 25
        font.family: qfont.regular.name
		visible: !isDHT
    }


//IF DHT SENSOR
	Text {
		id: toonTemp2
		text:  toonTempStr
		color: dimmableColors.clockTileColor
		anchors {
			left: parent.left
			leftMargin : isNxt? 8:6
			top: parent.top
			topMargin: isNxt? 8:6
		}
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: isNxt? 36:29
		font.family: qfont.regular.name
		visible: isDHT
	}

    Text {
        id: degree2
        text: "o"
        color: dimmableColors.clockTileColor
        anchors {
            top: toonTemp2.top
            left: toonTemp2.right
            leftMargin: isNxt ? 5 : 4
        }
        font.pixelSize: isNxt? 25:20
        font.family: qfont.regular.name
		visible: isDHT
    }
	
	Text {
		id: humidity
		text:  toonHumStr  + "%"
		color: dimmableColors.clockTileColor
		anchors {
			right: parent.right
			rightMargin : isNxt? 8:6
			top: parent.top
			topMargin: isNxt? 8:6
		}
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: isNxt? 36:29
		font.family: qfont.regular.name
		visible: isDHT
	}
	
	Text {
		id: hid
		text:  toonHidStr
		color: dimmableColors.clockTileColor
		anchors.centerIn: parent
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: dimState ? qfont.clockFaceText : qfont.timeAndTemperatureText
		font.family: qfont.regular.name
		visible: isDHT
	}

    Text {
        id: degree3
        text: "o"
        color: dimmableColors.clockTileColor
        anchors {
            top: hid.top
            left: hid.right
            leftMargin: isNxt ? 6 : 5
        }
        font.pixelSize:  isNxt ? 32 : 25
        font.family: qfont.regular.name
		visible: isDHT
    }

	Text {
		id: txtBottom
		text:  sensorNamesStr
		color: dimmableColors.clockTileColor
		anchors {
			horizontalCenter: parent.horizontalCenter
			baseline: parent.bottom
			baselineOffset: designElements.vMarginNeg16
		}
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: qfont.tileTitle
		font.family: qfont.regular.name
		visible: !dimState
	}
}
