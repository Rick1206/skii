System.security.allowDomain(domain);
import flash.external.ExternalInterface;

var openTAG, closeTAG:String;

btnOpen.onRelease = function() {
	ExternalInterface.call("EXPbtn_call('btn_exp_open')");
};
btnClose.onRelease = function() {
	ExternalInterface.call("EXPbtn_call('btn_exp_close')");
};
clickOpen.onRelease = function() {
	getURL(openTAG, "_blank");
//	ExternalInterface.call("EXPbtn_call('open_click')")
};
clickOpen1.onRelease = function() {
	// 有第二個連結時的寫法，依此類推
	getURL(openTAG1, "_blank");
//	ExternalInterface.call("EXPbtn_call('open_click',1)")
};
clickClose.onRelease = function() {
	getURL(closeTAG, "_blank");
//	ExternalInterface.call("EXPbtn_call('close_click')")
};
clickClose1.onRelease = function() {
	// 有第二個連結時的寫法，依此類推
	getURL(closeTAG1, "_blank");
//	ExternalInterface.call("EXPbtn_call('close_click',1)")
};

stop();