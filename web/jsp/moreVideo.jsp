<%-- 
    Document   : moreVideo
    Created on : 2018-6-24, 16:43:42
    Author     : asuspc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-视频新闻</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/public.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
             <div class="row">
                <h1 class="col-sm-6">NRS视频新闻&nbsp;&nbsp;
                    <span><a href="../index.jsp"><small>返回首页</small></a></span>
                    <span><a href="Map.jsp" target="_blank"><small>网站地图</small></a></span>
                </h1>
            </div>
            <div class="row">
                <hr/>
                <ul>
                    <c:forEach var="video" items="${video.list }">
                        <li class="col-sm-3">
                            <video width="100%"  controls>
                            <source src="${video.src}" type="video/mp4">
                            您的浏览器不支持 HTML5 video 标签。
                            </video>
                            <p class="text-center">${video.title}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
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
    </body>
</html>
