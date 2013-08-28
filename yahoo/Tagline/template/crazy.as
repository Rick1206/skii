import flash.external.*;

if (_root.my_browser != "ie") {
	ffClickc._visible = 1;
} else {
	ffClickc._visible = 0;
}


ffClickc.onRelease = function() {
	ExternalInterface.call("addnum");
	fscommand("track", "interaction");
	fscommand("track", "ff_backarea_closeCrazy");
	fscommand("close", 4);
	
};
closeTab_btn.onRelease=function(){
	ExternalInterface.call("addnum");
	fscommand("track", "interaction");
	fscommand("track", "crazybtn_closeCrazy");
	fscommand("close", 4);
	
	}
	
openPanel_btn.onRelease=function(){
	ExternalInterface.call("openpanel");
	fscommand("track", "interaction");
	fscommand("track", "crazybtn_expandPanel");

	}