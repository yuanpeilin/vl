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
    <title><%=name%>
    </title>
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

        <div class="welcome">您现在的位置是：首页>个人博客日记</div>
        <div class="blogbox">
            <div class="bloglist">
                <ul>

                    <%
                        if (articleList != null)
                            for (int i = 0; i < articleList.size(); ++i) {
                                Article article = articleList.get(i);
                    %>
                    <li>
                        <h2><a href="getArticle.do?aid=<%=article.getAid()%>"><%=article.getTitle()%>
                        </a></h2>
                        <i><a href="getArticle.do?aid=<%=article.getAid()%>"><img src=<%="images/"+article.getPic()%>></a></i>
                        <p class="blogtext"><%=article.getText()%>
                        </p>
                        <p class="bloginfo">
                            <span><%=name%></span>
                            <span><%=article.getDate()%></span>
                            <span><a href="/">个人博客模板</a></span>
                        </p>
                    </li>
                    <%
                            }
                    %>

                </ul>
            </div>
            <div class="pagelist"><a title="Total record">&nbsp;<b>170</b> </a>&nbsp;&nbsp;&nbsp;<b>1</b>&nbsp;<a
                    href="/jstt/index_2.html">2</a>&nbsp;<a href="/jstt/index_3.html">3</a>&nbsp;<a
                    href="/jstt/index_4.html">4</a>&nbsp;<a href="/jstt/index_5.html">5</a>&nbsp;<a
                    href="/jstt/index_6.html">6</a>&nbsp;<a href="/jstt/index_2.html">下一页</a>&nbsp;<a
                    href="/jstt/index_15.html">尾页</a></div>
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
                    <li><a href="getArticle.do?aid=<%=article.getAid()%>"><span><%=article.getDate().substring(5)%></span><%=article.getTitle()%>
                    </a></li>
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
                    <li><a href="getArticle.do?aid=<%=article.getAid()%>"><span><%=article.getDate().substring(5)%></span><%=article.getTitle()%>
                    </a></li>
                    <%
                            }
                    %>
                </ul>
            </div>
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
