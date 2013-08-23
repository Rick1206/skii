import caurina.transitions.Tweener;
import flash.external.*;
System.security.allowDomain("*");
ExternalInterface.call("alittlefix");

var maskFinish = false;
var n = 0;
var video_count = 0;
var time, cnum, nextTime, timeLoop;
var panelOpenState=false;
var changeSubButton:Array = ["video_panel_btn", "sub1_panel_btn", "sub2_panel_btn", "sub3_panel_btn"];


if (nosound){
	panelOpenState=false
	}else{
		panelOpenState=true
		}


if (_root.noVideo)
{
	this.onEnterFrame = function()
	{
		if (maskFinish == true)
		{
			if (nosound)
			{
				cnum = 0;
				nextTime = 10;
				startit();
				delete this.onEnterFrame;
			}

		}
	}
}

function startit()
{
	timeLoop = setInterval(ctime, 1000);
}
function ctime()
{
	if (_root.noVideo)
	{
		cnum++;
		if (cnum >= nextTime)
		{
			playCount();
			cnum = 0;
		}
	}
}
function pauseit()
{
	clearInterval(timeLoop);
}



//////////////////////////////////////



function showSub(a)
{
	pauseit();
	_root.creative_mc.transBg_mc._alpha = 100;
	if (!_root.creative_mc.transBg_mc.loadingMC)
	{
		_root.creative_mc.transBg_mc.attachMovie("loadingMC","loadingMC",this.getNextHighestDepth(),{_x:478, _y:315, _alpha:50});
	}
	if (n != a)
	{
		_root.creative_mc.creative_main_mc.stop();
		_root.creative_mc.creative_main_mc._visible = false;
		fscommand("videostop", _root.videolayer);
		this["movie" + a] = this["movie" + a] == undefined ? "mosaic_template_950x630_sub" + a + ".swf" : this["movie" + a];
		_root.video_attach_mc.videoMC._visible = false;
		_root.creative_mc.video_panel_btn.enabled = true;
		_root.nosound = false;
		_root.creative_mc.subMovie.unloadMovie();
		_root.creative_mc.subMovie.loadMovie(this["movie" + a],"embed1");
		_root.creative_mc.subMovie._alpha = 0;
		_root.creative_mc.subMovie._visible = true;
		changeBtnState("sub" + a + "_panel_btn");
		//myTween = new Tween(_root.creative_mc.subMovie, "_alpha", easeOut, 0, 100, 10, false);

		Tweener.addTween(_root.creative_mc.subMovie,{_alpha:100, time:1, onComplete:function ()
		{
		_root.creative_mc.transBg_mc.loadingMC.removeMovieClip();
		}});
		fscommand("track", this["customEvent" + a]);
		_root.n = a;
	}

}

function showVideo()
{
	if (!_root.noVideo)
	{
		this.onEnterFrame = function()
		{

			if (_root.maskFinish == true)
			{

				if (!_root.video_attach_mc.videoMC)
				{
					_root.video_attach_mc.attachMovie("videoMC","videoMC",this.getNextHighestDepth(),{_x:0, _y:0});
				}
				else
				{
					_root.video_attach_mc.videoMC._visible = true;
				}

				if (!_root.video_attach_mc.videoMC.loadingMC && video_count == 0)
				{

					_root.video_attach_mc.videoMC.attachMovie("loadingMC","loadingMC",this.getNextHighestDepth() - 1);
					video_count = 1;

					with (_root.video_attach_mc.videoMC.loadingMC)
					{
						_x = _root.video_attach_mc.videoMC.videoPlayer._x + (_root.video_attach_mc.videoMC.videoPlayer._width / 2);
						_y = _root.video_attach_mc.videoMC.videoPlayer._y + (_root.video_attach_mc.videoMC.videoPlayer._height / 2);
						_alpha = 50;
						_visible = true;
					}
				}
				_root.video_attach_mc.videoMC.videoControl.btn_sound.gotoAndStop(1);
				_root.creative_mc.creative_main_mc._visible = true;

				//myTween = new Tween(_root.creative_mc, "_alpha",easeOut,0, 100, 10, false);

				_root.video_attach_mc.videoMC._visible = true;
				_root.video_attach_mc.videoMC.videoControl._visible = true;
				_root.creative_mc.subMovie._visible = false;
				_root.creative_mc.video_panel_btn.enabled = false;
				fscommand("videoplay", _root.videolayer);
				fscommand("videomuteoff", _root.videolayer);
				_root.video_attach_mc.videoMC.videoControl.videoToggle.gotoAndStop(1);
				_root.video_attach_mc.videoMC.video_btn._width = _root.video_attach_mc.videoMC.videoPlayer._width;
				_root.video_attach_mc.videoMC.video_btn._height = _root.video_attach_mc.videoMC.videoPlayer._height;
				changeBtnState("video_panel_btn");
				_root.video_attach_mc.videoMC.video_btn.onRelease = function()
				{
					getURL(_root.clickTAG, "_blank");
				};
				if (_root.nosound)
				{
					_root.video_attach_mc.videoMC.videoControl.btn_sound.gotoAndStop(2);
				}
				delete this.onEnterFrame;
			}
		};

	}
	else
	{
		_root.creative_mc.video_panel_btn.enabled = false;
		_root.creative_mc.creative_main_mc._visible = true;
		_root.creative_mc.subMovie._visible = false;
		changeBtnState("video_panel_btn");
	}
}


function adxOnVideoStatus(s)
{

	if (s == "start")
	{
		if (_root.video_attach_mc.videoMC.loadingMC)
		{
			_root.video_attach_mc.videoMC.loadingMC._visible = false;
			_root.video_attach_mc.videoMC.loadingMC.removeMovieClip();

		}
	}
	else if (s == "done")
	{
		_root.video_attach_mc.videoMC.videoControl.videoToggle.gotoAndStop(2);
		if (_root.nosound)
		{
			goClose();
		}
	}
}
//按鈕初始化
function butDefine()
{
	with (_root.creative_mc.transBg_mc)
	{
		_x = 0;
		_y = 0;
		_width = 950;
		_height = 630;
		_alpha = 0;
	}
	subMenuButDefine();
	_root.creative_mc.btnSurvey.onRelease = function()
	{
		getURL(_root.clickSURVEY, "_blank");
		fscommand("track", "interaction");
		fscommand("track", "btn_survey");
	};
	_root.creative_mc.btnClose.onRelease = function()
	{
		goClose();
		allStop(5);
		
		fscommand("track", "interaction");
		fscommand("track", "btn_close");
		fscommand("videostop", _root.videolayer);
	};


	if (_root.nosound)
	{

		for (i = 0; i < changeSubButton.length; i++)
		{
			var target = eval("_root.creative_mc." + changeSubButton[i]);
			//target._visible = false;
		}

		_root.expadoBtn.onRelease = function()
		{
			fscommand("track", "interaction");
			fscommand("track", "btn_panelExp_click");
			fscommand("start", 5);
			fscommand("videomuteoff", 0);
			clearTimeout(time);
			_root.video_attach_mc.videoMC.videoControl.btn_sound.gotoAndStop(1);
			expandoClick();

		};

		_root.expadoBtn.onRollOver = function()
		{
			fscommand("track", "interaction");
			fscommand("track", "btn_panelExp_over");
			
			pauseit();
			_root.btn_mc.hit_mc._visible = true;
			_root.expandoMask1_mc._visible = true;
			_root.expandoMask1_mc._x = 320;
			_root.expandoMask2_mc._visible = true;
			_root.expandoMask2_mc._x = 320;
			_root.mask_open_mc._visible = false;

			_root.creative_mc.setMask("expandoMask1_mc");
			_root.btn_mc.setMask("expandoMask2_mc");
			time = setTimeout(function ()
			{
				expandoMouseOver();
			}, 3000);
			Tweener.addTween(_root.expandoMask1_mc,{_x:290, _width:660, time:1.5, transition:"easeOutElastic", onComplete:function ()
			{
			
			}});
			Tweener.addTween(_root.expandoMask2_mc,{_x:290, _width:660, time:1.5, transition:"easeOutElastic", onComplete:function ()
			{
			
			}});
			Tweener.addTween(_root.expandoMask1_mc,{_x:310, _width:640, time:1.5, delay:1.5, transition:"easeInElastic", onComplete:function ()
			{
			
			}});
			Tweener.addTween(_root.expandoMask2_mc,{_x:310, _width:640, time:1.5, delay:1.5, transition:"easeInElastic", onComplete:function (){}});
			Tweener.addTween(_root.btn_mc.hit_mc,{_alpha:50, _x:0, _width:950, time:1, transition:"line", onStart:function (){this._alpha = 0;}});
			Tweener.addTween(_root.btn_mc.tab_mc,{_alpha:0,_x:200, time:1, transition:"line", onStart:function (){}});
			

		};
		_root.expadoBtn.onRollOut = function()
		{
			clearTimeout(time);
			startit();
			_root.expandoMask1_mc._visible = true;
			_root.expandoMask2_mc._visible = true;
			_root.mask_open_mc._visible = false;
			_root.creative_mc.setMask("expandoMask1_mc");
			_root.btn_mc.setMask("expandoMask2_mc");
			Tweener.addTween(_root.expandoMask1_mc,{_x:315, _width:635, time:1.5, onComplete:function (){}});
			Tweener.addTween(_root.expandoMask2_mc,{_x:315, _width:635, time:1.5, onComplete:function (){}});
			Tweener.addTween(_root.btn_mc.hit_mc,{_alpha:0, _x:315, _width:25, time:1.5, onStart:function (){this._alpha = 50;}, onComplete:function (){_root.btn_mc.hit_mc._visible = false;}});
		    Tweener.addTween(_root.btn_mc.tab_mc,{_x:315,_alpha:50, time:1,delay:0.5,  onStart:function (){this._x=300}});
		};
	}
	else
	{
		_root.expadoBtn._visible = false;
		subMenuButDefine();
	}
}

function changeBtnState(Obj)
{
	var targetSubObj = eval("_root.creative_mc." + Obj);
	for (i = 0; i < changeSubButton.length; i++)
	{
		var target = eval("_root.creative_mc." + changeSubButton[i]);
		target.enabled = true;
		target.gotoAndStop("up");
	}
	targetSubObj.enabled = false;
	targetSubObj.gotoAndStop("down");
}

function subMenuButDefine()
{

	for (i = 0; i < changeSubButton.length; i++)
	{
		var target = eval("_root.creative_mc." + changeSubButton[i]);
		//target._visible = true;
		Tweener.addTween(target,{_alpha:100, time:1, onStart:function ()
		{
		this._visible = true;
		this._alpha = 0;
		}, onComplete:function ()
		{
		
		}});
		target.hitArea = target.hitarea_mc;
		target.onRollOver = function()
		{
			this.gotoAndStop("over");
		};
		target.onRollOut = function()
		{
			this.gotoAndStop("up");
		};
	}

	_root.creative_mc.sub1_panel_btn.onRelease = function()
	{
		_root.showSub(1);
		fscommand("start", 5);
		if(panelOpenState!=true){
			expandoClick();
			panelOpenState=true;
			}
		
		fscommand("track", "interaction");
	};
	_root.creative_mc.sub2_panel_btn.onRelease = function()
	{
		_root.showSub(2);
		fscommand("start", 5);
		if(panelOpenState!=true){
			expandoClick();
			panelOpenState=true;
			}
		
		fscommand("track", "interaction");
	};
	_root.creative_mc.sub3_panel_btn.onRelease = function()
	{
		_root.showSub(3);
		fscommand("start", 5);
		if(panelOpenState!=true){
			expandoClick();
			panelOpenState=true;
			}
		
		fscommand("track", "interaction");
	};
	_root.creative_mc.video_panel_btn.onRelease = function()
	{
		_root.creative_mc.transBg_mc._alpha = 0;
		_root.showVideo();
		fscommand("start", 5);
		if(panelOpenState!=true){
			expandoClick();
			panelOpenState=true;
			}
		_root.n = 0;
		fscommand("track", "interaction");
	};

}

function creativeLight()
{
	var num = 0;
	for (i = 0; i <= 2; i++)
	{
		for (j = 0; j <= 1; j++)
		{
			if (i == 1)
			{
				attach_mc.attachMovie("mask_1_mc","attach_" + num + "_mc",10 * i + j,{_x:315, _y:315 * j});
			}
			else
			{
				if (i == 2)
				{
					attach_mc.attachMovie("mask_2_mc","attach_" + num + "_mc",10 * i + j,{_x:635, _y:315 * j});
				}
				else
				{
					attach_mc.attachMovie("mask_2_mc","attach_" + num + "_mc",10 * i + j,{_x:315 * i, _y:315 * j});
				}
			}
			num += 1;
		}
	}
}
function adIn()
{
	stop();
	_root.mask_open_mc._visible = false;
	_root.mask_close_mc._visible = false;
	_root.expandoMask1_mc._visible = false;
	_root.expandoMask2_mc._visible = false;
	_root.expadoBtn._visible = false;
	_root.btn_mc.hit_mc._visible = false;
	_root.btn_mc.tab_mc._visible = false;
	attach_mc.removeMovieClip();
	_root.creative_mc.setMask("mask_open_mc");
	creativeLight();
	
}
function goStart(){
	maskFinish=true;
	if(_root.nosound){
		_root.btn_mc.tab_mc._visible = true;
		_root.expadoBtn._visible = true;
		Tweener.addTween(_root.btn_mc.tab_mc,{_alpha:50, time:1,  onStart:function (){this._alpha=0;this._x=315;}});
		Tweener.addTween(_root.expadoBtn,{_alpha:100, time:1,  onStart:function (){this._alpha=0}});
		} 
}
	
function goClose(){
	_root.gotoAndStop("end");
	_root.expadoBtn._visible = false;
	_root.btn_mc.hit_mc._visible = false;
	_root.btn_mc.tab_mc._visible = false;
	_root.video_attach_mc.videoMC._visible = false;
}
	
function adOut()
{
	stop();
	attach_mc.removeMovieClip();
	_root.expandoMask1_mc._visible = false;
	_root.expandoMask2_mc._visible = false;
	_root.mesk_close_mc._visible = true;
	creative_mc.setMask("mask_close_mc");
	creativeLight();
}
function expandoMouseOver()
{
	startit();
	fscommand("track", "interaction");
	fscommand("track", "imp_950x630");
	fscommand("start", 5);
	_root.expadoBtn.enabled = false;
	_root.nosound = false;
	_root.mask_open_mc._visible = false;
	_root.mask_close_mc._visible = false;
	_root.expandoMask1_mc._visible = true;
	_root.expandoMask2_mc._visible = true;
	_root.expandoMask1_mc._x = 320;
	_root.expandoMask2_mc._x = 320;
	_root.creative_mc.setMask("expandoMask1_mc");
	_root.btn_mc.setMask("expandoMask2_mc");
	Tweener.addTween(_root.btn_mc.hit_mc,{_alpha:0, _width:630, _x:-200, time:1, onStart:function ()
	{
	
	}, onComplete:function ()
	{
	_root.btn_mc.hit_mc._visible = false;
	}});
	Tweener.addTween(_root.expadoBtn,{_x:-200, _alpha:0, time:0, onComplete:function ()
	{
	_root.expadoBtn._visible = false;
	}});
	Tweener.addTween(expandoMask1_mc,{_x:0, _width:950, time:2, transition:"easeOutBack", onComplete:function ()
	{
	
	}});
	Tweener.addTween(expandoMask2_mc,{_x:0, _width:950, time:2, transition:"easeOutBack", onComplete:function ()
	{
	
	}});
}
function expandoClick()
{	
	pauseit();
	_root.expadoBtn.enabled = false;
	_root.nosound = false;
	_root.mask_open_mc._visible = false;
	_root.mask_close_mc._visible = false;
	_root.expandoMask1_mc._visible = true;
	_root.expandoMask2_mc._visible = true;
	_root.expandoMask1_mc._x = 320;
	_root.expandoMask2_mc._x = 320;
	_root.creative_mc.setMask("expandoMask1_mc");
	_root.btn_mc.setMask("expandoMask2_mc");

	Tweener.addTween(_root.btn_mc.hit_mc,{_alpha:0, _width:950, _x:0, time:1, onStart:function (){}, onComplete:function (){_root.btn_mc.hit_mc._visible = false;}});
	Tweener.addTween(_root.expadoBtn,{_x:-200, _alpha:0, time:0, onComplete:function ()
	{
	_root.expadoBtn._visible = false;
	}});
	Tweener.addTween(expandoMask1_mc,{_x:0, _width:950, time:2, transition:"line", onComplete:function ()
	{
	
	}});
	Tweener.addTween(expandoMask2_mc,{_x:0, _width:950, time:2, transition:"line", onComplete:function ()
	{
	
	}});
	Tweener.addTween(_root.btn_mc.tab_mc,{_alpha:0,_x:0, time:1, transition:"line", onStart:function (){this.btn_mc.tab_mc._visible=false;}});
}

function playCount()
{
	goClose();
	clearInterval(timeLoop);
}

function allStop(MaxD) {
	var maxDepth = MaxD;
	var nowDepth = 0;
	var rootMap:Array = [this];
	var tmpMap:Array = new Array();
	while (nowDepth < maxDepth) {
		var tmpRoot;
		var maxLength = rootMap.length;
		var tmpNum = 0;
		for (len = 0; len < maxLength; len++) {
			for (var i in rootMap[len]) {
				if (typeof (rootMap[len][i]) == "movieclip") {
					tmpMap.push(rootMap[len][i]);
				}
			}
			if (len == maxLength - 1) {
				for (var j = 0; j < tmpMap.length; j++) {
					rootMap[j] = tmpMap[j];
				}
				nowDepth++;
			}
		}
		if (nowDepth == maxDepth) {
			tmpMap.splice(0);
			for(var k=0;k<rootMap.length;k++){
				rootMap[k].stop()
			}
		}
	}
}


function allPlay(MaxD) {
	var maxDepth = MaxD;
	var nowDepth = 0;
	var rootMap:Array = [this];
	var tmpMap:Array = new Array();
	while (nowDepth < maxDepth) {
		var tmpRoot;
		var maxLength = rootMap.length;
		var tmpNum = 0;
		for (len = 0; len < maxLength; len++) {
			for (var i in rootMap[len]) {
				if (typeof (rootMap[len][i]) == "movieclip") {
					tmpMap.push(rootMap[len][i]);
				}
			}
			if (len == maxLength - 1) {
				for (var j = 0; j < tmpMap.length; j++) {
					rootMap[j] = tmpMap[j];
				}
				nowDepth++;
			}
		}
		if (nowDepth == maxDepth) {
			tmpMap.splice(0);
			for(var k=0;k<rootMap.length;k++){
				rootMap[k].play()
			}
		}
	}
}
