function toplogin(mnum,nick){
 	var mnum;
	var nick;
	var filetype;
	
	/*if (window.location.host=='www.fashionguide.com.tw')
	{
		filetype='asp';
	}else
	{
		filetype='php';
	}*/
	if(mnum==0)
	{
		document.getElementById("logout").style.display="none";
		document.getElementById("mem_info").style.display='none';
		document.getElementById("memberlogin").style.display='block';
		document.getElementById("login").style.display='block';
		document.getElementById("fblogin").style.display='block';
		document.getElementById("inlogin").style.display='block';
		
	}else
	{
		document.getElementById("logout").style.display='block';
		document.getElementById("mem_info").style.display='block';
		document.getElementById("memberlogin").style.display='block';
		document.getElementById("login").style.display='none';
		document.getElementById("fblogin").style.display='none';
		document.getElementById("inlogin").style.display='none';
		document.getElementById("mem_nick").innerHTML=nick;
		
		$.ajax({
			  url: "http://"+window.location.host+"/ajax/check_login_info.asp",
			  type: 'POST',
			  dataType: 'JSON',
			  data: {
						mnum: mnum
					},
			  success:function(response){
				 $("#mem_img").html(response.avatar); 
				 $("#board_info").html(response.board_new); 
				 $("#g_bonus").html(response.g_bonus); 
			     $("#msg_check").html(response);
			  } 
			});		
	}
	
}
