<%-- 
    Document   : newsContent
    Created on : 2018-6-26, 14:51:00
    Author     : asuspc
--%>

<%@page import="java.util.List"%>
<%@page import="Dao.*"%>
<%@page import="Bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-新闻正文</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <style type="text/css">
            li{list-style-type: none;}
            p{text-indent: 2em;}
            .col-sm-8,.col-sm-12{padding-right: 0;}
            .btn{margin-top: 10px;}
            .footer{
                background-color:#737373;
                text-align: center;
                color:white;
            }
            .slide{position: fixed;bottom: 10%;left:0;}
            .slide a{
                display: block;
                width:100%;
                height: 100%;
                color: white;
                padding: 10px;
                text-align: center;
                background-color: rgb(35,35,35);
            }
            .liHr{margin: 0;padding: 0;}
        </style>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            Newsdao nd=new Newsdao();
            Commentdao cd=new Commentdao();
            News news=nd.find(id);
            List<Comment> commentlist=cd.find(id);
            int userid=news.getUserid();
            Userdao ud=new Userdao();
            User user=ud.find(userid);
        %>
        <div class="container">
            <div class="row text-center">
                <h1><%=news.getTitle()%></h1>
                <small class="col-sm-4">时间：<%=news.getTime()%></small>
                <small class="col-sm-4">类型：<%=news.getType()%></small>
                <small class="col-sm-4">来源：<%=user.getUsername()%></small>
            </div>
            <hr/>
            <div class="row">
                <p><%=news.getContent()%></p>
            </div>
            <hr/>
            <div class="row">
                <c:if test="${username==null}">
                    <p class="text-center">请先登录再进行评论</p><br/>
                </c:if>
                <c:if test="${username!=null}">
                    <form id="commentform" class="form-horizontal">
                        <div class="form-group">
                            <label for="remark" class="col-sm-2 control-label">评论:</label>
                            <div class="col-sm-8">
                                <textarea rows="3" class="col-sm-12"name="remark" id="remark" required="required"></textarea>
                            </div>
                            <input type="hidden" id="userid" name="userid" value="${userid}">
                            <input type="hidden" id="newsid" name="newsid" value="<%=id%>">
                            <input type="button" value="发表" class="col-sm-offset-9 col-sm-1 btn" onclick="submitComment()">
                        </div>
                    </form>
                </c:if>
                <div id="commentlist">
                    <%
                        if(commentlist.size()<1){
                            %>
                            <span>暂无评论</span>
                            <%
                        }else{
                            for(Comment ct:commentlist){
                                %>
                                <li class="row">
                                    <p class="col-sm-2">
                                        <%
                                            User commentuser=ud.find(ct.getUserid());
                                        %>
                                        <%=commentuser.getUsername()%>:
                                    </p>
                                    <p class="col-sm-7"><%=ct.getComment()%></p>
                                    <p class="col-sm-3"><%=ct.getTime()%></p>
                                </li><hr class="liHr"/>
                                <%
                            }
                        }
                    %>
                </div>
            </div>
                <br/>
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
        <ul class="slide"><li><a href="../index.jsp">Home</a></li> <li><a href="Map.jsp" style="border-top: 1px solid white">Map</a></li></ul>
        <script>
            function submitComment(){
                var time=new Date();
                var recenttime=time.toLocaleString();
                var comment=$("#remark").val();
                var userid=$("#userid").val();
                var newsid=$("#newsid").val();
                $.ajax({
                    async:false,
                    type:"post",
                    url:"../comment",
                    data:{newcomment:comment,newtime:recenttime,userid:userid,newsid:newsid}, 
                    error:function(XMLHttpRequest){
                        console.log(XMLHttpRequest.readyState);
                    },
                    success:function(result){
                        location.reload();
                        console.log(result);
                    }
                });
            }
        </script>
    </body>
</html>
