<%-- 
    Document   : user
    Created on : 2018-6-29, 10:55:42
    Author     : asuspc
--%>

<%@page import="Bean.Comment"%>
<%@page import="Dao.Commentdao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.News"%>
<%@page import="Dao.Newsdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-个人中心</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row main">
                <div class="col-sm-3">
                    <h2>您好，${username}</h2>
                    <ul id="mytab">
                        <li class="active"><a href="#myComment">我的评论</a></li>
                        <li><a href="#myNews">我的新闻</a></li>
                        <li id="upwd"><a href="#update">修改密码</a></li>
                        <li><a href="../index.jsp">返回首页</a></li>
                    </ul>
                </div>
                <%
                    int uid=Integer.parseInt(request.getParameter("id"));
                    Newsdao nd=new Newsdao();
                    List<News> mynews=new ArrayList<>();
                    mynews=nd.findByUid(uid);
                    Commentdao cd=new Commentdao();
                    List<Comment> mycomment=new ArrayList<>();
                    mycomment=cd.findByUid(uid);
                %>
                <div class="col-sm-9">
                    <h1>News Release System</h1><hr/>
                    <div class="tab-content">
                        <div id="myComment" class="tab-pane in active" role="tabpanel">
                            <h3>我的评论</h3>
                            <dl>
                                <%
                                    for(Comment mct:mycomment){
                                        int mctnid=mct.getNewsid();
                                        News nw=nd.find(mctnid);
                                %>
                                    <dd><a href="newsContent.jsp?id=<%=mct.getNewsid()%>"><%=nw.getTitle()%></a></dd>
                                    <dt><%=mct.getComment()%></dt>
                                    <dt><a href="javascript:deletenews(<%=mct.getId()%>,'comment')">删除</a></dt>
                                    <hr/>
                                <%
                                    }
                                %>
                            </dl>
                        </div>
                        <div id="myNews" class="tab-pane" role="tabpanel">
                            <h3>我的新闻</h3>                  
                                <table class="table text-center">
                                    <tr>
                                        <th  class="text-center">标题</th><th  class="text-center">操作</th>
                                    </tr>
                                    <%
                                        for(News news:mynews){
                                    %>
                                        <tr>
                                            <td><a href="newsContent.jsp?id=<%=news.getId()%>"><%=news.getTitle()%></a></td>
                                            <td><a href="javascript:deletenews(<%=news.getId()%>,'news')">删除</a></td>
                                        </tr>
                                    <%
                                        }
                                    %>
                              </table>
                        </div>
                        <div id="update" class="tab-pane" role="tabpanel">
                            <h3>修改密码</h3>
                            <form class="form-group form-inline text-center">
                                <label for="pwd"></label>
                                <input type="password" name="pwd" id="pwd" placeholder="新密码" class="form-control"><br/><br/>
                                <label for="pwdTwice"></label>
                                <input type="password" name="pwdTwice" id="pwdTwice" placeholder="确认新密码" class="form-control" onkeyup="validate()"><br/><br/>
                                <input type="hidden" id="uid" value="${userid}">
                                <span id="tip"></span><br>
                                <input type="button" value="提交" onclick="changePwd()" class="btn">
                            </form>
                        </div>
                    </div>
                </div>
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
        
        
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $("#mytab a").click(function (e) {
                $(this).tab('show');
            });
            function validate(){
                var str=$("#pwd").val();
                var str2=$("#pwdTwice").val();
                $("#tip").css("color","red");
                if(str2!=str) $("#tip").html("两次密码不相同！");
                else $("#tip").html("两次密码相同,允许修改"); 
            }
            function  deletenews(id,type) {
                var tip = window.confirm("确定要删除吗？");
                if (tip) {
                    window.location.href = "${pageContext.request.contextPath }/delete?id="+id+"&type="+type;
                }
            }
            
            function changePwd(){
                var pwd=$("#pwd").val();
                var userid=$("#uid").val();
                $.ajax({
                    async:false,
                    type:"post",
                    url:"../changepwd",
                    data:{pwd:pwd,id:userid}, 
                    error:function(XMLHttpRequest){
                        console.log(XMLHttpRequest.readyState);
                    },
                    success:function(){
                        $("#tip").html("密码修改成功");
                        $("upwd").addClass("active");
                    }
                });
            }
        </script>
    </body>
</html>