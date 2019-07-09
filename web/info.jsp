<%@ page import="obj.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String name = (String) session.getAttribute("username");
    ArrayList<Article> articleList = (ArrayList<Article>) session.getAttribute("articleList");
    Article articleInfo = (Article) session.getAttribute("article");
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
                <div class="share"> 分享</div>
                <div class="nextinfo">
                    <p>上一篇：<a href="/download/f/881.html">纯文字个人博客模板《时尚黑》</a></p>
                    <p>下一篇：<a href="/download/f/886.html">html5 个人博客模板《蓝色畅想》</a></p>
                </div>
            </div>
            <div class="viewbox">
                <h2 class="newstitle"><b>随便看看</b></h2>
                <ul>
                    <li><a href="/"><i><img
                            src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg"></i>
                        <p>3dmax利用VRay光源制作灯带</p>
                        <span>2018年7月25日</span></a></li>
                    <li><a href="/"><i><img
                            src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg"></i>
                        <p>3dmax利用VRay光源制作灯带</p>
                        <span>2018年7月25日</span></a></li>
                    <li><a href="/"><i><img
                            src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg"></i>
                        <p>3dmax利用VRay光源制作灯带</p>
                        <span>2018年7月25日</span></a></li>
                    <li><a href="/"><i><img
                            src="http://www.yangqq.com/d/file/blogs/2018-08-22/28e3bbca2ae0205f641a9072ecb7c100.jpg"></i>
                        <p>3dmax利用VRay光源制作灯带</p>
                        <span>2018年7月25日</span></a></li>
                </ul>
            </div>

            <div class="pinlun">
                <h2 class="newstitle"><b>评论</b></h2>
                <div class="gbok">
                    评论插件
                </div>
            </div>

        </div>

        <div class="rside">
            <div class="news">
                <h2 class="newstitle"><b>文章排行</b></h2>
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
