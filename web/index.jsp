<%@ page import="java.util.ArrayList" %>
<%@ page import="obj.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String name = (String) session.getAttribute("username");
    ArrayList<Article> articleList = (ArrayList<Article>) session.getAttribute("articleList");
    ArrayList<Article> topArticles = (ArrayList<Article>) session.getAttribute("topArticles");
%>

<head>
    <meta charset="utf-8">
    <title><%=session.getAttribute("username")%>个人博客</title>
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
    <div class="logo"><%=name%>个人博客</div>

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
            <%
                if (name == null) {
            %>
            <li><a href="login.html">登录/注册</a></li>
            <%
            } else {
            %>
            <li><a href="login.html"><%=name%>
            </a></li>
            <%
                }
            %>
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
        <div class="welcome"> 您好，欢迎您访问我们的官方网站！</div>

        <div class="picbox">
            <h2 class="pictitle"><a href="/">个人博客网站模板</a></h2>
            <!--box begin-->
            <div class="Box_con"><span class="btnl btn" id="btnl"></span> <span class="btnr btn" id="btnr"></span>
                <div class="conbox" id="BoxUl">
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li class="cur"><a href="getArticle.do?aid=<%=article.getAid()%>"><img
                                src=<%="images/" + article.getPic()%> alt=""/>
                            <p><%=article.getTitle()%>
                            </p>
                        </a></li>
                        <%
                                }
                        %>

                    </ul>
                </div>
            </div>
            <!--box end-->
        </div>

        <div class="newsbox">
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="#">点赞</a></span><b>热门文章</b></h2>
                    <ul>
                        <%
                            if (topArticles != null)
                                for (int i = 0; i < topArticles.size(); ++i) {
                                    Article article = topArticles.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getLikeCount()%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计思维</b></h2>
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getDate().substring(5)%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>结构设计</b></h2>
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getDate().substring(5)%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计素材</b></h2>
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getDate().substring(5)%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计教程</b></h2>
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getDate().substring(5)%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计心得</b></h2>
                    <ul>
                        <%
                            if (articleList != null)
                                for (int i = 0; i < 8; ++i) {
                                    Article article = articleList.get(i);
                        %>
                        <li><a href="getArticle.do?aid=<%=article.getAid()%>">
                            <span><%=article.getDate().substring(5)%></span>
                            <%=article.getTitle()%>
                        </a></li>
                        <%
                                }
                        %>
                    </ul>
                </div>
            </section>
        </div>

        <div class="blank"></div>

        <div class="links">
            <h2 class="linktitle">合作伙伴</h2>
            <ul class="link-pic">
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
                <li><a href="/"><img src="images/yqlj.png"></a></li>
            </ul>
            <ul class="link-text">
                <li><a href="/"><%=name%>个人博客</a></li>
                <li><a href="/"><%=name%>个人博客</a></li>
                <li><a href="/"><%=name%>个人博客</a></li>
                <li><a href="/"><%=name%>个人博客</a></li>
                <li><a href="/"><%=name%>个人博客</a></li>
            </ul>
        </div>

        <div class="copyright">
            <p>Copyright 2018 Inc. AllRights Reserved. Design by <a href="/"><%=name%>
                个人博客</a> 蜀ICP备11002373号-1</p>
        </div>
    </div>
</main>
<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
</html>
