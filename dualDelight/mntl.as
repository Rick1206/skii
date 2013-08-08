System.security.allowDomain(domain);
import flash.external.ExternalInterface;

var clickTAG, clickTAG1, surveyTAG:String;

btnClick.onRelease = function() {
	getURL(clickTAG, "_blank");
//	ExternalInterface.call("MNTLbtn_call('mntl_click')")
};
btnClick1.onRelease = function() {
	// 有第二個連結時的寫法，依此類推
	getURL(clickTAG1, "_blank");
//	ExternalInterface.call("MNTLbtn_call('mntl_click',1)")
};
btnReplay.onRelease = function() {
	ExternalInterface.call("MNTLbtn_call('btn_mntl_replay')");
};
btnSurvey.onRelease = function() {
	ExternalInterface.call("MNTLbtn_call('survey')")
	getURL(surveyTAG, "_blank");
};

function done() {
	ExternalInterface.call("MNTLbtn_call('btn_mntl_done')");
}

stop();