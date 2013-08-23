import flash.external.*;
var wallpaperState = ExternalInterface.call("returnVar","wallpaper");
ExternalInterface.call("init");
//修正ie9 bug
ExternalInterface.call("alittlefix");
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