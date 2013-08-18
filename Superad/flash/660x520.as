function showOpen() {
	_root.stop();
	fscommand("videomuteoff", _root.videolayer);
	fscommand("videostop", _root.videolayer);
	videoPlayer._visible = false;
	nosound = false;
	videoToggle.gotoAndStop(1);
}
function playDelay() {
	play();
	clearInterval(playDelayID);
}
function adxOnVideoStatus(s) {
	if (s == "done") {
		videoToggle.gotoAndStop(2);
	//	if (nosound) {
	//		fscommand("close", "");
	//	}
	}
}
stop();
playDelayID = setInterval(this, "playDelay", 10);



