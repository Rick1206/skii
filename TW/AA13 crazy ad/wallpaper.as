import flash.external.*;

var wallpaperState = ExternalInterface.call("returnVar","wallpaper");

videoPlayer._visible = true;
fscommand("videostop", _root.videolayer);
//修正ie9 bug
ExternalInterface.call("alittlefix");

_root.loadingMC.removeMovieClip();
_root.transBg_mc._alpha = 0;

if (nosound) {
	btn_sound.gotoAndStop(2);
}


if (wallpaperState == null) {
	closeWallpaperBtn._visible = true;
	openWallpaperBtn._visible = false;
} else {
	closeWallpaperBtn._visible = wallpaperState;
	openWallpaperBtn._visible = !wallpaperState;
}



closeWallpaperBtn.onRelease = function() {
	if (wallpaperState == true) {
		closeWallpaperBtn._visible = false;
		openWallpaperBtn._visible = true;
		wallpaperState = false;
		ExternalInterface.call("wallpaperClose");
	}
};
openWallpaperBtn.onRelease = function() {
	if (wallpaperState == false) {
		closeWallpaperBtn._visible = true;
		openWallpaperBtn._visible = false;
		wallpaperState = true;
		ExternalInterface.call("wallpaperOpen");
	}
};

openBtn.onRelease = function() {
	ExternalInterface.call("changeVarState","panel",true);
	fscommand("track", "interaction");
	fscommand("track", "btn_expand");
	fscommand("start", 1);
};
closeBtn.onRelease = function() {
	ExternalInterface.call("changeVarState","panel",false);
	ExternalInterface.call("goStatic");
	fscommand("track", "interaction");
	fscommand("track", "btn_close");
	fscommand("close", "");
};

surveyBtn.onRelease = function() {
	getURL(_root.clickSURVEY, "_blank");
	fscommand("track", "interaction");
	fscommand("track", "btn_survey");
};

function butDefine() {
	_root.video_panel_btn.onRelease = function() {
		ExternalInterface.call("changeVarState","panel",true);
		ExternalInterface.call("goAnimat");
		gotoAndPlay(2);
		fscommand("track", "interaction");
	};
	_root.sub1_panel_btn.onRelease = function() {
		ExternalInterface.call("changeVarState","panel",true);
		ExternalInterface.call("goStatic");
		gotoAndStop('sub1');
		fscommand("track", "interaction");
	};
	_root.sub2_panel_btn.onRelease = function() {
		ExternalInterface.call("changeVarState","panel",true);
		ExternalInterface.call("goStatic");
		gotoAndStop("sub2");
		fscommand("track", "interaction");
	};
	_root.sub3_panel_btn.onRelease = function() {
		ExternalInterface.call("changeVarState","panel",true);
		ExternalInterface.call("goStatic");
		gotoAndStop("sub3");
		fscommand("track", "interaction");
	};

}

