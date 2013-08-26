System.security.allowDomain(domain);
import flash.external.ExternalInterface;

var openTAG, openTAG1, clickTAG1:String;

expClick.onRelease = function() {
	getURL(openTAG, "_blank");
//	ExternalInterface.call("EXPbtn_call('open_click')");
};
expClick1.onRelease = function() {
	// 有第二個連結時的寫法，依此類推
	getURL(openTAG1, "_blank");
//	ExternalInterface.call("EXPbtn_call('open_click',1)");
};
mntlClick.onRelease = function() {
	getURL(clickTAG, "_blank");
//	ExternalInterface.call("MNTLbtn_call('mntl_click')");
};
btnClose.onRelease = function() {
	ExternalInterface.call("STARS_CRZYSWF_call('close')");
};
function crazyEnd() {
	ExternalInterface.call("STARS_CRZYSWF_call('end')");
}
ffClick.onRelease = function() {
	ExternalInterface.call("STARS_CRZYSWF_call('ff_close')");
};

var myBrowser:String;
if (myBrowser != "ie" && myBrowser != "ie9")  {
	ffClick._visible = 1;
}else{
	ffClick._visible = 0;
}
stop();
