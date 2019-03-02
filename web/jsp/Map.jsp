<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRS-网站地图</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/Map.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div id="nav" class="row">
                <h1 class="col-sm-offset-6 col-sm-6">News Release System</h1>
                <ul class="nav nav-tabs col-sm-12" id="mytab">
                    <li class="active"><a href="#map">网站地图</a></li>
                    <li><a href="#about">关于我们</a></li>
                    <li><a href="#contact">联系我们</a></li>
                    <li><a href="#contribution">供稿服务</a></li>
                </ul>
                
                <div class="tab-content">
                    <div id="map" class="tab-pane in active" role="tabpanel">
                        <h2>分类新闻</h2>
                        <h3>按类型</h3>
                        <ul class="newsType row"></ul><hr/>
                        <h3>按地区</h3>
                        <ul class="newsCity row"></ul>
                    </div>
                    <div id="about" class="tab-pane" role="tabpanel">
                        <h2>关于我们</h2>
                        <p>信息时代的高速发展，传统的报纸已经远远不能满足人们的需求，人们更加希望于能够在网上了解更多的新闻和信息，于是我们就很有必要在网上创建一个新闻发布管理系统。部分网站都是采用静态的方式来发布和管理信息的，科室网站需要更新的信息量越来越大，所以这很不利于网站管理人员的工作。为了更加方便的管理网站，我们很迫切需要利用动态技术创建一个新闻发布管理信息系统。</p>
                        <p>
                            网络的蓬勃发展，使新闻的传播方式发生了巨大的变化，传统的信息传播媒体电视、广播、报纸已经不再是人们茶余饭后的主要精神甜点，人们更多的开始关注网络新闻。由于互联网所容纳的信息量大、内容丰富、信息及时、准确，更有相关信息的全面的介绍与比较，大大地方便了人们的阅读，因此在短短几年的时间里，互联网便济身于众多媒体之间，并具有相当一部分媒体人群。借此东风，新闻网也迅速发展起来，它内容丰富，涉及到商业、工业、农业、银行、财政、教育、娱乐、信息等各个产业，信息量大，不仅有实事新闻，还有相关的行业信息，同时新闻网具有互联网所具备的一切特性。在全球网络化、信息化的今天，新闻网迅速发展，大大地丰富了人们的生活，不知不觉中，它已经成为人们生活中不可或缺的重要组成部分。
                        </p>
                        <p>其中新闻管理系统是构成企业网站的一个重要组成部分。</p>
                    </div>
                    <div id="contact" class="tab-pane" role="tabpanel">
                        <h2>联系我们</h2>
                        <div class="col-sm-offset-1 col-sm-4">
                            <h3>方式一</h3>
                            <ul>
                                <li>地址：扬州大学扬子津校区</li>
                                <li>电话：0000-12345678</li>
                                <li>传真：0000-12345678</li>
                                <li>邮编：225100</li>
                            </ul>
                        </div>
                        <div class="col-sm-offset-2 col-sm-4">
                            <h3>方式二</h3>
                            <ul>
                                <li>地址：扬州大学扬子津校区</li>
                                <li>电话：0000-12345678</li>
                                <li>传真：0000-12345678</li>
                                <li>邮编：225100</li>
                            </ul>
                        </div>
                    </div>
                    <div id="contribution" class="tab-pane" role="tabpanel">
                        <h2>供稿服务</h2>
                        <form action="#" method="post" class="form-group">
                            <label for="title"></label>
                            <input type="text" name="title" id="title" placeholder="标题" class="form-control" onkeyup="validate()" required>
                            <label for="time"></label>
                            <input type="text" name="time" id="time" placeholder="时间" class="form-control" onkeyup="validate()" required>
                            <label for="type"></label>
                            <input type="text" name="type" id="type" placeholder="类型" class="form-control" onkeyup="validate()" required>
                            <label for="province"></label>
                            <input type="text" name="province" id="province" placeholder="地区" class="form-control" onkeyup="validate()" required>
                            <label for="content"></label>
                            <textarea rows="10" cols="10" placeholder="正文" class="form-control" id="content" onkeyup="validate()" required></textarea>
                            <br/><span id="tip" style="color: red;">请填写所有信息</span><br/>
                            <input type="submit" value="提交" class="col-sm-offset-5">
                            <input type="reset" value="重置">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar-fixed-bottom">
            <h2>News Release System</h2>
            <ul>
                <li>地址：扬州大学扬子津校区</li>
                <li>电话：0000-12345678</li>
                <li>传真：0000-12345678</li>
                <li>邮编：225100</li>
            </ul>
        </div>
        <script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/Map.js" type="text/javascript"></script>
    </body>
</html>