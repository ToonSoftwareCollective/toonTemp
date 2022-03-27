import QtQuick 2.1
import qb.base 1.0
import BasicUIControls 1.0
import qb.components 1.0

Tile {
	id: toonTempTile0
	
	property bool debugOutput : app.debugOutput
	property bool dimState: screenStateController.dimmedColors


	onClicked: {
		stage.openFullscreen(app.toonTempScreenUrl)
	}

	Component.onCompleted: {
		label1.visible = true
		app.temperaturesUpdated0.connect(updateTile);
	}

	function updateTile() {
		if ((sensorModel)) {
			sensorModel.clear()
			label1.visible = true
			for (var i = 0; i < app.sensorNames.length; i++) {
				if (app.sensorActive[i]) {
					label1.visible = false
					if (debugOutput) console.log("*********toonTemp updateTile: " + app.sensorNames[i])
					if (debugOutput) console.log("*********toonTemp updateTile: " + app.tempCurrent[i])
					var value = ""
					var unit = ""
					
					if (app.dht[i]){value = app.hidCurrent[i]} else {value = app.tempCurrent[i]}
					if (app.units[i]=="o"){unit = "gr. C"} else {unit = app.units[i]}
					value = value + " " + unit
					sensorModel.append({names: app.sensorNames[i], totalValue: value});
				}
			}
		}
	}

	ListModel {
		id: sensorModel
	}
	
	GridView {
		id: sensorListView
		model: sensorModel
		delegate: Text {
				id: mytext
				text: names
				color: (typeof dimmableColors !== 'undefined') ? dimmableColors.tileTextColor : colors.tileTextColor
				font {
					family: qfont.semiBold.name
					pixelSize: isNxt ? 20 : 16
				}
				anchors.left: parent.left
			}

		flow: GridView.TopToBottom
		cellWidth: parent.width
		cellHeight: isNxt ? 20 : 16
		height :  isNxt ? parent.height-10 : parent.height-8
		width :  isNxt ?  100: 80
		anchors {
			top: parent.top
			left: parent.left
			leftMargin:  isNxt ? 16: 12
			topMargin: isNxt? 8: 6
		}
	}

	GridView {
		id: tempListView
		model: sensorModel
		delegate: Text {
				id: mytext
				text: totalValue
				color: (typeof dimmableColors !== 'undefined') ? dimmableColors.tileTextColor : colors.tileTextColor
				font {
					family: qfont.semiBold.name
					pixelSize: isNxt ? 20 : 16
				}
			}

		flow: GridView.TopToBottom
		cellWidth: parent.width
		cellHeight:sensorListView.cellHeight
		height :   sensorListView.height
		width :  isNxt ?  parent.width-sensorListView.width-30 :  parent.width-sensorListView.width-24
		anchors {
			top: sensorListView.top
			left: sensorListView.right
			leftMargin:  isNxt? 24: 16
		}
	}

	Text {
		id: label1
		text: "Geen sensoren ingesteld" 
		color: (typeof dimmableColors !== 'undefined') ? dimmableColors.tileTextColor : colors.tileTextColor
		anchors {
			baseline: parent.top
			baselineOffset: isNxt ? 50 : 40
			horizontalCenter: parent.horizontalCenter
		}
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.regular.name
	}
}
	
