import flash.external.*;
System.security.allowDomain("*");
import mx.transitions.Tween;

ExternalInterface.call("fixAdxbug");
var adxState = ExternalInterface.call("returnVar","adxbug");
//修正ie9 bug
ExternalInterface.call("alittlefix");

stop();

var page = 0;
var loader:MovieClipLoader = new MovieClipLoader();
var loadListener:Object = new Object();
loader.addListener(loadListener);

if (!_root.loadingMC) {
	_root.attachMovie("loadingMC","loadingMC",this.getNextHighestDepth(),{_x:Stage.width/2, _y:Stage.height/2, _alpha:30});
}

if (!adxState) {
	if (nosound) {
		fscommand("start", 5);
		ExternalInterface.call("changeVarState","panel",true);
		ExternalInterface.call("firefoxHack");
	}
}

playDelayID = setInterval(this, "playDelay", 1200);

function playDelay() {
	
	this.onEnterFrame = function() {

		var Same = ExternalInterface.call("returnVar","same");
		if (Same) {
			if (!adxState) {
				if (nosound) {
					ExternalInterface.call("changeVarState","auto",true);
				}
			}
			ExternalInterface.call("goAnimat");
			play();
			startPlay();
			delete this.onEnterFrame;
		}
	};
	clearInterval(playDelayID);
}

function startPlay() {
	if (_root.noVideo) {
		if (!adxState) {
			if (nosound) {
				playCountID = setInterval(playCount, 11000);
			}
		}
	}
}


function playCount() {
	ExternalInterface.call("changeVarState","panel",false);
	ExternalInterface.call("goStatic");
	fscommand("close", "");
	clearInterval(playCountID);
}




function showSub(a) {
	_root.stop();
	subMovie._alpha = 0;
	subMovie._visible = true;
	videoPlayer._visible = false;
	fscommand("videomuteoff", _root.videolayer);
	fscommand("videostop", _root.videolayer);
	this["movie"+a] = (this["movie"+a] == undefined) ? "template_flash_970x315_sub"+a+".swf" : this["movie"+a];
	loader.loadClip(this["movie"+a],subMovie);
	fscommand("track", this["customEvent"+a]);

	myTween = new Tween(_root.subMovie, "_alpha", easeOut, 0, 100, 10, false);

	page = a;
	nosound = false;

	loadListener.onLoadStart = function() {

		with (_root.transBg_mc) {
			_width = Stage.width;
			_height = Stage.height;
			_alpha = 100;
		}
		
		if (!_root.loadingMC) {
			_root.attachMovie("loadingMC","loadingMC",this.getNextHighestDepth(),{_x:Stage.width/2, _y:Stage.height/2, _alpha:50});
		}
	}
	loadListener.onLoadComplete = function() {
		_root.loadingMC.removeMovieClip();
	}
}

function adxOnVideoStatus(s) {
	if (s == "done") {
		videoToggle.gotoAndStop(2);
		if (nosound) {
			ExternalInterface.call("changeVarState","panel",false);
			ExternalInterface.call("goStatic");
			fscommand("close", "");
		}
	}
}