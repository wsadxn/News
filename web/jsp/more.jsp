<%-- 
    Document   : more
    Created on : 2018-6-24, 16:29:06
    Author     : asuspc
--%>

<%@page import="Bean.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-更多</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/public.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/Map.js" type="text/javascript"></script>        
    </head>
    <body>
        <%   
            String news=request.getParameter("news"); 
            String str=request.getParameter("str");
            request.setAttribute("news",news);
            request.setAttribute("str",str);
        %>
        <c:if test="${requestScope.news=='gonggao'}" var="condition" scope="request">
            <div class="container">
                <h1 class="navbar-fixed-top">发布新闻&nbsp;&nbsp;
                    <span><a href="index.jsp"><small>返回首页</small></a></span>
                    <span><a href="jsp/Map.jsp" target="_blank"><small>网站地图</small></a></span>
                </h1>
                <form action="addnews" type="post" class="form-group margintop">
                    <label for="title"></label>
                    <input type="text" name="title" id="title" placeholder="标题" class="form-control" onkeyup="validate()" required>
                    <label for="time"></label>
                    <input type="text" name="time" id="time" placeholder="时间" class="form-control" onkeyup="validate()" required>
                    <label for="type"></label>
                    <input type="text" name="type" id="type" placeholder="类型" class="form-control" onkeyup="validate()" required>
                    <label for="province"></label>
                    <input type="text" name="province" id="province" placeholder="地区" class="form-control" onkeyup="validate()" required>
                    <label for="main"></label>
                    <textarea rows="3" cols="10" placeholder="主要内容" class="form-control" id="main" name="main" onkeyup="validate()" required></textarea>
                    <label for="content"></label>
                    <textarea rows="10" cols="10" placeholder="正文" class="form-control" id="content" name="content" onkeyup="validate()" required></textarea>
                    <input type="hidden" name="userid" value="${userid}">
                    <br><span id="tip" style="color:red;">请填写所有字段</span><br>
                    <input type="submit" value="提交" class="col-sm-offset-5">
                    <input type="reset" value="重置">
                </form>
            </div>
        </c:if>
        <c:if test="${requestScope.news!='gonggao'}" var="condition" scope="request">
            <div class="container">
                <h1 class="navbar-fixed-top"><%=str%>&nbsp;&nbsp;
                    <span><a href="index.jsp"><small>返回首页</small></a></span>
                    <span><a href="jsp/Map.jsp" target="_blank"><small>网站地图</small></a></span>
                </h1>
                    <ul class="margintop">
        <%
                List<News> pl=(List<News>)session.getAttribute("list");
                for(News ns:pl)
                {
        %> 
                    <li>
                        <a href="jsp/newsContent.jsp?id=<%=ns.getId()%>"><%=ns.getTitle()%></a>
                        <div>
                            <p><%=ns.getTime()%></p>
                            <p><%=ns.getMain()%></p>
                        </div>    
                    </li><hr>
        <% 
                }
        %>
                </ul>
                </div>   
        </c:if>
        <div class="row footer">
            <h2>News Release System</h2>
            <ul>
                <li>地址：扬州大学扬子津校区</li>
                <li>电话：0000-12345678</li>
                <li>传真：0000-12345678</li>
                <li>邮编：225100</li>
            </ul>
        </div>
    </body>

</html>