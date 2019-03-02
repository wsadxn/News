$(document).ready(function(){
    $(window).scrollTop(0);
    setInterval("show()",1000);
    $(function () {  
        var ie6 = document.all;  
        var dv = $('.fix'), st;  
        dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离  
        $(window).scroll(function () {  
        st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);  
        if (st > parseInt(dv.attr('otop'))) {  
            if (ie6) dv.css({ position: 'absolute', top: st }); 
            else if (dv.css('position') != 'fixed') {
                dv.css({ 'position': 'fixed', top: 0,'width':'292.5px'});
                $('#socity').addClass('col-sm-offset-3');
                $('.fixRight').css({left:'71.7%'});
            }
            } else if (dv.css('position') != 'static') {
                dv.css({ 'position': 'static','width':'25%' });    
                $('#socity').removeClass('col-sm-offset-3');
            }
        });  
    }); 
});
function show(){
    var time=new Date();
    $(".time").html(time.toLocaleString());
}
$.getJSON ("json/navCity.json",function (data)
      {
          $.each (data, function (i, item)
          {
              $("#navCity ul").append('<li><a href=\"more?news='+item.name+'&str='+item.name+'\">' + item.name + '|</a></li>');
              data[i]=item.name;
          });
      });
$.getJSON ("json/navThree.json",function (data)
{
    $.each (data, function (i, item)
    {
        if(item.name=="供稿"){
            $(".navThree").append('<li class="col-sm-1"><a href=\"javascript:;\" onclick=\"isUser()\">' + item.name + '</a></li>');
            data[i]=item.name;
        }else{
            $(".navThree").append('<li class="col-sm-1"><a href=\"more?news='+item.name+'&str='+item.name+'\">' + item.name + '</a></li>');
            data[i]=item.name;
        }    
    });
});
$("#mytab a").click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
function validate(){
    var str=$("#passwordr").val();
    var str2=$("#twicer").val();
    $("#tip").css("color","red");
    if(str2!=str) $("#tip").html("两次密码不相同！");
    else $("#tip").html(""); 
}