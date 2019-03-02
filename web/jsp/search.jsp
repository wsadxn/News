<%-- 
    Document   : search
    Created on : 2018-6-27, 8:18:37
    Author     : asuspc
--%>

<%@page import="java.util.List"%>
<%@page import="Bean.News"%>
<%@page import="Bean.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-搜索结果</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/public.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1 class="col-sm-6">NRS搜索结果&nbsp;&nbsp;
                    <span><a href="index.jsp"><small>返回首页</small></a></span>
                    <span><a href="jsp/Map.jsp" target="_blank"><small>网站地图</small></a></span>
                </h1>
            </div>
            <span>共搜索到${searchresult}条新闻</span>
            <div class="row">
                <hr/>
                <ul>
                <%
                        List<News> sl=(List<News>)session.getAttribute("searchlist");
                        for(int i=0;i<sl.size();i++)
                        {
                            News news=sl.get(i);
                %> 
                            <li>
                                <a href="jsp/newsContent.jsp?id=<%=news.getId()%>"><%=news.getTitle()%></a>
                                <div>
                                    <p><%=news.getTime()%></p>
                                    <p><%=news.getMain()%></p>
                                </div>    
                            </li><hr>
                <% 
                        }
                %>
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
