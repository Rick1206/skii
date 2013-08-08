import flash.external.*;
System.security.allowDomain("*");
stop();

this.onEnterFrame=function(){
	var loadedper_num=Math.floor(this.getBytesLoaded()/this.getBytesTotal()*100)
	
	if(loadedper_num>=100){

			ExternalInterface.call("changeVarState","same",true);
			ExternalInterface.call("init");
			nextFrame();
			delete this.onEnterFrame;		
		}
	}