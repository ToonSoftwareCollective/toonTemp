import QtQuick 2.1
import BasicUIControls 1.0
import qb.components 1.0

Screen {
	id: toonTempScreen1
	
	property variant dataValues : app.tempDATA[3]
	
	Component.onCompleted: {
		app.temperaturesUpdated4.connect(updateScreen);
	}

	function updateScreen() {
		todaybarGraph.dataValues = app.tempDATA[3]
	}
	
	ToonTempBarGraph {
        id: todaybarGraph
        anchors {
            bottom: parent.bottom
            bottomMargin: isNxt? 80:64
            left : parent.left
            leftMargin : isNxt? 10:8
        }
        height:  isNxt? parent.height-100 : parent.height-80
        width: isNxt?  parent.width - 40 : parent.width - 32
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
		stepXtext: 20
		valueFont: qfont.regular.name
		valueSize: isNxt ? 16 : 12
		valueTextColor : "black"
		showValuesOnBar : false
		levelColor :"red"
		levelTextColor : "blue"
		showLevels  : true
		showValuesOnLevel : true
		debugOutput : app.debugOutput
		dataValues:  app.tempDATA[3]
	}

}