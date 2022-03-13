import QtQuick 2.1
import BasicUIControls 1.0
import qb.components 1.0

Screen {
	id: toonTempScreen
	property variant data1: app.tempDATA[0]
	property variant data2: app.tempDATA[1]
	property variant data3: app.tempDATA[2]
	property variant data4: app.tempDATA[3]
	property variant data5: app.tempDATA[4]
	property variant data6: app.tempDATA[5]

	property int     sensorCount : app.sensorCount
	property bool activeMe      : false


   onVisibleChanged: {
        if (visible) {
            activeMe = true
        } else { 
            activeMe = false
        }
    }

    Timer {
        id                      : controlTimer
        interval                : 30000
        running                 : activeMe
		triggeredOnStart		: true
        repeat                  : true
        onTriggered             : updateData()
    }  

	onShown: {    
		addCustomTopRightButton("Instellingen")
    }
	
	onCustomButtonClicked: {
		stage.openFullscreen(app.toonTempConfigScreenUrl)
	}
	
	Component.onCompleted: {
		console.log( "*********toonTemp toonTempScreen sensorCount: "  + sensorCount)
		console.log( "*********toonTemp toonTempScreen app.tempDATA[0]: "  + app.tempDATA[0])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[1]: "  + app.tempDATA[1])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[2]: "  + app.tempDATA[2])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[3]: "  + app.tempDATA[3])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[4]: "  + app.tempDATA[4])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[5]: "  + app.tempDATA[5])
		console.log( "*********toonTemp toonTempScreen app.tempDATA[6]: "  + app.tempDATA[6])
	}

	function updateData() {
		data1 = app.tempDATA[0]
		data2 = app.tempDATA[1]
		data3 = app.tempDATA[2]
		data4 = app.tempDATA[3]
		data5 = app.tempDATA[4]
		data6 = app.tempDATA[5]
	}
	
	Text {
		id: noSensorText
		text:  "Geen sensoren ingesteld. Klik op instellingen"
		font.pixelSize: isNxt ? 20 : 16
		font.family: qfont.bold.name
		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}
		visible: app.sensorCount==0
	}
	
	Grid {
		id: gridContainer1
		columns: (sensorCount >4) ? 3:2
		spacing: 30

		anchors {
			top: parent.top
			topMargin: isNxt ? 20 : 16
			horizontalCenter: parent.horizontalCenter
		}
		
		ToonTempBarGraph {
			id: todaybarGraph1
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
			withDecimals: (sensorCount >4) ? false : true
			hourGridColor: "red"
			titleText: app.sensorNames[0]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 30
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data1
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl1)}
			visible : app.sensorActive[0]
		}
	
	ToonTempBarGraph {
			id: todaybarGraph2
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
            withDecimals: (sensorCount >4) ? false : true			
			hourGridColor: "red"
			titleText: app.sensorNames[1]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 3
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data2
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl2)}
			visible : app.sensorActive[1]
		}
	
	ToonTempBarGraph {
			id: todaybarGraph3
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
			withDecimals: (sensorCount >4) ? false : true
			hourGridColor: "red"
			titleText: app.sensorNames[2]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 3
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data3
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl3)}
			visible : app.sensorActive[2]
	}
	
	ToonTempBarGraph {
			id: todaybarGraph4
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
			withDecimals: (sensorCount >4) ? false : true
			hourGridColor: "red"
			titleText: app.sensorNames[3]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 3
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data4
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl4)}
			visible : app.sensorActive[3]
		}

	ToonTempBarGraph {
			id: todaybarGraph5
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
			withDecimals: (sensorCount >4) ? false : true
			hourGridColor: "red"
			titleText: app.sensorNames[4]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 3
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data5
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl5)}
			visible : app.sensorActive[4]
		}

	ToonTempBarGraph {
			id: todaybarGraph6
			height:  toonTempScreen.height/2.4
			width:  (sensorCount >4) ? toonTempScreen.width/3.3: toonTempScreen.width/2.3
			withDecimals: (sensorCount >4) ? false : true
			hourGridColor: "red"
			titleText: app.sensorNames[5]
			titleFont: qfont.bold.name
			titleSize: isNxt ? 20 : 16
			showTitle: true
			backgroundcolor : "lightgrey"
			axisColor : "black"
			barColor :dimmableColors.graphSolar
			lineXaxisvisible : true
			textXaxisColor : "red"
			stepXtext: 3
			valueFont: qfont.regular.name
			valueSize: isNxt ? 16 : 12
			valueTextColor : "black"
			showValuesOnBar : false
			levelColor :"red"
			levelTextColor : "blue"
			showLevels  : true
			showValuesOnLevel : true
			dataValues:  data6
			debugOutput : app.debugOutput
			onClicked: {stage.openFullscreen(app.toonTempScreenUrl6)}
			visible : app.sensorActive[5]
		}

	}

}




