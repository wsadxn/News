<%-- 
    Document   : admin
    Created on : 2018-6-26, 9:07:29
    Author     : asuspc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-管理员</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script>
            function manage(){
                $.ajax({
                    async:false,
                    type:"post",
                    url:"../manage",
                    data:{}, 
                    error:function(XMLHttpRequest){
                        console.log(XMLHttpRequest.readyState);
                    }
                });
            }
            manage();
        </script>
    </head>
    <body>
        <c:if test="${allnewslist==null}">
            <script>
                location.reload();
            </script>
        </c:if>
        <div class="container">
            <div class="row main">
                <div class="col-sm-3">
                    <h2>您好，管理员</h2>
                    <ul id="mytab">
                        <li class="active"><a href="#publish">发布新闻</a></li>
                        <li><a href="#wait" onclick="load()">待审核</a></li>
                        <li id="upwd"><a href="#update">修改密码</a></li>
                        <li><a href="#manage">管理新闻</a></li>
                        <li><a href="../index.jsp">返回首页</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <h1>News Release System</h1><hr/>
                    <div class="tab-content">
                        <div id="publish" class="tab-pane in active" role="tabpanel">
                            <h3>发布新闻</h3>
                            <form action="../addnews" type="post" class="form-group">
                                <label for="title"></label>
                                <input type="text" name="title" id="title" placeholder="标题" class="form-control">
                                <label for="time"></label>
                                <input type="text" name="time" id="time" placeholder="时间" class="form-control">
                                <label for="type"></label>
                                <input type="text" name="type" id="type" placeholder="类型" class="form-control">
                                <label for="province"></label>
                                <input type="text" name="province" id="province" placeholder="地区" class="form-control">
                                <label for="main"></label>
                                <textarea rows="2" cols="10" placeholder="主要内容" class="form-control" id="main" name="main" onkeyup="validate()" required></textarea>
                                <label for="content"></label>
                                <textarea rows="6" cols="10" placeholder="正文" class="form-control" id="content" name="content"></textarea>
                                <input type="hidden" name="userid" value="${userid}">
                                <input type="submit" value="提交" class="col-sm-offset-5">
                                <input type="reset" value="重置">
                            </form>
                        </div>
                        <div id="wait" class="tab-pane" role="tabpanel">
                            <h3>审核新闻</h3>
                            <p>共${waitresult}条新闻待审核</p>
                                <table class="table text-center">
                                    <tr>
                                        <th>标题</th><th colspan="2">操作</th>
                                    </tr>
                                    <c:forEach var="waitnews" items="${waitlist}">
                                        <tr>
                                            <td>${waitnews.getTitle()}</td>
                                            <td><a href="update.jsp?id=${waitnews.getId()}">发布</a></td>
                                            <td><a href="javascript:deletenews(${waitnews.getId()},'news')">删除</a></td>
                                        </tr>
                                    </c:forEach>
                              </table>
                        </div>
                        <div id="update" class="tab-pane" role="tabpanel">
                            <h3>修改密码</h3>
                            <form class="form-group form-inline text-center">
                                <label for="pwd"></label>
                                <input type="password" name="pwd" id="pwd" placeholder="新密码" class="form-control"><br/><br/>
                                <label for="pwdTwice"></label>
                                <input type="password" name="pwdTwice" id="pwdTwice" placeholder="确认新密码" class="form-control" onkeyup="validate()"><br/><br/>
                                <input type="hidden" id="adminid" value="${userid}">
                                <span id="tip"></span><br>
                                <input type="button" value="提交" onclick="changePwd()" class="btn">
                            </form>
                        </div>
                        <div id="manage" class="tab-pane" role="tabpanel">
                            <h3>管理新闻</h3>
                            <table class="table text-center">
                                    <tr>
                                        <th>标题</th><th colspan="2">操作</th>
                                    </tr>
                                    <c:forEach var="allnews" items="${allnewslist}">
                                        <tr>
                                            <td>${allnews.getTitle()}</td>
                                            <td><a href="update.jsp?id=${allnews.getId()}">编辑</a></td>
                                            <td><a href="javascript:deletenews(${allnews.getId()},'news')">删除</a></td>
                                        </tr>
                                    </c:forEach>
                              </table>
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
                var userid=$("#adminid").val();
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
            
            function load(){
                window.location.href="admin.jsp#wait";
            }
        </script>
    </body>
</html>