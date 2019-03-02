<%-- 
    Document   : index
    Created on : 2018-6-23, 8:46:05
    Author     : asuspc
--%>

<%@page import="java.util.List"%>
<%@page import="Bean.News"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-首页</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script>
        $(function(){
            var count=$("#politics").children("li").length;
            if(count<1){
                window.location.href = "index";
            }
        });
        </script>
    </head>
    <body>
        <div id="nav">
            <ul class="container">
                <li><a href="./index.jsp">网站首页</a></li>
                <li><a href="#politics">时政</a></li>
                <li><a href="#internation">国际</a></li>
                <li><a href="#socity">社会</a></li>
                <li><a href="#finance">金融</a></li>
                <li><a href="jsp/Map.jsp" target="_blank">网站地图</a></li>
                <input type="hidden" id="userexist" value="${username}">
                <c:if test="${username==null}">
                    <li class="pull-right"><a href="#modal" data-toggle="modal" id="register">注册</a></li>
                    <li class="pull-right sub"><a href="#modal" data-toggle="modal" id="login">一键登录</a></li>
                </c:if>
                <c:if test="${username!=null}">
                    <c:if test="${userid==1}">
                    <li class="pull-right sub"><a href="jsp/admin.jsp">后台管理</a></li>
                    </c:if>
                    <c:if test="${userid!=1}">
                    <li class="pull-right sub"><a href="jsp/user.jsp?id=${userid}">个人中心</a></li>
                    </c:if>
                    <li class="pull-right"><a href="#" onclick="exit()">退出</a></li>
                </c:if>
                <li class="pull-right time"></li>
            </ul>
        </div>
        <div class="container">
            <div id="navCity"><ul></ul></div>
            <div id="logo">
                <h1 class="text-hide" id="mainhead">News Release System</h1>
                <form class="pull-right" action="search" method="post">
                    <label for="key"><input type="text" placeholder="请输入关键字" name="key" id="key"></label>
                    <button type="submit" id="search">搜索</button>
                </form>
            </div>
            <div class="row navThree"></div>
            <div class="row">
                <div class="carousel col-sm-3" id="myCarousel" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>
                    <!--幻灯片-->
                    <div class="carousel-inner" role="listbox">
                        <figure class="item active">
                            <img src="img/worldCup.jpg" alt="worldCup">
                            <a href="jsp/newsContent.jsp?id=68"><figcaption class="carousel-caption">【大画世界杯】“戏精”欢乐多</figcaption></a>
                        </figure>
                        <figure class="item">
                            <img src="img/xiZang.jpg" alt="xiZang">
                            <a href="jsp/newsContent.jsp?id=69"><figcaption class="carousel-caption">西藏首个高海拔生态搬迁项目顺利实施</figcaption></a>
                        </figure>
                        <figure class="item">
                            <img src="img/bird.jpg" alt="bird">
                            <a href="jsp/newsContent.jsp?id=70"><figcaption class="carousel-caption">绿头鸭欺上身鱼鹰丢鱼逃跑</figcaption></a>
                        </figure>
                        <figure class="item">
                            <img src="img/Tokyo.jpg" alt="bird">
                            <a href="jsp/newsContent.jsp?id=71"><figcaption class="carousel-caption">东京数码艺术博物馆开馆 美若神奇幻境</figcaption></a>
                        </figure>
                    </div>
                    <a class="left" href="#myCarousel" role="button" data-slide="prev">&lt;</a>
                    <a class="right" href="#myCarousel" role="button" data-slide="next">&gt;</a>
                </div>
                <div class="col-sm-6" id="politics">
                    <h4>时政<span><a href="more?news=politics&str=时政" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>                    
                    <c:forEach var="shizheng" items="${shizheng}">
                        <li class="middleNews"><a href="jsp/newsContent.jsp?id=${shizheng.id}"><c:out value="${shizheng.title}"/></a></li>
                    </c:forEach>
                </div>
                <div class="col-sm-3">
                    <h4>精选新闻<span><a href="jsp/more.jsp?news=wellChosen&str=精选新闻" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <ul class="news">
                        <c:forEach var="jingxuan" items="${jingxuan}">
                        <li><a href="jsp/newsContent.jsp?id=${jingxuan.id}"><c:out value="${jingxuan.title}"/></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3" id="videoNews">
                    <h4>视频新闻<span><a href="jsp/moreVideo.jsp" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <video width="100%" controls>
                        <source src="img/fruit.mp4" type="video/mp4">
                        您的浏览器不支持 HTML5 video 标签。
                    </video>
                    <p class="text-center">某果园果实可口</p>
                </div>
                <div class="col-sm-6" id="internation">
                    <h4>国际<span><a href="more?news=internation&str=国际" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <c:forEach var="guoji" items="${guoji}">
                        <li  class="middleNews"><a href="jsp/newsContent.jsp?id=${guoji.id}"><c:out value="${guoji.title}"/></a></li>
                    </c:forEach>
                </div>
                <div class="col-sm-3">
                    <h4>最新新闻<span><a href="jsp/more.jsp?news=lastest&str=最新新闻" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <ul class="news">
                        <c:forEach var="zuixin" items="${zuixin}">
                        <li><a href="jsp/newsContent.jsp?id=${zuixin.id}"><c:out value="${zuixin.title}"/></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 fix">
                    <h4>娱乐新闻<span><a href="more?news=ET&str=娱乐" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <ul class="news">
                        <c:forEach var="yule" items="${yule}">
                            <li><a href="jsp/newsContent.jsp?id=${yule.id}"><c:out value="${yule.title}"/></a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-6" id="socity">
                    <h4>社会<span><a href="more?news=socity&str=社会" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <c:forEach var="shehui" items="${shehui}">
                        <li class="middleNews"><a href="jsp/newsContent.jsp?id=${shehui.id}"><c:out value="${shehui.title}"/></a></li>
                    </c:forEach>
                </div>
                <div class="col-sm-3 fix fixRight">
                    <h4>体育新闻<span><a href="more?news=PE&str=体育" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <ul class="news">
                        <c:forEach var="tiyu" items="${tiyu}">
                            <li><a href="jsp/newsContent.jsp?id=${tiyu.id}"><c:out value="${tiyu.title}"/></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-offset-3 col-sm-6" id="finance">
                    <h4>金融<span><a href="more?news=finance&str=金融" class="pull-right"><small>更多&gt;&gt;</small></a></span></h4>
                    <c:forEach var="jinrong" items="${jinrong}">
                        <li class="middleNews"><a href="jsp/newsContent.jsp?id=${jinrong.id}"><c:out value="${jinrong.title}"/></a></li>
                    </c:forEach>
                </div>
            </div>
            <br>
            <div class="row footer">
                <h2>News Release System</h2>
                <ul>
                    <li>地址：扬州大学扬子津校区</li>
                    <li>电话：0000-12345678</li>
                    <li>传真：0000-12345678</li>
                    <li>邮编：225100</li>
                </ul>
            </div>
        </div>
        <ul class="slide"><li><a href="#nav">Top</a></li> <li><a href="#finance" style="border-top: 1px solid white">Bottom</a></li></ul>
<div class="modal fade" id="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <ul class="nav nav-tabs" id="mytab">
                    <li class="active"><a href="#section1">注册</a> </li>
                    <li><a href="#section2">登录</a> </li>
                </ul>
                <div class="tab-content">
                    <div id="section1" class="tab-pane fade in active" role="tabpanel">
                        <form action="register" class="form-group">
                                <label for="usernamer"></label>
                                <input type="text" placeholder="用户名" name="usernamer"class="form-control" id="usernamer">
                                <label for="passwordr"></label>
                                <input type="password" placeholder="密码" name="passwordr" class="form-control" id="passwordr">
                                <label for="twicer" class="del"></label>
                                <input type="password" placeholder="确认密码" name="twicer"class="form-control" id="twicer" onkeyup="validate()">
                                <br/>
                                <span id="tip"></span><br/>
                                <button type="submit" class="btn btn-info del" >注册</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </form>
                    </div>
                    <div id="section2" class="tab-pane fade" role="tabpanel">
                        <form class="form-group">
                                <label for="usernamel"></label>
                                <input type="text" placeholder="用户名" name="usernamel" class="form-control" id="usernamel">
                                <label for="passwordl"></label>
                                <input type="password" placeholder="密码" name="passwordl"  class="form-control" id="passwordl">
                                <br/>
                                <button type="button" class="btn btn-info del" onclick="login()">登录</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </form>
                    </div>                   
                </div>
            </div>
        </div>
    </div>
</div>

        
        <script src="js/index.js" type="text/javascript"></script>
        <script>
            function isUser(){
                var username=$("#userexist").val();
                if(username==""){
                    alert("请先登录");
                }else{
                    window.location="more?news=Contribution&str=Contribution";
                }
            }
            function login(){
                var username=$("#usernamel").val();
                var password=$("#passwordl").val();
                var params={username:username,password:password};
                $.ajax({
                    async:false,
                    type:"post",
                    url:"login",
                    data:params, 
                    error:function(XMLHttpRequest){
                        console.log(XMLHttpRequest.readyState);
                    },
                    success:function(result){
                        if(result==="false"){
                            alert("用户名或密码错误");
                            location.reload();
                        }else{
                            alert("登录成功");
                            location.reload();
                        }
                    }
                });
            }
            
            function exit(){
                $.ajax({
                    type:"post",
                    url:"exit",
                    dataType:"text",
                    data:{},
                    error:function(){
                        console.log("error");
                    },
                    success:function(result){
                        window.location="index.jsp";
                        console.log(result);
                    }
                });
            }
        </script>
    </body>
</html>
