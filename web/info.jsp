<%@ page import="obj.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="obj.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String name = (String) session.getAttribute("username");
    ArrayList<Article> articleList = (ArrayList<Article>) session.getAttribute("articleList");
    Article articleInfo = (Article) session.getAttribute("article");
    ArrayList<Article> topArticles = (ArrayList<Article>) session.getAttribute("topArticles");
    ArrayList<Comment> commentList = (ArrayList<Comment>) session.getAttribute("commentList");
%>

<head>
    <meta charset="utf-8">
    <title><%=name%></title>
    <meta name="keywords" content="关键词,关键词,关键词,关键词,5个关键词"/>
    <meta name="description" content="网站简介，不超过80个字"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/index.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/comm.js"></script>
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <![endif]-->
    <style>
        .share { padding: 20px; }
        .diggit {  width: 160px; margin: auto; background: #E2523A; color: #fff; box-shadow: 1px 2px 6px 0px rgba(0,0,0,.2); border-radius: 3px; line-height: 40px; text-align: center; }
        .diggit a { color: #fff; }
        #diggnum { margin: 5px; }
        .news_pl { margin: 10px 0 20px 0; width: 100%; overflow: hidden; }
        .news_pl h2 { border-bottom: #000 2px solid; line-height: 40px; font-size: 14px; padding-left: 10px; color: #000 }
        p.fbtime { color: #000; }
        .fbtime span { float: right; color: #999; font-size: 12px;    width: 70px;
            overflow: hidden;
            white-space: nowrap; }
        p.fbinfo { margin: 10px 0; }
        .fb ul { margin: 10px 10px; padding: 10px 10px 10px 70px; border-bottom: #ececec 1px solid; }
        .fb:nth-child(8n-7) ul { background: url(images/tx10.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-6) ul { background: url(images/tx9.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-5) ul { background: url(images/tx8.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-4) ul { background: url(images/tx7.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-3) ul { background: url(images/tx6.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-2) ul { background: url(images/tx5.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n-1) ul { background: url(images/tx4.jpg) no-repeat top 20px left 10px; }
        .fb:nth-child(8n) ul { background: url(images/tx3.jpg) no-repeat top 20px left 10px; }
        .fb:first-child ul { background: url(images/tx2.jpg) no-repeat top 20px left 10px; }
        .fb:last-child ul { background: url(images/tx1.jpg) no-repeat top 20px left 10px; }
        #plpost { margin: 0 20px }
        .saying { line-height: 30px; color: #a9a6a6; }
        .saying span { float: right }
        .saying span a { color: #de1513; }
        img#plKeyImg { display: inline-block; }
        .yname { margin: 10px 10px 10px 0 }
        .yname span, .yzm span { padding-right: 10px; }
        .yzm { margin: 0 10px 10px 0 }
        #plpost input[type="submit"] { display: block; background: #303030; color: #fff; border: 0; line-height: 30px; padding: 0 20px; border-radius: 5px; float: right; }
        textarea#saytext { width: 100%; }
    </style>
    <script>
        function like(aid) {
            $.ajax({
                // 请求方式
                type:"POST",
                // 请求地址
                url:"like.do?aid="+aid,
                // 请求成功
                success : function (result) {
                    var num = document.getElementById("diggnum").innerText;
                    num = parseInt(num) + 1;
                    document.getElementById("diggnum").innerText = num;
                },
                // 请求失败
                error : function (e) {
                    alert("Unknown Error");
                }
            })
        }
    </script>
</head>
<body>
<header>
    <div class="logo">杨青个人博客</div>
    <div class="top-nav">
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="nav">
            <li><a href="index.jsp">网站首页</a></li>
            <li><a href="list.jsp">个人博客日记</a></li>
            <li><a href="/">个人博客模板</a></li>
            <li><a href="/">博客网站制作</a></li>
            <li><a href="/">网页设计心得</a></li>
            <li><a href="/">优秀个人博客</a></li>
            <li><a href="/">关于我</a></li>
            <li><a href="/">留言</a></li>
            <li><a href="login.html">登录/注册</a></li>
        </ul>
    </div>
</header>

<aside class="side">
    <div class="about"><i><a href="/"><img src="images/avatar.jpg"></a></i>
        <p><%=name%>，一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。</p>
    </div>
    <div class="weixin"><img src="http://www.yangqq.com/skin/html/images/wx.jpg">
        <p>关注我 么么哒！</p>
    </div>
</aside>

<main>
    <div class="main-content">

        <div class="welcome">您现在的位置是：首页>个人博客模板</div>

        <div class="blogbox">
            <div class="contentbox">
                <h2 class="contitle"><%=articleInfo.getTitle()%></h2>
                <p class="bloginfo">
                    <span><%=name%></span>
                    <span><%=articleInfo.getDate()%></span>
                    <span><a href="/">个人博客模板</a></span>
                </p>
                <p class="jianjie"><b>简介</b><%=articleInfo.getText().substring(0,3)%></p>
                <div class="entry">
                    <%=articleInfo.getText()%>
                </div>

                <div class="share">
                    <p class="diggit"><a href="javascript:like(<%=articleInfo.getAid()%>);"> 很赞哦！ </a>
                    (<b id="diggnum"><%=articleInfo.getLikeCount()%></b>)</p>
                </div>

                <div class="nextinfo">
                    <p>上一篇：<a href="/download/f/881.html">纯文字个人博客模板《时尚黑》</a></p>
                    <p>下一篇：<a href="/download/f/886.html">html5 个人博客模板《蓝色畅想》</a></p>
                </div>
            </div>

<%--            <div class="viewbox">--%>
<%--                <h2 class="newstitle"><b>随便看看</b></h2>--%>
<%--                <ul>--%>
<%--                    <li><a href="/"><i><img--%>
<%--                            src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg"></i>--%>
<%--                        <p>3dmax利用VRay光源制作灯带</p>--%>
<%--                        <span>2018年7月25日</span></a></li>--%>
<%--                    <li><a href="/"><i><img--%>
<%--                            src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg"></i>--%>
<%--                        <p>3dmax利用VRay光源制作灯带</p>--%>
<%--                        <span>2018年7月25日</span></a></li>--%>
<%--                    <li><a href="/"><i><img--%>
<%--                            src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg"></i>--%>
<%--                        <p>3dmax利用VRay光源制作灯带</p>--%>
<%--                        <span>2018年7月25日</span></a></li>--%>
<%--                    <li><a href="/"><i><img--%>
<%--                            src="http://www.yangqq.com/d/file/blogs/2018-08-22/28e3bbca2ae0205f641a9072ecb7c100.jpg"></i>--%>
<%--                        <p>3dmax利用VRay光源制作灯带</p>--%>
<%--                        <span>2018年7月25日</span></a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>


            <div class="pinlun">
                <h2 class="newstitle"><b>评论</b></h2>
                <div class="gbok">
                    <%
                        for (Comment comment : commentList) {
                    %>
                    <div class="fb">
                        <ul>
                            <p class="fbtime">
                                <span><%=comment.getDate().substring(5)%></span>
                                <%=comment.getName()%>
                            </p>
                            <p class="fbinfo"><%=comment.getText()%></p>
                        </ul>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <script>
                function CheckPl(obj)
                {
                    if(obj.saytext.value=="")
                    {
                        alert("您没什么话要说吗？");
                        obj.saytext.focus();
                        return false;
                    }
                    return true;
                }
            </script>
            <form action="/e/pl/doaction.php" method="post" name="saypl" id="saypl" onsubmit="return CheckPl(document.saypl)">
                <div id="plpost">
                    <p class="saying"><span><a href="/e/pl/?classid=77&amp;id=106">共有<%=commentList.size()%>条评论</a></span>来说两句吧...</p>
                    <p class="yname"><span>用户名:</span>
                        <input name="username" type="text" class="inputText" id="username" value="" size="16">
                    </p>
<%--                    <p class="yzm"><span></span>--%>
<%--                        <input name="key" type="text" class="inputText" size="16">--%>
<%--                    </p>--%>
                    <input name="nomember" type="hidden" id="nomember" value="1" checked="checked">
                    <textarea name="saytext" rows="6" id="saytext"></textarea>
                    <input name="imageField" type="submit" value="提交">

                    <input name="id" type="hidden" id="id" value="106">
                    <input name="classid" type="hidden" id="classid" value="77">
                    <input name="enews" type="hidden" id="enews" value="AddPl">
                    <input name="repid" type="hidden" id="repid" value="0">
                    <input type="hidden" name="ecmsfrom" value="/joke/talk/2018-07-23/106.html">
                </div>
            </form>

        </div>

        <div class="rside">
            <div class="news">
                <h2 class="newstitle"><b>文章排行</b></h2>
                <ul>
                    <%
                        if (topArticles != null)
                            for (int i = 0; i < topArticles.size(); ++i) {
                                Article article = topArticles.get(i);
                    %>
                    <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getLikeCount()%>
                            </span><%=article.getTitle()%>
                    </a></li>
                    <%
                            }
                    %>
                </ul>
            </div>
            <div class="news">
                <h2 class="newstitle"><b>本栏推荐</b></h2>
                <ul>
                    <%
                        if (articleList != null)
                            for (int i = 0; i < articleList.size(); ++i) {
                                Article article = articleList.get(i);
                    %>
                    <li><a href="getArticle.do?aid=<%=article.getAid()%>"><span><%=article.getDate().substring(5)%></span><%=article.getTitle()%></a></li>
                    <%
                            }
                    %>
                </ul>
            </div>
            <div class="news">
                <h2 class="newstitle"><b>栏目更新</b></h2>
                <ul>
                    <%
                        if (articleList != null)
                            for (int i = 0; i < articleList.size(); ++i) {
                                Article article = articleList.get(i);
                    %>
                    <li><a href="getArticle.do?aid=<%=article.getAid()%>"><span><%=article.getDate().substring(5)%></span><%=article.getTitle()%></a></li>
                    <%
                            }
                    %>
                </ul>
            </div>
        </div>

        <div class="copyright">
            <p>Copyright 2018 Inc. AllRights Reserved. Design by <a href="/"><%=name%>个人博客</a> 蜀ICP备11002373号-1</p>
        </div>
    </div>
</main>
<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
</html>
