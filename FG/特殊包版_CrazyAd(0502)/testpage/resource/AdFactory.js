var AdToday=new Date();var NNAdSrcs=new Array("ad3");var NAdImgSrc="ad3.fashionguide.com.tw";var RndNu=Math.floor(Math.random()*1000000);var ridx=Math.floor(Math.random()*NNAdSrcs.length);var NAdSrc=NNAdSrcs[ridx];var isSend=false;var xmlHttp;var AdMap={};var MapRnIdx=Math.floor(Math.random()*210);var Chans={1:["www","p"],2:["blog","p"],3:["video","p"],5:["ad","p"],6:["events","p"],9:["bid","a"],12:["member","p"],13:["beautynews","p"],15:["officialweb","p"],18:["skin","p"],19:["hair","p"],20:["fgcash","p"],22:["buy","p"],23:["sale","p"],24:["style","p"],26:["forum","p"],28:["fit","p"],30:["news","p"],31:["fgmagazine","p"],32:["search","p"],33:["active","p"],34:["diet","p"]};var theChan="www";var ChanIdx=0;for(k in Chans){var chkchan;chkchan=Chans[k][0];if(chkchan=="ad"&&(document.domain.indexOf("ad3")==0||document.domain.indexOf("adm3")==0)){theChan=chkchan;ChanIdx=k;}else if(document.domain.indexOf(chkchan)!=-1){if(chkchan.indexOf(".")==-1){var all_url=chkchan+'.fashionguide.com.tw';if(document.domain==all_url){theChan=chkchan;ChanIdx=k;}}else{theChan=chkchan;ChanIdx=k;}}}
if(theChan=="www"){document.write("<div style=\"height:0px;width:0px;\"><img src=\"http://"+NAdSrc+".fashionguide.com.tw/rec.php?rnd="+RndNu+"\" width=\"0\" height=\"0\"/></div>");}
function AdBeautyNiceAlert(){alert('● FG網友評鑑滿意度標章\r\r網友在 【FG投票評鑑】 &【FG市調報告】中，針對商品作滿意度票選。我們\r以綜合性指標來計算網友票選的結果，當票選滿意度達到後，就會獲得【特優】\r或【優選】的星型標章喔！\r\r未來只要大家看到商品獲得這個標章，就代表是由FG網友票選出來的優質商品 ^^\r\r【特優】-網友票選綜合性指標達成8成滿意度\r【優選】-網友票選綜合性指標達成7成滿意度');}
var Ls={};function showNAdById(adLoc,Fix,AdN){var Locs=adLoc.replace("ad","").split("-");var Loc=Locs[0];var Block=Locs[1];try{if(typeof(Ls[Loc])=="undefined"){var L=eval("new "+Loc+"("+Block+")");if(typeof(Fix)!="undefined"){L.fix=Fix;}
if(typeof(AdN)!="undefined"){L.AdN=AdN;}
L.show();Ls[Loc]=L;}else{var L=Ls[Loc];L.show();}}catch(err){}}
function AdImpressMap(){this.Map={};this.Add=function(L,N){if(this.isExist(L,N)==false){if(this.Map[L]==null){this.Map[L]=new Array();}
this.Map[L].push(N);}};this.isExist=function(L,N){if(this.Map[L]!=null){for(k in this.Map[L]){if(N==this.Map[L][k]){return true;}}}
return false;};this.getChanIdx=function(){return ChanIdx;};this.update=function(){if(isSend==true){return false;}
var ap,pa,AdSet,Ads,l,i;var Ch=this.getChanIdx();if(Ch==0){return;}
Chans[Ch][1]=="p"?ap="http://"+document.domain+"/crossAd.php":ap="http://"+document.domain+"/crossAd.asp";l=0;i=0;for(k in this.Map){l++;}
AdSet="{";for(L in this.Map){AdSet+="\""+L.replace("Loc_","")+"\""+":[";Ads="";for(k in this.Map[L]){Ads+=this.Map[L][k]+",";}
Ads=Ads.substr(0,Ads.length-1);AdSet+=Ads+"]";if(i<l-1){AdSet+=",";}
i++;}
AdSet+="}";pa="Chan="+Ch+"&Ads="+AdSet+"&rnd="+Math.floor(Math.random()*1000000);if(window.XMLHttpRequest){xmlHttp=new XMLHttpRequest();}else if(window.ActiveXObject){xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");}
if(xmlHttp){xmlHttp.open("POST",ap,false);xmlHttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');xmlHttp.onreadystatechange=function(){if(xmlHttp.readyState==4){if(xmlHttp.status==200){if(xmlHttp.responseText=="false"){}else{isSend=true;setTimeout("",1000);}}}};xmlHttp.send(pa);}};}
var AdImMap=new AdImpressMap();window.onbeforeunload=function(){AdImMap.update();};if(typeof(JSON)=='undefined'){if(typeof JSON!=='object'){JSON={};}
(function(){'use strict';function f(n){return n<10?'0'+n:n;}
if(typeof Date.prototype.toJSON!=='function'){Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+'-'+
f(this.getUTCMonth()+1)+'-'+
f(this.getUTCDate())+'T'+
f(this.getUTCHours())+':'+
f(this.getUTCMinutes())+':'+
f(this.getUTCSeconds())+'Z':null;};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf();};}
var cx=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,escapable=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,indent,meta={'\b':'\\b','\t':'\\t','\n':'\\n','\f':'\\f','\r':'\\r','"':'\\"','\\':'\\\\'},rep;function quote(string){escapable.lastIndex=0;return escapable.test(string)?'"'+string.replace(escapable,function(a){var c=meta[a];return typeof c==='string'?c:'\\u'+('0000'+a.charCodeAt(0).toString(16)).slice(-4);})+'"':'"'+string+'"';}
function str(key,holder){var i,k,v,length,mind=gap,partial,value=holder[key];if(value&&typeof value==='object'&&typeof value.toJSON==='function'){value=value.toJSON(key);}
if(typeof rep==='function'){value=rep.call(holder,key,value);}
switch(typeof value){case'string':return quote(value);case'number':return isFinite(value)?String(value):'null';case'boolean':case'null':return String(value);case'object':if(!value){return'null';}
gap+=indent;partial=[];if(Object.prototype.toString.apply(value)==='[object Array]'){length=value.length;for(i=0;i<length;i+=1){partial[i]=str(i,value)||'null';}
v=partial.length===0?'[]':gap?'[\n'+gap+partial.join(',\n'+gap)+'\n'+mind+']':'['+partial.join(',')+']';gap=mind;return v;}
if(rep&&typeof rep==='object'){length=rep.length;for(i=0;i<length;i+=1){if(typeof rep[i]==='string'){k=rep[i];v=str(k,value);if(v){partial.push(quote(k)+(gap?': ':':')+v);}}}}else{for(k in value){if(Object.prototype.hasOwnProperty.call(value,k)){v=str(k,value);if(v){partial.push(quote(k)+(gap?': ':':')+v);}}}}
v=partial.length===0?'{}':gap?'{\n'+gap+partial.join(',\n'+gap)+'\n'+mind+'}':'{'+partial.join(',')+'}';gap=mind;return v;}}
if(typeof JSON.stringify!=='function'){JSON.stringify=function(value,replacer,space){var i;gap='';indent='';if(typeof space==='number'){for(i=0;i<space;i+=1){indent+=' ';}}else if(typeof space==='string'){indent=space;}
rep=replacer;if(replacer&&typeof replacer!=='function'&&(typeof replacer!=='object'||typeof replacer.length!=='number')){throw new Error('JSON.stringify');}
return str('',{'':value});};}
if(typeof JSON.parse!=='function'){JSON.parse=function(text,reviver){var j;function walk(holder,key){var k,v,value=holder[key];if(value&&typeof value==='object'){for(k in value){if(Object.prototype.hasOwnProperty.call(value,k)){v=walk(value,k);if(v!==undefined){value[k]=v;}else{delete value[k];}}}}
return reviver.call(holder,key,value);}
text=String(text);cx.lastIndex=0;if(cx.test(text)){text=text.replace(cx,function(a){return'\\u'+
('0000'+a.charCodeAt(0).toString(16)).slice(-4);});}
if(/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,'@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,']').replace(/(?:^|:|,)(?:\s*\[)+/g,''))){j=eval('('+text+')');return typeof reviver==='function'?walk({'':j},''):j;}
throw new SyntaxError('JSON.parse');};}}());}
function get_cookie_for_track(Name)
{var search=Name+"="
if(document.cookie.length>0)
{offset=document.cookie.indexOf(search)
if(offset!=-1)
{offset+=search.length
end=document.cookie.indexOf(";",offset)
if(end==-1)end=document.cookie.length
return unescape(document.cookie.substring(offset,end))}
else return""}}
function set_cookie_for_track(name,value,days){var st
var expires1=new Date()
expires1.setTime(expires1.getTime()+1000*60*60*24*days)
st=name+"="+value+";domain=.fashionguide.com.tw;path=/; expires="+expires1.toGMTString()
document.cookie=st;}
function load_xmldoc_for_track(url)
{expires1=new Date();ap=url+"&rnd="+expires1.getTime();xhr2=false;xdr=false;if(window.XDomainRequest){try{xdr=new XDomainRequest();xhr2=false;}catch(e){xdr=false;}}else if(window.XMLHttpRequest){try{xhr2=new XMLHttpRequest();}catch(e){xhr2=false;}}else if(window.ActiveXObject){try{xhr2=new ActiveXObject("Msxml2.XMLHTTP");}catch(e){try{xhr2=new ActiveXObject("Microsoft.XMLHTTP");}catch(e){xhr2=false;}}}
if(xhr2){xhr2.open("GET",ap,true);xhr2.setRequestHeader('Content-Type','application/x-www-form-urlencoded');xhr2.onreadystatechange=function(){if(xhr2.readyState==4){if(xhr2.status==200){state_change_for_track(xhr2.responseText);}}};xhr2.send();}
if(xdr){xdr.onload=function(){if(xdr.responseText=="false"){}else{state_change_for_track(xdr.responseText);}}
xdr.open("GET",ap);xdr.send();}}
function state_change_for_track(responseText)
{if(responseText!=''){data=JSON.parse(responseText);if(data!==null){if((typeof(data.u_test_days))=='number'){set_cookie_for_track('u_test',data.u_test,data.u_test_days);}
if((typeof(data.u_new_days))=='number'){set_cookie_for_track('u_new',data.u_new,data.u_new_days);}
if((typeof(data.u_days))=='number'){set_cookie_for_track('u_v2',data.u_v2,data.u_days);}
if((typeof(data.favorite_key_days))=='number'){set_cookie_for_track('favorite_key',data.favorite_key,data.favorite_key_days);}}}}
function track_visit(unique_keyword_id_str,like_member){var url=window.location.toString();prefix_url=url.substring(url.indexOf("://")+3,url.indexOf("."));str='uk='+unique_keyword_id_str+'&r='+prefix_url+'&l='+like_member+'&ut='+get_cookie_for_track('u_test')+'&u='+get_cookie_for_track('u_v2')+'&p='+navigator.platform
load_xmldoc_for_track('http://track.fashionguide.com.tw/ajax/track_visit.php?'+str);}
function set_favorite_cookie(){if((get_cookie_for_track('favorite_key')=='')&&(get_cookie_for_track('u_v2')!='')){str='u='+get_cookie_for_track('u_v2')
load_xmldoc_for_track('http://track.fashionguide.com.tw/ajax/set_favorite_cookie.php?'+str);}}
function analyer(){this.sentence='';this.get_by_id=function(m){m=m||0;if(document.getElementById('fga')!=null){var obj=document.getElementById('fga');this.go(obj.innerHTML,m);}}
this.send_text=function(t,m){m=m||0;this.sentence=t;this.go(this.sentence,m);}
this.get_by_useid=function(id,m){m=m||0;if(document.getElementById(id)!=null){var obj=document.getElementById(id);this.go(obj.innerHTML,m);}}
this.go=function(t,m){channel=document.domain;channel=channel.split('.')[0];ap="http://54.248.90.126/";pa="Chan="+channel+"&t="+t+"&rnd="+Math.floor(Math.random()*1000000);xhr=false;xdr=false;if(window.XDomainRequest){try{xdr=new XDomainRequest();xhr=false;}catch(e){xdr=false;}}else if(window.XMLHttpRequest){try{xhr=new XMLHttpRequest();}catch(e){xhr=false;}}else if(window.ActiveXObject){try{xhr=new ActiveXObject("Msxml2.XMLHTTP");}catch(e){try{xhr=new ActiveXObject("Microsoft.XMLHTTP");}catch(e){xhr=false;}}}
if(xhr){xhr.open("POST",ap,true);xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');xhr.onreadystatechange=function(){if(xhr.readyState===4){if(xhr.status===200){if(xhr.responseText=="false"){console.log(xhr.responseText);}else{track_visit(xhr.responseText,m);set_favorite_cookie();}}}};xhr.send(pa);}
if(xdr){xdr.onerror=function(){}
xdr.onload=function(){if(xdr.responseText=="false"){}else{track_visit(xdr.responseText,m);set_favorite_cookie();}}
xdr.ontimeout=function(){}
xdr.open("POST",ap,true);xdr.send(pa);}}}
var ar=new analyer();