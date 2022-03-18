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
	
	property variant tempdomoticzActive: app.domoticzActive
	property variant tempdomoticzIDX: app.domoticzIDX
	property string tempdomoticzURL: app.domoticzURL
	

	onShown: {
		addCustomTopRightButton("Opslaan")
		sensorActiveMode1.isSwitchedOn =tempSensorActive[0]
		sensorActiveMode2.isSwitchedOn =tempSensorActive[1]
		sensorActiveMode3.isSwitchedOn =tempSensorActive[2]
		sensorActiveMode4.isSwitchedOn =tempSensorActive[3]
		sensorActiveMode5.isSwitchedOn =tempSensorActive[4]
		sensorActiveMode6.isSwitchedOn =tempSensorActive[5]
		
		domoticzActiveMode1.isSwitchedOn =tempdomoticzActive[0]
		domoticzActiveMode2.isSwitchedOn =tempdomoticzActive[1]
		domoticzActiveMode3.isSwitchedOn =tempdomoticzActive[2]
		domoticzActiveMode4.isSwitchedOn =tempdomoticzActive[3]
		domoticzActiveMode5.isSwitchedOn =tempdomoticzActive[4]
		domoticzActiveMode6.isSwitchedOn =tempdomoticzActive[5]
		
		sensorIP1.visible = !tempdomoticzActive[0]
		sensorIP2.visible = !tempdomoticzActive[1]
		sensorIP3.visible = !tempdomoticzActive[2]
		sensorIP4.visible = !tempdomoticzActive[3]
		sensorIP5.visible = !tempdomoticzActive[4]
		sensorIP6.visible = !tempdomoticzActive[5]
		
		sensorIDX1.visible = tempdomoticzActive[0]
		sensorIDX2.visible = tempdomoticzActive[1]
		sensorIDX3.visible = tempdomoticzActive[2]
		sensorIDX4.visible = tempdomoticzActive[3]
		sensorIDX5.visible = tempdomoticzActive[4]
		sensorIDX6.visible = tempdomoticzActive[5]
		
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
		
		sensorIDX1.buttonText = tempdomoticzIDX[0]
		sensorIDX2.buttonText = tempdomoticzIDX[1]
		sensorIDX3.buttonText = tempdomoticzIDX[2]
		sensorIDX4.buttonText = tempdomoticzIDX[3]
		sensorIDX5.buttonText = tempdomoticzIDX[4]
		sensorIDX6.buttonText = tempdomoticzIDX[5]
		
		domoticzURL.buttonText = tempdomoticzURL
		
	}

	onCustomButtonClicked: {
		app.sensorNames = tempSensorNames
		app.sensorIPs = tempSensorIPs
		app.domoticzIDX = tempdomoticzIDX
		app.sensorIPs = tempSensorIPs
		app.domoticzActive = tempdomoticzActive
		app.domoticzURL = tempdomoticzURL
		app.saveSettings()
		hide()
	}
	
	function savedomoticzURL(text) {
        if (text) {
            domoticzURL.buttonText = text.trim();
            tempdomoticzURL = text.trim();
        }
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
	
	function saveToonTempIDX1(text) {
        if (text) {
            sensorIDX1.buttonText = text.trim();
            tempdomoticzIDX[0] = text.trim();
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
	
	function saveToonTempIDX2(text) {
        if (text) {
            sensorIDX2.buttonText = text.trim();
            tempdomoticzIDX[1] = text.trim();
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

	function saveToonTempIDX3(text) {
        if (text) {
            sensorIDX3.buttonText = text.trim();
            tempdomoticzIDX[2] = text.trim();
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
	
	function saveToonTempIDX4(text) {
        if (text) {
            sensorIDX4.buttonText = text.trim();
            tempdomoticzIDX[3] = text.trim();
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
	
	function saveToonTempIDX5(text) {
        if (text) {
            sensorIDX5.buttonText = text.trim();
            tempdomoticzIDX[4] = text.trim();
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
	
	function saveToonTempIDX6(text) {
        if (text) {
            sensorIDX6.buttonText = text.trim();
            tempdomoticzIDX[5] = text.trim();
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
		columns: 6
		spacing: 10

		anchors {
			top: mytext1.bottom
			topMargin: isNxt ? 10 : 8
			left : mytext1.left
		}
		
		Text {id: sensorLabel1;  text: "Sensor"; font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorActiveLabel1; text: "Actief";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorNameLabel1; text: "Name";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: domoticzActiveLabel1; text: "Domoticz";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {text: " ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {id: sensorIPLabel1; text: "IP Address/IDX";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		
		Text {text: "1";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode1;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[0] = true;} else {tempSensorActive[0];}}}
		YaLabel {id: sensorName1; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName1.buttonText, saveToonTempName1)}}
		OnOffToggle {id: domoticzActiveMode1;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempdomoticzActive[0] = true; sensorIP1.visible = false;sensorIDX1.visible = true} else {tempdomoticzActive[0] = false; sensorIP1.visible = true; sensorIDX1.visible = false}}}
		Text {width: isNxt ? 140 : 112; visible: sensorIP1.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {width: isNxt ? 140 : 112; visible: !sensorIP1.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP1;  height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName1.buttonText , sensorIP1.buttonText, saveToonTempIP1)}}
		YaLabel {id: sensorIDX1;  height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX1.buttonText , sensorIDX1.buttonText, saveToonTempIDX1)}}

		Text {text: "2";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode2;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[1] = true;} else {tempSensorActive[1] = false;}}}
		YaLabel {id: sensorName2; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName2.buttonText, saveToonTempName2)}}
		OnOffToggle {id: domoticzActiveMode2;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {tempdomoticzActive[1] = true; sensorIP2.visible = false;sensorIDX2.visible = true} else {tempdomoticzActive[1] = false; sensorIP2.visible = true; sensorIDX2.visible = false}}}
		Text {visible: sensorIP2.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {visible: !sensorIP2.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP2;height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName2.buttonText , sensorIP2.buttonText, saveToonTempIP2)}}
		YaLabel {id: sensorIDX2; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX2.buttonText , sensorIDX2.buttonText, saveToonTempIDX2)}}

		Text {text: "3";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode3;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[2] = true;} else {tempSensorActive[2] = false;}}}
		YaLabel {id: sensorName3; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName3.buttonText, saveToonTempName3)}}
		OnOffToggle {id: domoticzActiveMode3;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempdomoticzActive[2] = true; sensorIP3.visible = false;sensorIDX3.visible = true} else {tempdomoticzActive[2] = false; sensorIP3.visible = true; sensorIDX3.visible = false}}}
		Text {visible: sensorIP3.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {visible: !sensorIP3.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP3; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName3.buttonText , sensorIP3.buttonText, saveToonTempIP3)}}
		YaLabel {id: sensorIDX3;  height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX3.buttonText , sensorIDX3.buttonText, saveToonTempIDX3)}}

		Text {text: "4";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode4;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[3] = true;} else {tempSensorActive[3] = false;}}}
		YaLabel {id: sensorName4; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName4.buttonText, saveToonTempName4)}}
		OnOffToggle {id: domoticzActiveMode4;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempdomoticzActive[3] = true; sensorIP4.visible = false;sensorIDX4.visible = true} else {tempdomoticzActive[3] = false; sensorIP4.visible = true; sensorIDX4.visible = false}}}
		Text {visible: sensorIP4.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {visible: !sensorIP4.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP4; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName4.buttonText , sensorIP4.buttonText, saveToonTempIP4)}}
		YaLabel {id: sensorIDX4; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX4.buttonText , sensorIDX4.buttonText, saveToonTempIDX4)}}

		Text {text: "5";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode5;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[4] = true;} else {tempSensorActive[4] = false;}}}
		YaLabel {id: sensorName5; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName5.buttonText, saveToonTempName5)}}
		OnOffToggle {id: domoticzActiveMode5;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempdomoticzActive[4] = true; sensorIP5.visible = false;sensorIDX5.visible = true} else {tempdomoticzActive[4] = false; sensorIP5.visible = true; sensorIDX5.visible = false}}}
		Text {visible: sensorIP5.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {visible: !sensorIP5.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP5; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName5.buttonText , sensorIP5.buttonText, saveToonTempIP5)}}
		YaLabel {id: sensorIDX5;  height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX5.buttonText , sensorIDX5.buttonText, saveToonTempIDX5)}}

		Text {text: "6";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		OnOffToggle {id: sensorActiveMode6;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempSensorActive[5] = true;} else {tempSensorActive[5] = false;}}}
		YaLabel {id: sensorName6; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The name for your sensor", sensorName6.buttonText, saveToonTempName6)}}
		OnOffToggle {id: domoticzActiveMode6;height:  30;	leftIsSwitchedOn: false	;onSelectedChangedByUser: {	if (isSwitchedOn) {	tempdomoticzActive[5] = true; sensorIP6.visible = false;sensorIDX6.visible = true} else {tempdomoticzActive[5] = false; sensorIP6.visible = true; sensorIDX6.visible = false}}}
		Text {visible: sensorIP6.visible;text:  "Sensor IP:    ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		Text {visible: !sensorIP6.visible;text: "Domoticz IDX: ";font.pixelSize: isNxt ? 20 : 16; font.family: qfont.bold.name}
		YaLabel {id: sensorIP6; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IP address for your sensor " + sensorName6.buttonText , sensorIP6.buttonText, saveToonTempIP6)}}
		YaLabel {id: sensorIDX6; height: isNxt ? 40:32; width: isNxt ? 200 : 160; buttonActiveColor: activeColor; buttonHoverColor: hoverColor;  buttonSelectedColor : selectedColor; enabled : true; selected : false; textColor : "black";onClicked: {qkeyboard.open("The IDX address for your sensor " + sensorIDX6.buttonText , sensorIDX6.buttonText, saveToonTempIDX6)}}
	}
	
	Text {
		id: domURLText; 
		text: "Example of valid URL: http://192.168.10.185:8080 :";
		font.pixelSize: isNxt ? 20 : 16; 
		font.family: qfont.bold.name
		anchors {
			left: gridContainer1.left
			top: gridContainer1.bottom
			topMargin: 20
		}
		visible: sensorIDX1.visible||sensorIDX2.visible||sensorIDX3.visible||sensorIDX4.visible||sensorIDX5.visible||sensorIDX6.visible
	}

	YaLabel {
		id: domoticzURL; 
		height: isNxt ? 40:32; 
		width: isNxt ? 400 :320; 
		buttonActiveColor: activeColor; 
		buttonHoverColor: hoverColor;  
		buttonSelectedColor : selectedColor; 
		enabled : true; 
		selected : false; 
		textColor : "black";
		onClicked: {
			qkeyboard.open("Example of valid URL: http://192.168.10.185:8080 : " +domoticzURL.buttonText , domoticzURL.buttonText, savedomoticzURL)
		}
		anchors {
			left: domURLText.left
			top: domURLText.bottom
			topMargin: isNxt ? 16:12
		}
		visible: sensorIDX1.visible||sensorIDX2.visible||sensorIDX3.visible||sensorIDX4.visible||sensorIDX5.visible||sensorIDX6.visible
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
		width: isNxt ? 140:112
		height: isNxt ? 140:112
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

