
//locate_id 3-7  左上大圖

$(function() { 

        $('#slideshow3').before('<ul id="main_show3" class="page_dot">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  5000, 
            speed:    500,
            pager:  '#main_show3',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder3,
            after:  onAfter3
        }); 

        function onAfter3(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow3_str').html(slides_string3[index]);
        }; 

        function pagerAnchorBuilder3(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">0</a></li>';
        }
}); 

//locate_id 31-32  美妝-左上大圖

$(function() { 

        $('#slideshow31').before('<ul id="main_show31" class="page_brick">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  0, 
            speed:    500,
            pager:  '#main_show31',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder31,
            after:  onAfter31
        }); 

        function onAfter31(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow31_str').html(slides_string31[index]);
        }; 

        function pagerAnchorBuilder31(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">'+(ind+1)+'</a></li>';
        }
}); 

//locate_id 49-50  試用評鑑-左上大圖

$(function() { 

        $('#slideshow49').before('<ul id="main_show49" class="page_brick">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  0, 
            speed:    500,
            pager:  '#main_show49',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder49,
            after:  onAfter49
        }); 

        function onAfter49(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow49_str').html(slides_string49[index]);
        }; 

        function pagerAnchorBuilder49(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">'+(ind+1)+'</a></li>';
        }
}); 

//locate_id 87-89  愛漂亮-左上大圖

$(function() { 

        $('#slideshow87').before('<ul id="main_show87" class="page_brick">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  0, 
            speed:    500,
            pager:  '#main_show87',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder87,
            after:  onAfter87
        }); 

        function onAfter87(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow87_str').html(slides_string87[index]);
        }; 

        function pagerAnchorBuilder87(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">'+(ind+1)+'</a></li>';
        }
}); 

//locate_id 213-215  美髮-左上大圖

$(function() { 

        $('#slideshow213').before('<ul id="main_show213" class="page_brick">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  0, 
            speed:    500,
            pager:  '#main_show213',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder213,
            after:  onAfter213
        }); 

        function onAfter213(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow213_str').html(slides_string213[index]);
        }; 

        function pagerAnchorBuilder213(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">'+(ind+1)+'</a></li>';
        }
}); 

//locate_id 109-110  男性-左上大圖

$(function() { 

        $('#slideshow109').before('<ul id="main_show109" class="page_brick">').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 0,
            timeout:  0, 
            speed:    500,
            pager:  '#main_show109',
            pagerEvent: 'mouseover',
            pagerAnchorBuilder: pagerAnchorBuilder109,
            after:  onAfter109
        }); 

        function onAfter109(curr, next, opts, fwd) { 
            var index = opts.currSlide;
            $('#slideshow109_str').html(slides_string109[index]);
        }; 

        function pagerAnchorBuilder109(ind, el) {
            return '<li><a href="#" style="width: 8px; height: 8px">'+(ind+1)+'</a></li>';
        }
}); 

//locate_id 66  時尚-國際精品下方圖文

$(function() { 

    startSlideshow66(slides66,slides_string66,slides_url66,slides_id66);

    function startSlideshow66(slides,slides_string,slides_url,slides_id) { 

        var totalSlideCount = 1 + slides.length; 
         
        var $slideshow = $('#slideshow66');
        $slideshow.prepend('<div><a onclick="gcash('+slides_id.pop()+')" href="'+slides_url.pop()+'"><img src="'+slides.pop()+'" /><p class="ellipsis">'+slides_string.pop()+'</p></a></div>'); 
        $slideshow.append('<div><a onclick="gcash('+slides_id.shift()+')" href="'+slides_url.shift()+'"><img src="'+slides.shift()+'" /><p class="ellipsis">'+slides_string.shift()+'</p></a></div>'); 

        $('#slideshow66').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 1,
            timeout:  0, 
            speed:    500, 
            prev:    '#fashion_prev', 
            next:    '#fashion_next', 
            before:   onBefore 
        }); 
         
        function onBefore(curr, next, opts, fwd) { 
            if (!opts.addSlide) 
                return; 
                 
            if (opts.slideCount == totalSlideCount) 
                return; 

            var nextSlideSrc = fwd ? slides.shift() : slides.pop(); 
            var nextSlideString = fwd ? slides_string.shift() : slides_string.pop(); 
            var nextSlideUrl = fwd ? slides_url.shift() : slides_url.pop(); 
            var nextSlideId = fwd ? slides_id.shift() : slides_id.pop(); 
             
            opts.addSlide('<div><a onclick="gcash('+nextSlideId+')" href="'+nextSlideUrl+'"><img src="'+nextSlideSrc+'"/><p class="ellipsis">'+nextSlideString+'</p></a></div>', fwd == false); 
        }; 
    }; 
}); 




//locate_id 118  雜誌影音-右方

$(function() { 

    startSlideshow118(slides118,slides_url118,slides_id118);

    function startSlideshow118(slides,slides_url,slides_id) { 

        var totalSlideCount = 1 + slides.length; 
         
        var $slideshow = $('#slideshow118');
        $slideshow.prepend('<div><a onclick="gcash('+slides_id.pop()+')" href="'+slides_url.pop()+'"><img src="'+slides.pop()+'" /></a></div>'); 
        $slideshow.append('<div><a onclick="gcash('+slides_id.shift()+')" href="'+slides_url.shift()+'"><img src="'+slides.shift()+'" /></a></div>'); 

        $('#slideshow118').cycle({ 
            fx: 'scrollHorz', 
            startingSlide: 1,
            timeout:  4000, 
            speed:    1000, 
            before:   onBefore 
        }); 
         
        function onBefore(curr, next, opts, fwd) { 
            if (!opts.addSlide) 
                return; 
                 
            if (opts.slideCount == totalSlideCount) 
                return; 

            var nextSlideSrc = fwd ? slides.shift() : slides.pop(); 
            var nextSlideUrl = fwd ? slides_url.shift() : slides_url.pop(); 
            var nextSlideId = fwd ? slides_id.shift() : slides_id.pop(); 
             
            opts.addSlide('<div><a onclick="gcash('+nextSlideId+')" href="'+nextSlideUrl+'"><img src="'+nextSlideSrc+'"/></a></div>', fwd == false); 
        }; 
    }; 
}); 

//搜尋自動完成

$(function() {
    $("#keyword").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "http://fgsearch.fashionguide.com.tw/api/keywords/get_keywords.php",
                    dataType: "jsonp",
                    data: {
                        q: request.term
                    },
                    success: function( data ) {
                        response( $.map( data, function( item ) {
                            return {
                                label: item,
                                value: item
                            }
                        }));
                    }
                });
            },
            open: function() {
                $( this ).removeClass( "ui-corner-all" ).addClass( "ui-menu" );
            },
            close: function() {
                $( this ).removeClass( "ui-menu" ).addClass( "ui-corner-all" );
            }
        });
});


//======================== 搜尋 ======================

//預設搜內容
var searchTarget='All';

function clickSearch(kw) {

    if (kw == '')
        return;
    document.TopForm.elements[0].value = encodeURIComponent( kw );
    window.location = 'http://search.fashionguide.com.tw/?q=' + encodeURIComponent( kw )+ '&from=fgindex';
}

function doSubmit() {
    var val = document.TopForm.elements[0].value
    
    if (val == '') {
        return false;
    }
    
    if (searchTarget == 'Nick') {
        window.location = 'http://member.fashionguide.com.tw/search.php?nick=' +  val;
    }else if (searchTarget == 'All') {
    window.location = 'http://search.fashionguide.com.tw/?q=' +  encodeURIComponent( val ) + '&from=fgindex';
    }else 
    {
    document.TopForm.submit();
    }
    return false;
}

function clearDefault(t) {
    if (t.value == "請輸入網友暱稱" || t.value == "輸入品牌(名)或關鍵字" || t.value == "請輸入文章標題") {
      t.value = "";
      t.className = "gray13CN";
    }
}
function recallDefault(t) {
    if (t.value == "")     {
      if (searchTarget == "All") {
        t.value = "輸入品牌(名)或關鍵字";
      }
      else if (name == 'Nick') {
        t.value = "請輸入網友暱稱";
      }
      t.className = "new_search";
    }
}

function ToggleSearch(obj, name) {
    searchTarget = name;
    
    if (name == 'Nick'){
        if((document.TopForm.elements[0].value=='請輸入文章標題')||(document.TopForm.elements[0].value=='輸入品牌(名)或關鍵字')||(document.TopForm.elements[0].value=='')){
            document.TopForm.elements[0].value = '請輸入網友暱稱'
        }else{
            doSubmit()
        }
   }else if (name == 'All'){
        if((document.TopForm.elements[0].value=='請輸入網友暱稱')||(document.TopForm.elements[0].value=='請輸入文章標題')||(document.TopForm.elements[0].value=='輸入品牌(名)或關鍵字')||(document.TopForm.elements[0].value=='')){
            document.TopForm.elements[0].value = '輸入品牌(名)或關鍵字'
        }else{
            doSubmit()
        }
    }
    
    return;
}

//右上標籤自動切換
var tab_num = 1;
var tab_trans_action=1;

function tab_trans(show_tab_num) {

    if(tab_trans_action==1){

        if(show_tab_num>0){
          tab_num =   show_tab_num;
          tab_trans_action = 0;
        }

        $('#tab_gcoin').attr('class','');
        $('#tab_dm').attr('class','');
        $('#tab_discount').attr('class','');
        $('#tab_shop').attr('class','');

        $('#gcoin').attr('class','tab-pane');
        $('#dm').attr('class','tab-pane');
        $('#discount').attr('class','tab-pane');
        $('#shop').attr('class','tab-pane');

        if(tab_num == 1) {
            $('#tab_gcoin').attr('class','active');
            $('#gcoin').attr('class','tab-pane active');
             tab_num = 2;

        } else if(tab_num == 2) {
            $('#tab_dm').attr('class','active');
            $('#dm').attr('class','tab-pane active');
             tab_num = 3;

        } else if(tab_num == 3) {
            $('#tab_discount').attr('class','active');
            $('#discount').attr('class','tab-pane active');
            tab_num = 4;

        } else if(tab_num == 4) {
            $('#tab_shop').attr('class','active');
            $('#shop').attr('class','tab-pane active');
            tab_num = 1;
        }
    }

}
setInterval(tab_trans, 3000);


//商品資料庫搜尋
function pro_select(cmd){

  switch(cmd){
  case 'brand':
    if((document.getElementById('product_search_brand').value)>0){
      document.getElementById('product_search_cate').selectedIndex=0;
      document.getElementById('product_search_fun').selectedIndex=0;
      document.getElementById('product_search_part').selectedIndex=0;
    };
    break;
  case 'cate':
    if((document.getElementById('product_search_cate').value)>0){
      document.getElementById('product_search_brand').selectedIndex=0;
      document.getElementById('product_search_fun').selectedIndex=0;
      document.getElementById('product_search_part').selectedIndex=0;
    };
    break;
  case 'fun':
    if((document.getElementById('product_search_fun').value)>0){
      document.getElementById('product_search_cate').selectedIndex=0;
      document.getElementById('product_search_brand').selectedIndex=0;
      document.getElementById('product_search_part').selectedIndex=0;
    };
    break;
  case 'part':
    if((document.getElementById('product_search_part').value)>0){
      document.getElementById('product_search_cate').selectedIndex=0;
      document.getElementById('product_search_fun').selectedIndex=0;
      document.getElementById('product_search_brand').selectedIndex=0;
    };
    break;
  }
}

function pro_go_to(){
      if((document.getElementById('product_search_brand').value)>0){
        location.href='http://www.fashionguide.com.tw/Beauty/08/CateL.asp?Cmd=Brand&CmdNum='+document.getElementById('product_search_brand').value+'&from=fgindex_brand';
      }else if((document.getElementById('product_search_cate').value)>0){
        location.href='http://www.fashionguide.com.tw/Beauty/08/CateL.asp?Cmd=Cate&CmdNum='+document.getElementById('product_search_cate').value+'&from=fgindex_cate';
      }else if((document.getElementById('product_search_fun').value)>0){
        location.href='http://www.fashionguide.com.tw/Beauty/08/CateL.asp?Cmd=Fun&CmdNum='+document.getElementById('product_search_fun').value+'&from=fgindex_fun';
      }else if((document.getElementById('product_search_part').value)>0){
        location.href='http://www.fashionguide.com.tw/Beauty/08/CateL.asp?Cmd=Part&CmdNum='+document.getElementById('product_search_part').value+'&from=fgindex_part';
      }else{
        alert('請選擇品牌或商品種類或商品功能或使用部位');
      }
}

// 試用評鑑的全站搜尋 

//預設搜內容
//var searchTarget='All';

function doSubmit_beauty() {
    var val = document.TopForm_beauty.elements[0].value
    
    if (val == '') {
        return false;
    }
    
    if (searchTarget == 'Nick') {
        window.location = 'http://member.fashionguide.com.tw/search.php?nick=' +  val;
    }else if (searchTarget == 'All') {
    window.location = 'http://search.fashionguide.com.tw/?q=' +  encodeURIComponent( val ) + '&from=fgindex';
    }else 
    {
    window.location = 'http://search.fashionguide.com.tw/?q=' +  encodeURIComponent( val ) + '&from=fgindex';
    }
    return false;
}

function clearDefault_beauty(t) {
    if (t.value == "請輸入美妝保養品關鍵字" || t.value == "輸入品牌(名)或關鍵字" || t.value == "請輸入文章標題") {
      t.value = "";
      t.className = "gray13CN";
    }
}

//試用評鑑全站搜尋自動完成

$(function() {
    $("#keyword_beauty").autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: "http://fgsearch.fashionguide.com.tw/api/keywords/get_keywords.php",
                    dataType: "jsonp",
                    data: {
                        q: request.term
                    },
                    success: function( data ) {
                        response( $.map( data, function( item ) {
                            return {
                                label: item,
                                value: item
                            }
                        }));
                    }
                });
            },
            open: function() {
                $( this ).removeClass( "ui-corner-all" ).addClass( "ui-menu" );
            },
            close: function() {
                $( this ).removeClass( "ui-menu" ).addClass( "ui-corner-all" );
            }
        });
});


//點連結送G幣
function gcash(ad_id){
    if(thedata>0){
        $.ajax({
            url: "http://fgcash.fashionguide.com.tw/logger.php?PostType=contents_homepage&from=contents_homepage&adv_id="+ad_id+"&memNum="+thedata,
            dataType: "jsonp"
        });
    }
} 


