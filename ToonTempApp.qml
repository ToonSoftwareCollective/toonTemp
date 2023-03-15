import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0;
import FileIO 1.0

App {

	id: toonTempApp
	property bool debugOutput : false
	
	property string popupString : "Temp instellen en herstarten als nodig" + "..."
	property url 	tempRebootPopupUrl: "TempRebootPopup.qml"
	property 		Popup tempRebootPopup
	property string configMsgUuid : ""

	//property url     toonTempMenuIconUrl: "qrc:/tsc/temperatureLoggerTray_orig.png"
        property url     toonTempMenuIconUrl: ("qrc://apps/weather/drawables/Icon-Temperature.svg")

	property url 	 toonTemptile1Url0 :  "ToonTempTile0.qml"
	property url 	 toonTemptile1Url1 :  "ToonTempTile1.qml"
	property url 	 toonTemptile1Url2 : "ToonTempTile2.qml"
	property url 	 toonTemptile1Url3 : "ToonTempTile3.qml"
	property url 	 toonTemptile1Url4 : "ToonTempTile4.qml"
	property url 	 toonTemptile1Url5 : "ToonTempTile5.qml"
	property url 	 toonTemptile1Url6 : "ToonTempTile6.qml"

	
	//property url 	 thumbnailIcon: "qrc:/tsc/temperatureLoggerTray_orig.png"
	property url 	 thumbnailIcon: ("qrc://apps/airQuality/drawables/temperature-thumb.svg")

	property url 	 toonTempConfigScreenUrl : "ToonTempConfigScreen.qml"
	property ToonTempConfigScreen toonTempConfigScreen
	
	property url 	 toonTempScreenUrl : "ToonTempScreen.qml"
	property ToonTempScreen toonTempScreen
	property url 	 toonTempScreenUrl1 : "ToonTempScreen1.qml"
	property ToonTempScreen1 toonTempScreen1
	property url 	 toonTempScreenUrl2 : "ToonTempScreen2.qml"
	property ToonTempScreen2 toonTempScreen2
	property url 	 toonTempScreenUrl3 : "ToonTempScreen3.qml"
	property ToonTempScreen3 toonTempScreen3
	property url 	 toonTempScreenUrl4 : "ToonTempScreen4.qml"
	property ToonTempScreen4 toonTempScreen4
	property url 	 toonTempScreenUrl5 : "ToonTempScreen5.qml"
	property ToonTempScreen5 toonTempScreen5
	property url 	 toonTempScreenUrl6 : "ToonTempScreen6.qml"
	property ToonTempScreen6 toonTempScreen6
	
	property string dtime : "0"
	property int 	minsfromfiveIndex
	property date 	dateTimeNow
	
	property int     sensorCount : 0
	property int     lastSensor : 0
	property variant sensorNames : ["a","b","c","d","e","f"]
	property variant sensorIPs : ["192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138"]
	property variant sensorActive : [false,false,false,false,false,false]	
	property variant userSettingsJSON : {}
	
	property variant tempCurrent :[-99,-99,-99,-99,-99,-99]	
	property variant humCurrent :[0,0,0,0,0,0]
	property variant hidCurrent :[0,0,0,0,0,0]
	property variant units :["","","","","",""]
	
	property variant tempDATA :[0,1,2,3,4,5,6,7]
	
	property variant dht : [false,false,false,false,false,false]
	
    property variant domoticzActive : [false,false,false,false,false,false]
    property string 	domoticzURL : "http://192.168.10.185:8080"
	property variant	domoticzIDX :[0,0,0,0,0,0]
	

	FileIO {id: toonTemp_fiveminuteValues1;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues1.txt"}
	FileIO {id: toonTemp_fiveminuteValues2;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues2.txt"}
	FileIO {id: toonTemp_fiveminuteValues3;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues3.txt"}
	FileIO {id: toonTemp_fiveminuteValues4;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues4.txt"}
	FileIO {id: toonTemp_fiveminuteValues5;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues5.txt"}
	FileIO {id: toonTemp_fiveminuteValues6;	source: "file:///mnt/data/tsc/appData/toonTemp_fiveminuteValues6.txt"}
	FileIO {id: toonTemp_lastWrite;	source: "file:///mnt/data/tsc/appData/toonTemp_lastWrite.txt"}
	
	FileIO {id: userSettingsFile; source: "file:///mnt/data/tsc/toonTemp_userSettings.json"}
	FileIO {id: appFile;	source: "file:///HCBv2/qml/apps/toonTemp/ToonTempApp.qml"}
	FileIO {id: toontemp_mobile;	source: "file:///qmf/www/temperature.html"}



signal temperaturesUpdated0;
//SIGNALS//
signal temperaturesUpdated1;
signal temperaturesUpdated2;
signal temperaturesUpdated3;
signal temperaturesUpdated4;
signal temperaturesUpdated5;
signal temperaturesUpdated6;

//SIGNALS END//	

	function init() {		
	    registry.registerWidget("menuItem", null, this, null, {objectName: "toonTempMenuItem", label: qsTr("toonTemp"), image: toonTempMenuIconUrl, screenUrl: toonTempConfigScreenUrl, weight: 120});
		registry.registerWidget("popup", tempRebootPopupUrl, toonTempApp, "tempRebootPopup");
		registry.registerWidget("screen", toonTempConfigScreenUrl, this, "toonTempConfigScreen");
		registry.registerWidget("screen", toonTempScreenUrl, this, "toonTempScreen");
		registry.registerWidget("tile", toonTemptile1Url0, this, null, {thumbLabel: qsTr("toonTemp"), thumbIcon: thumbnailIcon, thumbCategory: "general", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});

//TILE//
registry.registerWidget("tile", toonTemptile1Url1, this, null, {thumbLabel: qsTr("Buiten"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
registry.registerWidget("tile", toonTemptile1Url2, this, null, {thumbLabel: qsTr("Bureau"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
registry.registerWidget("tile", toonTemptile1Url3, this, null, {thumbLabel: qsTr("Test sensor"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
registry.registerWidget("tile", toonTemptile1Url4, this, null, {thumbLabel: qsTr("d"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
registry.registerWidget("tile", toonTemptile1Url5, this, null, {thumbLabel: qsTr("e"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
registry.registerWidget("tile", toonTemptile1Url6, this, null, {thumbLabel: qsTr("f"), thumbIcon: thumbnailIcon, thumbCategory: "temperature", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});

//TILE END//
//SCREEN//
registry.registerWidget("screen", toonTempScreenUrl1, this, "toonTempScreen1");
registry.registerWidget("screen", toonTempScreenUrl2, this, "toonTempScreen2");
registry.registerWidget("screen", toonTempScreenUrl3, this, "toonTempScreen3");
registry.registerWidget("screen", toonTempScreenUrl4, this, "toonTempScreen4");
registry.registerWidget("screen", toonTempScreenUrl5, this, "toonTempScreen5");
registry.registerWidget("screen", toonTempScreenUrl6, this, "toonTempScreen6");

//SCREEN END//
	}


	Component.onCompleted: {

		try {
            userSettingsJSON = JSON.parse(userSettingsFile.read());
            sensorCount     = userSettingsJSON['sensorCount'];
            sensorNames     = userSettingsJSON['sensorNames'].slice()
            sensorIPs       = userSettingsJSON['sensorIPs'].slice()
            sensorActive     = userSettingsJSON['sensorActive'].slice()
			
			domoticzActive  = userSettingsJSON['domoticzActive'].slice()
			domoticzURL     = userSettingsJSON['domoticzURL'];
			domoticzIDX     = userSettingsJSON['domoticzIDX'].slice()
	
        } catch(e) {
			sensorCount = 0
			sensorNames = ["a","b","c","d","e","f"]
			sensorIPs = ["192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138","192.168.10.138"]
			sensorActive = [false,false,false,false,false,false]
			domoticzActive  = [false,false,false,false,false,false]
			domoticzURL     = "http://192.168.10.18:8080"
			domoticzIDX     = [0,0,0,0,0,0]
        }
		
		lastSensor = 0
		var emptyArray = new Array(288);
		for (var i = 0; i < emptyArray.length; i++) {
		   emptyArray[i] = -99;
		}
		if (debugOutput) console.log("*********toonTemp Component.onCompleted emptyArray: " + emptyArray)
		for(var number in sensorActive){
			if (sensorActive[number]){
			    if (debugOutput) console.log("*********toonTemp Component.onCompleted writing -99 to all active databases")
				tempDATA[(number)]= [].concat(emptyArray)
				if (debugOutput) console.log("*********toonTemp Component.onCompleted written to database tempDATA[" + number + "] : " + tempDATA[(number)])
				lastSensor = number
			}
		}
		
		
		
		var todaydate = new Date()
		var todayFDate = (todaydate.getDate() + "-" + parseInt(Qt.formatDateTime(todaydate,"MM"))).toString().trim()
		
		//check if there is today data to be loaded into arrays
		try {var lastWriteDate = (toonTemp_lastWrite.read()).toString().trim() } catch(e) {}
		if (debugOutput) console.log("*********toonTemp starting to load lastwrite timestamp file: "  + lastWriteDate)
		if (lastWriteDate.length > 2 ){			
			if (debugOutput) console.log("*********toonTemp todayFDate:" + todayFDate)
			if (debugOutput) console.log("*********toonTemp lastWriteDate:" + lastWriteDate)
			if  (lastWriteDate == todayFDate){
				if (debugOutput) console.log("*********toonTemp last timestamp is from today so loading totdays arrays from file")
				for(var number in sensorActive){
					if (sensorActive[number]){
						if (number==0){
							try {var fiveminuteValuesString1 = toonTemp_fiveminuteValues1.read() ; if (fiveminuteValuesString1.length >2 ){ tempDATA[0] = fiveminuteValuesString1.split(',') }} catch(e) { }
						}
						if (number==1){
							try {var fiveminuteValuesString2 = toonTemp_fiveminuteValues2.read() ; if (fiveminuteValuesString2.length >2 ){ tempDATA[1] = fiveminuteValuesString2.split(',') }} catch(e) { }
						}
						if (number==2){
							try {var fiveminuteValuesString3 = toonTemp_fiveminuteValues3.read() ; if (fiveminuteValuesString3.length >2 ){ tempDATA[2] = fiveminuteValuesString3.split(',') }} catch(e) { }
						}
						if (number==3){
							try {var fiveminuteValuesString4 = toonTemp_fiveminuteValues4.read() ; if (fiveminuteValuesString4.length >2 ){ tempDATA[3] = fiveminuteValuesString4.split(',') }} catch(e) { }
						}
						if (number==4){
							try {var fiveminuteValuesString5 = toonTemp_fiveminuteValues5.read() ; if (fiveminuteValuesString5.length >2 ){ tempDATA[4] = fiveminuteValuesString5.split(',') }} catch(e) { }
						}
						if (number==5){
							try {var fiveminuteValuesString6 = toonTemp_fiveminuteValues6.read() ; if (fiveminuteValuesString6.length >2 ){ tempDATA[5] = fiveminuteValuesString6.split(',') }} catch(e) { }
						}
					}
				}
			}
		}
	}

	function getData(){
		lastSensor = 0
		for(var number in sensorActive){
			if (sensorActive[number]){
				lastSensor = number
			}
		}
		for(var number in sensorActive){
			if (sensorActive[number]){
				if (debugOutput) console.log("*********toonTemp sensor is active number :" + number)
				if(!domoticzActive[number]){
					readTemperature(number, sensorIPs[number])
				}else{
					if(domoticzIDX[number]>0){
						readDomoticz(number,domoticzIDX[number])
					}
				}
			}
		}
    }
	
	function readDomoticz(number, IDX) {
		if (debugOutput) console.log("*********toonTemp start readDomoticz url: " + domoticzURL + "/json.htm?type=devices&rid=" + IDX)
		var http = new XMLHttpRequest()
		http.open("GET", domoticzURL + "/json.htm?type=devices&rid=" + IDX, true)
		http.onreadystatechange = function() {
			if (http.readyState == XMLHttpRequest.DONE) {
				if (http.status === 200 || http.status === 300  || http.status === 302) {
						var JsonString = http.responseText
						if (debugOutput) console.log("*********toonTemp readDomoticz  JsonString: "  + JsonString)
						var JsonObject= JSON.parse(JsonString);

						if (debugOutput) console.log("*********toonTemp readDomoticz  JsonObject.result[0].Data: "  + JsonObject.result[0].Data)
						
						if (JsonObject.status == "OK"){
							if (debugOutput) console.log("*********toonTemp readDomoticz  JsonObject.result[0].Type.toLowerCase(): "  + JsonObject.result[0].Type.toLowerCase())
							if(JsonObject.result[0].Type.toLowerCase().indexOf("temp")>-1){
								if (debugOutput) console.log("*********toonTemp readDomoticz  JsonObject.result[0].Type.toLowerCase() found type Temp")
								units[number]="o"
								tempCurrent[number] = JsonObject.result[0].Temp
								if (tempCurrent[number]< -40 || tempCurrent[number]>100) {tempCurrent[number] = -99}
								if(JsonString.indexOf("Humidity")>-1){
									dht[number] = true
									humCurrent[number] = JsonObject.result[0].Humidity
									hidCurrent[number] = JsonObject.result[0].Temp
								}else{
									dht[number] = false
								}
							}else{
								var checkData = JsonObject.result[0].Data
								if(checkData != ""){
									tempCurrent[number] = JsonObject.result[0].Data.split(" ")[0]
									units[number]= JsonObject.result[0].Data.split(" ")[1]
									if (debugOutput) console.log("*********toonTemp readDomoticz  units[" + number + "]: "  + units[number])
								} 
							}

							if (debugOutput) console.log("*********toonTemp readTemperature  humCurrent[" + number + "]: "  + humCurrent[number])
							if (debugOutput) console.log("*********toonTemp readTemperature  hidCurrent[" + number + "]: "  + hidCurrent[number])
							if (debugOutput) console.log("*********toonTemp readTemperature  tempCurrent[" + number + "]: "  + tempCurrent[number])
							if (debugOutput) console.log("*********toonTemp readTemperature  dtime : " + dtime)
							if (debugOutput) console.log("*********toonTemp readTemperature  sensorCount: " +sensorCount)
							if (debugOutput) console.log("*********toonTemp readTemperature  number: " + number)
							if (debugOutput) console.log("*********toonTemp readTemperature  lastSensor: " + lastSensor)						
							if (number == lastSensor){
								if (debugOutput) console.log("*********toonTemp readTemperature  last sensor: " + number)
								parseData()
							}
						}else {
							if (debugOutput) console.log("*********toonTemp readTemperature  get error: " + http.status)
							tempCurrent[number] = -99
							parseData()
						}

				} else {
                   	if (debugOutput) console.log("*********toonTemp readTemperature  get error: " + http.status)
						tempCurrent[number] = -99
						parseData()
                }
			}
		}
		http.send();
	}
	
	function readTemperature(number, IPadres) {
		if (debugOutput) console.log("*********toonTemp start readtempetature url: " + "http://" + IPadres + "/temperatuur.html")
		var http = new XMLHttpRequest()
		http.open("GET", "http://" + IPadres + "/temperatuur.html", true)
		http.onreadystatechange = function() {
			if (http.readyState == XMLHttpRequest.DONE) {
				if (http.status === 200 || http.status === 300  || http.status === 302) {
						var JsonString = http.responseText
						if (debugOutput) console.log("*********toonTemp readtempetature JsonString"  + JsonString)
						var JsonObject= JSON.parse(JsonString)
						if (debugOutput) console.log("*********toonTemp readtempetature JsonObject"  + JsonObject)
						tempCurrent[number] = JsonObject.temperatuur
						if (tempCurrent[number]< -40 || tempCurrent[number]>100) {tempCurrent[number] = -99}
						if(JsonString.indexOf("luchtvochtigheid")>-1){
							dht[number] = true
							humCurrent[number] = JsonObject.luchtvochtigheid
							hidCurrent[number] = JsonObject.gecorrigeerd
						}else{
							dht[number] = false
						}
						if (debugOutput) console.log("*********toonTemp readTemperature dht[" + number + "]: "  + dht[number])
						if (debugOutput) console.log("*********toonTemp readTemperature  humCurrent[" + number + "]: "  + humCurrent[number])
						if (debugOutput) console.log("*********toonTemp readTemperature  hidCurrent[" + number + "]: "  + hidCurrent[number])
						if (debugOutput) console.log("*********toonTemp readTemperature  tempCurrent[" + number + "]: "  + tempCurrent[number])
						if (debugOutput) console.log("*********toonTemp readTemperature  dtime : " + dtime)
						if (debugOutput) console.log("*********toonTemp readTemperature  sensorCount: " +sensorCount)
						if (debugOutput) console.log("*********toonTemp readTemperature  number: " + number)
						if (debugOutput) console.log("*********toonTemp readTemperature  lastSensor: " + lastSensor)						
						if (number == lastSensor){
							if (debugOutput) console.log("*********toonTemp readTemperature  last sensor: " + number)
							parseData()
						}
				} else {
                    	if (debugOutput) console.log("*********toonTemp readTemperature  get error: " + http.status)
						tempCurrent[number] = -99
						parseData()
                }
			}
		}
		http.send();
	}
	
	
	
    Timer {
		id: scrapeTimer  //interval to get the sensor data
		interval: 30000  //30 secs
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered: {
			dateTimeNow= new Date()
			dtime = parseInt(Qt.formatDateTime (dateTimeNow,"hh") + Qt.formatDateTime (dateTimeNow,"mm"))
			var hrs = parseInt(Qt.formatDateTime(dateTimeNow,"hh"))
			var mins = parseInt(Qt.formatDateTime(dateTimeNow,"mm"))
			var minsfromfive = ((hrs-0)*60) + mins
			minsfromfiveIndex  = parseInt(minsfromfive/5)
			if (debugOutput) console.log("*********toonTemp scrapeTimer  minsfromfive : " + minsfromfiveIndex)
			if (debugOutput) console.log("*********toonTemp scrapeTimer  dtime : " + dtime)
			if (debugOutput) console.log("*********toonTemp scrapeTimer  minsfromfiveIndex : " + minsfromfiveIndex)	
			getData()
		}
    }
	
	
	Timer {
		id: writeToFileTimer   //interval to write data
		interval: 300000  //5 mins
		repeat: true
		running: true
		triggeredOnStart: false
		onTriggered: {
			if (debugOutput) console.log("*********toonTemp writeToFileTimer 5 mins timer trigger ")
			if (debugOutput) console.log("*********toonTemp writeToFileTimer dtime : " + dtime)	
			doData()
		}
    }

	function parseData(){
		if (debugOutput) console.log("*********toonTemp parsing data")
		var sensorWebText = ""
		for(var number in sensorActive){
			if (sensorActive[number]){
				if (debugOutput) console.log("*********toonTemp parseData() tempCurrent[" + number + "] : " + parseFloat(tempCurrent[number]))
				tempDATA[number][minsfromfiveIndex] = parseFloat(tempCurrent[number])
				if (debugOutput) console.log("*********toonTemp parseData() tempDATA[" + number + "][" + minsfromfiveIndex + "] : " + tempDATA[number][minsfromfiveIndex])
				temperaturesUpdated0()
				if (number == 0){temperaturesUpdated1()}
				if (number == 1){temperaturesUpdated2()}
				if (number == 2){temperaturesUpdated3()}
				if (number == 3){temperaturesUpdated4()}
				if (number == 4){temperaturesUpdated5()}
				if (number == 5){temperaturesUpdated6()}
				
				if(dht[number]){
					sensorWebText +=  sensorNames[number] + "-@@-" + tempCurrent[number] + "-@@-degr-@@-" + humCurrent[number] + "\n";
				}else{
					if ((units[number]=="0" && domoticzActive[number])||!domoticzActive[number]){
						sensorWebText +=  sensorNames[number] + "-@@-" + tempCurrent[number]+ "-@@-degr\n";
					}else{
						sensorWebText +=  sensorNames[number] + "-@@-" + tempCurrent[number]+ "-@@-" + units[number] + "\n";
					}
				}
			}
			if (debugOutput) console.log("*********toonTemp parseData() tempDATA[" + number + "] : " + tempDATA[number])
		}
			toontemp_mobile.write(sensorWebText)				    
    }



	function doData(){
		if (debugOutput) console.log("*********toonTemp dtime : " + dtime)
		if (dtime>=0 & dtime<=4){ //it is a new day, time between 00:00 and 00:04
			doDailyStuff()
		}else{
			doEachtimeStuff()
		}
    }
	

	function doEachtimeStuff(){	
	
	    if (debugOutput) console.log("*********toonTemp doEachtimeStuff : " + dtime)
		for(var number in sensorActive){
			if (sensorActive[number]){
				//Write 5minute values to file
				var tempDATAString = tempDATA[number][0]
				for (var j = 1; j <= 288; j++) { 
					tempDATAString += "," + tempDATA[number][j]
				}
				if (debugOutput) console.log("*********toonTemp doEachtimeStuff writing data : " + number )
				if (number == 0){toonTemp_fiveminuteValues1.write(tempDATAString)}
				if (number == 1){toonTemp_fiveminuteValues2.write(tempDATAString)}
				if (number == 2){toonTemp_fiveminuteValues3.write(tempDATAString)}
				if (number == 3){toonTemp_fiveminuteValues4.write(tempDATAString)}
				if (number == 4){toonTemp_fiveminuteValues5.write(tempDATAString)}
				if (number == 5){toonTemp_fiveminuteValues6.write(tempDATAString)}
			}
		}
		//Write date to file
		if (debugOutput) console.log("*********toonTemp writing data :"  + dateTimeNow.getDate() + "-" + parseInt(Qt.formatDateTime(dateTimeNow,"MM")))
		toonTemp_lastWrite.write(dateTimeNow.getDate() + "-" + parseInt(Qt.formatDateTime(dateTimeNow,"MM")))
	}
	
	function doDailyStuff(){
	    if (debugOutput) console.log("*********toonTemp doDailyStuff : " + dtime)
		
		var zeroString = "-99"
		for (var z = 1; z <= 288; z++) { 
			zeroString += "," + "-99"
		}
		for(var number in sensorActive){
			if (sensorActive[number]){
				for (var i = 0; i <= 288; i++){ //moet 288 zijn (24 uur /dag 12 x per uur (elke 5 mins))
					tempDATA[(number)][i] = -99;
					if (debugOutput) console.log("*********toonTemp doDailyStuff writing zeros : " + number )
					if (number == 0){toonTemp_fiveminuteValues1.write(zeroString)}
					if (number == 1){toonTemp_fiveminuteValues2.write(zeroString)}
					if (number == 2){toonTemp_fiveminuteValues3.write(zeroString)}
					if (number == 3){toonTemp_fiveminuteValues4.write(zeroString)}
					if (number == 4){toonTemp_fiveminuteValues5.write(zeroString)}
					if (number == 5){toonTemp_fiveminuteValues6.write(zeroString)}
				}
			}
		}	
		//Write date to file
		toonTemp_lastWrite.write(dateTimeNow.getDate() + "-" + parseInt(Qt.formatDateTime(dateTimeNow,"MM")))
	}
// ---------- Save user settings
    function saveSettings(){
		sensorCount = 0
		for(var number in sensorActive){
			if (sensorActive[number]){
				sensorCount++
			}
		}
		lastSensor = 0
		var tileString = ""
		var screenString = ""
		var signalString = ""
		for(var number in sensorActive){
			if (sensorActive[number]){
				var tilenumber = parseInt(number) + 1
				tileString += "registry.registerWidget(\"tile\", toonTemptile1Url" + tilenumber + ", this, null, {thumbLabel: qsTr(\"" + sensorNames[number] + "\"), thumbIcon: thumbnailIcon, thumbCategory: \"temperature\", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: \"center\"});\n"
				screenString += "registry.registerWidget(\"screen\", toonTempScreenUrl"  + tilenumber +  ", this, \"toonTempScreen"  + tilenumber +  "\");\n"
				signalString += "signal temperaturesUpdated"  + tilenumber +  ";\n"
				lastSensor = number
			}
		}
        var tmpUserSettingsJSON = {
            "sensorCount":      sensorCount,
            "sensorNames":      sensorNames,
            "sensorIPs":        sensorIPs,
            "sensorActive":     sensorActive,
			"domoticzActive":     domoticzActive,
			"domoticzIDX":     domoticzIDX,
			"domoticzURL":     domoticzURL,
        }
		if (debugOutput) console.log("*********toonTemp saveSettings writing json : " + JSON.stringify(tmpUserSettingsJSON));
		userSettingsFile.write(JSON.stringify(tmpUserSettingsJSON))
		if (debugOutput) console.log("*********toonTemp saveSettings ask to replace widgets : " + tileString,screenString,signalString);
		replaceWidgetSettings(tileString,screenString,signalString);
    }


// ---------- replaceWidgetSettings to name and show only active tiles
    function replaceWidgetSettings(tileString, screenString, signalString){
		var appfileString =  appFile.read()
		if (debugOutput) console.log("*********toonTemp old appfileString: " + appfileString)
		var oldappfileString = appfileString
		var oldappfilelength = appfileString.length
		var n201 = appfileString.indexOf('//TILE//') + '//TILE//'.length
		var n202 = appfileString.indexOf('//TILE END//',n201)
		if (debugOutput) console.log("*********toonTemp old WidgetSettings: " + appfileString.substring(n201, n202))
		var newappfileString = appfileString.substring(0, n201) + "\n" + tileString + "\n" + appfileString.substring(n202, appfileString.length)
		
		var n301 = newappfileString.indexOf('//SCREEN//') + '//SCREEN//'.length
		var n302 = newappfileString.indexOf('//SCREEN END//',n301)
		if (debugOutput) console.log("*********toonTemp old WidgetSettings2: " + newappfileString.substring(n301, n302))
		var newappfileString2 =newappfileString.substring(0, n301) + "\n" + screenString + "\n" + newappfileString.substring(n302, newappfileString.length)
		if (debugOutput) console.log("*********toonTemp new WidgetSettings: " + newappfileString2)
		
		var n401 = newappfileString2.indexOf('//SIGNALS//') + '//SIGNALS//'.length
		var n402 = newappfileString2.indexOf('//SIGNALS END//',n401)
		if (debugOutput) console.log("*********toonTemp old WidgetSettings3: " + newappfileString2.substring(n401, n402))
		var newappfileString3 =newappfileString2.substring(0, n401) + "\n" + signalString + "\n" + newappfileString2.substring(n402, newappfileString2.length)
		if (debugOutput) console.log("*********toonTemp new WidgetSettings: " + newappfileString3)	
		
		appFile.write(newappfileString3)
		if (debugOutput) console.log("*********toonTemp new WidgetSettings saved ")
		popupString = "Nieuwe config opgeslagen, herstart nodig" + "..." 
		tempRebootPopup.show()
		rebootTimer.running = true
    }

	Timer {
		id: rebootTimer   //interval to nicely save all and reboot
		interval: 3000
		repeat:false
		running: false
		triggeredOnStart: false
		onTriggered: {
			//restartToon()
			Qt.quit()
		}
    }
}
































































