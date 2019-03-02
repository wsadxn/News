<%-- 
    Document   : update
    Created on : 2018-6-28, 8:31:07
    Author     : asuspc
--%>
<%@page import="Bean.News"%>
<%@page import="Dao.Newsdao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-编辑</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/public.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            Newsdao nd=new Newsdao();
            News news=nd.find(id);
        %>
        <div class="container">
                <h1 class="navbar-fixed-top">编辑新闻&nbsp;&nbsp;
                    <span><a href="../index.jsp"><small>返回首页</small></a></span>
                    <span><a href="Map.jsp" target="_blank"><small>网站地图</small></a></span>
                </h1>
                <form action="../update" method="post" class="form-group margintop">
                    <input type="hidden" id="nid" name="nid" value="<%=id%>">
                    <label for="title"></label>
                    <input type="text" name="title" id="title" value="<%=news.getTitle()%>" class="form-control" onkeyup="validate()" required>
                    <label for="time"></label>
                    <input type="text" name="time" id="time" value="<%=news.getTime()%>" class="form-control" onkeyup="validate()" required>
                    <label for="type"></label>
                    <input type="text" name="type" id="type" value="<%=news.getType()%>" class="form-control" onkeyup="validate()" required>
                    <label for="wellChosen"></label>
                    <select name="wellChosen" id="wellChosen" class="form-control" onchange="validate()" required>
                        <option value="">是否为精选</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                    <label for="province"></label>
                    <input type="text" name="province" id="province" value="<%=news.getProvince()%>" class="form-control" onkeyup="validate()" required>
                    <label for="main"></label>
                    <textarea rows="2"  name="main" id="main" class="form-control" onkeyup="validate()" required><%=news.getMain()%></textarea>
                    <label for="content"></label>
                    <textarea rows="10" name="content" class="form-control" id="content" onkeyup="validate()" required><%=news.getContent()%></textarea>
                    <br><span id="tip" style="color:red;">请填写所有字段</span><br>
                    <input type="submit" value="提交" class="col-sm-offset-5">
                    <input type="reset" value="重置">
                </form>
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
        
        <script type="text/javascript">
            function validate(){
                var title=$("#title").val();
                var time=$("#time").val();
                var type=$("#type").val();
                var wellChosen=$("#wellChosen").val();
                var main=$("#main").val();
                var province=$("#province").val();
                var content=$("#content").val();
                if(title!=""&&time!=""&&type!=""&&wellChosen!=""&&main!=""&&province!=""&&content!="") {
                    $("#tip").css("color","black");
                    $("#tip").html("可以提交");
                }
                else {
                   $("#tip").css("color","red");
                   $("#tip").html("请填写所有信息");
                } 
            }
        </script>
    </body>
</html>
