import QtQuick 2.1
import BasicUIControls 1.0
import qb.components 1.0
import FileIO 1.0

Screen {
	id:toonTempConfigScreen
	screenTitle: "Temperatuur sensoren"
	property string temptoonTempURL: app.toonTempURL
	property string toonTempURL: app.toonTempURL
	
	property string    activeColor: "lightblue"
    property string    hoverColor: "darkblue"
    property string    selectedColor : "yellow"
			
	property variant tempSensorNames : app.sensorNames
    property variant tempSensorIPs : app.sensorIPs
    property variant tempSensorActive: app.sensorActive

	onShown: {
		addCustomTopRightButton("Opslaan")
		sensorActiveMode1.isSwitchedOn =tempSensorActive[0]
		sensorActiveMode2.isSwitchedOn =tempSensorActive[1]
		sensorActiveMode3.isSwitchedOn =tempSensorActive[2]
		sensorActiveMode4.isSwitchedOn =tempSensorActive[3]
		sensorActiveMode5.isSwitchedOn =tempSensorActive[4]
		sensorActiveMode6.isSwitchedOn =tempSensorActive[5]
		sensorName1.buttonText = tempSensorNames[0]
		sensorName2.buttonText = tempSensorNames[1]
		sensorName3.buttonText = tempSensorNames[2]
		sensorName4.buttonText = tempSensorNames[3]
		sensorName5.buttonText = tempSensorNames[4]
		sensorName6.buttonText = tempSensorNames[5]
		sensorIP1.buttonText = tempSensorIPs[0]
		sensorIP2.buttonText = tempSensorIPs[1]
		sensorIP3.buttonText = tempSensorIPs[2]
		sensorIP4.buttonText = tempSensorIPs[3]
		sensorIP5.buttonText = tempSensorIPs[4]
		sensorIP6.buttonText = tempSensorIPs[5]
	}

	onCustomButtonClicked: {
		app.sensorNames = tempSensorNames
		app.sensorIPs = tempSensorIPs
		console.log("***********sensorActive1: " + tempSensorActive)
		app.sensorActive = tempSensorActive
		console.log("***********app.sensorActive: " + app.sensorActive)
		app.saveSettings()
		hide()
	}
	
    function saveToonTempName1(text) {
        if (text) {
            sensorName1.buttonText = text.trim();
            tempSensorNames[0] = text.trim();
        }
    }

    function saveToonTempIP1(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP1.buttonText = text.trim();
                tempSensorIPs[0] = text.trim();
            }
        }
    }

    function saveToonTempName2(text) {
        if (text) {
            sensorName2.buttonText = text.trim();
            tempSensorNames[1] = text.trim();
        }
    }

    function saveToonTempIP2(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP2.buttonText = text.trim();
                tempSensorIPs[1] = text.trim();
            }
        }
    }

    function saveToonTempName3(text) {
        if (text) {
            sensorName3.buttonText = text.trim();
            tempSensorNames[2] = text.trim();
        }
    }

    function saveToonTempIP3(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP3.buttonText = text.trim();
                tempSensorIPs[2] = text.trim();
            }
        }
    }


    function saveToonTempName4(text) {
        if (text) {
            sensorName4.buttonText = text.trim();
            tempSensorNames[3] = text.trim();
        }
    }

    function saveToonTempIP4(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP4.buttonText = text.trim();
                tempSensorIPs[3] = text.trim();
            }
        }
    }

    function saveToonTempName5(text) {
        if (text) {
            sensorName5.buttonText = text.trim();
            tempSensorNames[4] = text.trim();
        }
    }

    function saveToonTempIP5(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP5.buttonText = text.trim();
                tempSensorIPs[4] = text.trim();
            }
        }
    }
	
	    function saveToonTempName6(text) {
        if (text) {
            sensorName6.buttonText = text.trim();
            tempSensorNames[5] = text.trim();
        }
    }

    function saveToonTempIP6(text) {
        if (text) {
            if (( text.trim() == "" ) || (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(text)) ) {  
                sensorIP6.buttonText = text.trim();
                tempSensorIPs[5] = text.trim();
            }
        }
    }
	
	Text {
		id: mytext1
		text:  "Instellingen"
		font.pixelSize: isNxt ? 20 : 16;
		font.family: qfont.bold.name
		anchors {
			top: parent.top
			left: parent.left
			leftMargin: 20
			topMargin:20
		}
	}
	
	Grid {
		id: gridContainer1
		columns: 4
		spacing: 10

		anchors {
			top: mytext1.bottom
			topMargin: isNxt ? 10 : 8
			left : mytext1.left
		}
		
		Text {id: sensorLabel1;  text: "Sensor"; font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorActiveLabel1; text: "Actief";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorNameLabel1; text: "Name";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorIPLabel1; text: "IP Address";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		
		Text {id: blanc1; text: "1";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode1;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[0] = true;} else {tempSensorActive[0] = false;}}}
		YaLabel {id: sensorName1; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName1.buttonText, saveToonTempName1)}}
		YaLabel {id: sensorIP1; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName1.buttonText , sensorIP1.buttonText, saveToonTempIP1)}}

		Text {id: blanc2; text: "2";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode2;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[1] = true;} else {tempSensorActive[1] = false;}}}
		YaLabel {id: sensorName2; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName2.buttonText, saveToonTempName2)}}
		YaLabel {id: sensorIP2; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName2.buttonText , sensorIP2.buttonText, saveToonTempIP2)}}

		Text {id: blanc3; text: "3";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode3;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[2] = true;} else {tempSensorActive[2] = false;}}}
		YaLabel {id: sensorName3; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName3.buttonText, saveToonTempName3)}}
		YaLabel {id: sensorIP3; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName3.buttonText , sensorIP3.buttonText, saveToonTempIP3)}}

		Text {id: blanc4; text: "4";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode4;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[3] = true;} else {tempSensorActive[3] = false;}}}
		YaLabel {id: sensorName4; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName4.buttonText, saveToonTempName4)}}
		YaLabel {id: sensorIP4; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName4.buttonText , sensorIP4.buttonText, saveToonTempIP4)}}

		Text {id: blanc5; text: "5";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode5;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[4] = true;} else {tempSensorActive[4] = false;}}}
		YaLabel {id: sensorName5; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName5.buttonText, saveToonTempName5)}}
		YaLabel {id: sensorIP5; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName5.buttonText , sensorIP5.buttonText, saveToonTempIP5)}}

		Text {id: blanc6; text: "6";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode6;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[5] = true;} else {tempSensorActive[5] = false;}}}
		YaLabel {id: sensorName6; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName6.buttonText, saveToonTempName6)}}
		YaLabel {id: sensorIP6; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName6.buttonText , sensorIP6.buttonText, saveToonTempIP6)}}
	}
	
	Image {
		id: qrCode
		source: "file:///qmf/qml/apps/toonTemp/drawables/qrCode.png"
		anchors {
			right:  parent.right	
			bottom: parent.bottom
			rightMargin:10
			bottomMargin:10
		}
		width: isNxt ? 150:120
		height: isNxt ? 150:120
		fillMode: Image.PreserveAspectFit	
	}

	Text {
		id: myLabel90
		text: "Nog geen meter?"
		font.family: qfont.semiBold.name
		font.pixelSize: isNxt ? 18:14
		anchors {
			horizontalCenter: qrCode.horizontalCenter
			bottom: qrCode.top		
			bottomMargin:10
		}
	}
}

