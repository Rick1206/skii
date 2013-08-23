import flash.external.*;
System.security.allowDomain("*");
ExternalInterface.call("browserHack");
stop();

	function aChangeScreen1() {
		this.gotoAndStop("static");
		this.creative_mc.gotoAndStop("end");
	}

	function aChangeScreen3() {
		this.gotoAndStop("begin");
	}

	function aChangeScreen2(location,time) {
		this.gotoAndStop("animat");

		switch (location) {
			case "auto" :
				playDelayID = setInterval(this, "playDelay", time);
				break;
			case "start" :
				playDelayID = setInterval(this, "playDelay", time);
				break;
			case "end" :
				playDelayID = setInterval(this, "playDelay1", time);
				break;
			case "begin" :
				this.creative_mc.gotoAndStop(1);
				break;
			default :
				break;
		}
	}
	

	
	if (ExternalInterface.available) {

		
		ExternalInterface.addCallback("aChangeScreen3",this,aChangeScreen3);
		ExternalInterface.addCallback("aChangeScreen2",this,aChangeScreen2,location,time);
		ExternalInterface.addCallback("aChangeScreen1",this,aChangeScreen1);

	} else {
		//alert.text = "無法使用";
	}

	function playDelay() {
		this.creative_mc.gotoAndPlay("start");
		clearInterval(playDelayID);
	}
	function playDelay1() {
		this.creative_mc.gotoAndStop("end");
		clearInterval(playDelayID);
	}

	