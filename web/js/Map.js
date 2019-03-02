$.getJSON ("../json/mapNews.json",function (data)
      {
          $.each (data, function (i, item)
          {
              $("#map .newsType").append('<li class="col-sm-2"><a href=\"../more?news='+item.name+'&str='+item.name+'\">' + item.name+"新闻" + '</a></li>');
              data[i]=item.name;
          });
      });
$.getJSON ("../json/navCity.json",function (data)
      {
          $.each (data, function (i, item)
          {
              $("#map .newsCity").append('<li class="col-sm-1"><a href=\"../more?news='+item.name+'&str='+item.name+'\">' + item.name + '</a></li>');
              data[i]=item.name;
          });
      });
$("#mytab a").click(function (e) {
    $(this).tab('show');
});
function validate(){
    var title=$("#title").val();
    var time=$("#time").val();
    var type=$("#type").val();
    var province=$("#province").val();
    var content=$("#content").val();
    if(title!=""&&time!=""&&type!=""&&province!=""&&content!="") {
        $("#tip").css("color","black");
        $("#tip").html("可以提交");
    }
    else {
       $("#tip").html("请填写所有信息");
    } 
}
