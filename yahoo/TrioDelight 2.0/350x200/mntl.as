System.security.allowDomain(domain);
import flash.external.ExternalInterface;

var clickTAG, clickTAG1, surveyTAG:String;

function initMovie() {
	//播放影片, 請注意物件名稱為"movieMC"
	//fscommand("loadMovie", "loadMovie");
	ExternalInterface.call("MNTLbtn_call('loadMovie')");
	with (movieMC) {
		my_failure._visible = false;
		my_detect._visible = true;
		iconPlay.btnpause._visible = false;
		iconPlay.btnplay._visible = true;
		iconSound.stop();
		movieType.stop();
		YADTV_con.iconSound.stop();
		YADTV_con.play_mc.stop();
	}
	/*
	clip1 = 4600;
	clip2 = 6700;
	clip3 = 11400;
	clip4 = 16100;
	clip5 = 27700;
	countCrazy = function () {
		if (movieMC) {
			if (myTime>=this["clip"+t] && t<=5) {
				fscommand("crazy", t);
				clearInterval(myTime_intervalID);
				t++;
				myTime_intervalID = setInterval(this, "countCrazy", 1);
			}
		} else {
			clearInterval(myTime_intervalID);
		}
	};
	myTime = 0;
	var t = 1;
	myTime_intervalID = setInterval(this, "countCrazy", 1);
	*/
}
btnClick.onRelease = function() {
	getURL(clickTAG, "_blank");
//	ExternalInterface.call("MNTLbtn_call('mntl_click')");
};
btnClick1.onRelease = function() {
	// 有第二個連結時的寫法，依此類推
	getURL(clickTAG1, "_blank");
//	ExternalInterface.call("MNTLbtn_call('mntl_click',1)");
};
btnReplay.onRelease = function() {
	ExternalInterface.call("MNTLbtn_call('btn_mntl_replay')");
};
btnSurvey.onRelease = function() {
	ExternalInterface.call("MNTLbtn_call('survey')");
	getURL(surveyTAG, "_blank");
};
stop();

function movieStart() {
	ExternalInterface.call("MNTLbtn_call('movieStart')");
}
