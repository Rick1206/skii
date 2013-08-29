import flash.external.*;
var playvideo;

this.onEnterFrame=function(){
	var num=ExternalInterface.call("closetab")
	if(num){
		_root.gotoAndStop("video");
		ExternalInterface.call("openpanel")
		delete this.onEnterFrame;
		}
	}

banner.onEnterFrame = function() {
	var num = ExternalInterface.call("getnum");

	if (num) {
		banner.gotoAndPlay("close_auto");
		ExternalInterface.call("addnum");
		delete this.onEnterFrame;
	}
}

//tagMC
function showBanner(){
	
	var fq=ExternalInterface.call("checkCookie");
	
	if (fq>1) {
		_root.banner.stop();
		fq--;
		setTimeout(function(){_root.gotoAndStop("tab");},500)
	
	} else {
		stop();
		fscommand("track", "show_banner");
		fscommand("start", 2);
		fscommand("close", 3);
		fscommand("start", 4);
	}
	ExternalInterface.call("crop",120);
	_root.videoMC._visible = false;
}


//OpeningMC
function closeBanner(){
	stop();
	fscommand("close", 4);
	
	if (playvideo==true) {
		_root.gotoAndStop("video");
	} else {

		_root.banner.gotoAndPlay("close_auto");
	}
}

function showTab(){
	stop();
	_root.playvideo = true;
	_root.videoMC._visible = false;
	fscommand("track", "show_tab");
	ExternalInterface.call("crop",24);
	fscommand("close", 2);
	fscommand("start", 3);
	fscommand("close", 4);
}

function showPanel(){
	stop();
	fscommand("track", "show_panel");
	ExternalInterface.call("crop",950);
	fscommand("close", 2);
	fscommand("close", 3);
	fscommand("close", 4);
}

function butDefine() {
	var timer;

	_root.tab.tab_open.onRollOver=function(){
    	timer=setTimeout(function(){
    fscommand("track", "interaction");
	fscommand("track", "tabbtn_expandCrazyAndBanner");
	gotoAndPlay(2);
					 },500)
	}
	_root.tab.tab_open.onRollOut=function(){
	clearTimeout(timer)
	}
}


//creativeMC
function showSub(a) {
	_root.panel.stop();
	_root.videoMC._visible = false;
	_root.panel.videoControl._visible = false;
	_root.panel.panelMC._visible = false;
	fscommand("videostop", _root.videolayer);
	this["movie"+a] = (this["movie"+a] == undefined) ? "sub"+a+".swf" : this["movie"+a];
	_root.panel.subMovie.loadMovie(this["movie"+a],"embed1");
	fscommand("track", this["customEvent"+a]);
	_root.panel.subMovie._visible = true;
}

function showVideo() {
	_root.panel.stop();
	if (!videoMC) {
		_root.attachMovie("videoMC","videoMC",this.getNextHighestDepth(),{_x:0, _y:0});
	} else {
		_root.videoMC._visible = true;
	}
	_root.videoMC._visible = true;
	_root.panel.videoControl._visible = true;
	_root.panel.videoControl.btn_sound.gotoAndStop(2);
	_root.panel.panelMC._visible = true;
	_root.panel.subMovie._visible = false;
	fscommand("videoplay", _root.videolayer);
	fscommand("videomuteon", _root.videolayer);
	
}

function adxOnVideoStatus(s) {
	if (s == "done") {
		panel.videoControl.videoToggle.gotoAndStop(2);
	} 
}

//IE
if (_root.my_browser != "ie") {
	ffClick._visible = 1;

} else {
	ffClick._visible = 0;

}

ffClick.onRelease = function() {
	_root.videoMC._visible = false; 
	fscommand("videostop", _root.videoBanner.videolayer);
	fscommand("track", "interaction");
	fscommand("track", "ff_area_closePanel");
	panel.gotoAndPlay("close");
	
};

