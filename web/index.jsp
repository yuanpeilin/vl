<%@ page import="java.util.ArrayList" %>
<%@ page import="obj.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <div class="logo"><%=session.getAttribute("username")%>个人博客</div>

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

<%--    <div class="search">--%>
<%--        <form action="/e/search/index.php" method="post" name="searchform" id="searchform">--%>
<%--            <input name="keyboard" id="keyboard" class="input_text" value="搜索你喜欢的" style="color: rgb(153, 153, 153);"--%>
<%--                   onfocus="if(value=='搜索你喜欢的'){this.style.color='#000';value=''}"--%>
<%--                   onblur="if(value==''){this.style.color='#999';value='搜索你喜欢的'}" type="text">--%>
<%--            <input name="show" value="title" type="hidden">--%>
<%--            <input name="tempid" value="1" type="hidden">--%>
<%--            <input name="tbname" value="news" type="hidden">--%>
<%--            <input name="Submit" class="input_submit" value="" type="submit">--%>
<%--        </form>--%>
<%--    </div>--%>

</header>

<aside class="side">
    <div class="about"><i><a href="/"><img src="images/avatar.jpg"></a></i>
        <p><%=session.getAttribute("username")%>，一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。</p>
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
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/news/humor/2014-01-13/67ce0f90b72e884e562d3360575ab3c3.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站1</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/news/life/2018-04-27/762f99f369ae786f970477feeb3b9d77.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站2</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/news/life/2018-06-17/917d732926d79cc2ae1012831ce51d1e.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站3</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/jstt/bj/2018-06-29/3f0b6da48a6fd4e626a021ff7bd0d74f.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站4</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/news/life/2018-06-29/75842f4d1e18d692a66c38eb172a40ab.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站5</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/news/s/2014-06-14/072f267a54748c6e71d40a2d03978993.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站6</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/blogs/2018-08-22/28e3bbca2ae0205f641a9072ecb7c100.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站7</p>
                        </a></li>
                        <li class="cur"><a href="/"><img
                                src="http://www.yangqq.com/d/file/blogs/2018-08-17/3ee0644472fa8556562ab3d8716b5316.jpg"
                                alt=""/>
                            <p>如何快速建立自己的个人博客网站8</p>
                        </a></li>
                    </ul>
                </div>
            </div>
            <!--box end-->
        </div>

        <div class="newsbox">
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>个人博客日记</b></h2>
                    <ul>
<%--                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>--%>

                        <%
                            ArrayList<Article> list = (ArrayList<Article>) session.getAttribute("articleList");
                            for (int i = 0; i < 8; ++i) {
                                Article article = list.get(i);
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
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计思维</b></h2>
                    <ul>
                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                        <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                        <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                        <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                        <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                        <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                        <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                        <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>结构设计</b></h2>
                    <ul>
                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                        <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                        <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                        <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                        <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                        <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                        <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                        <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计素材</b></h2>
                    <ul>
                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                        <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                        <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                        <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                        <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                        <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                        <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                        <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计教程</b></h2>
                    <ul>
                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                        <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                        <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                        <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                        <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                        <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                        <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                        <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
                    </ul>
                </div>
            </section>
            <section>
                <div class="news">
                    <h2 class="newstitle"><span><a href="/">更多</a></span><b>设计心得</b></h2>
                    <ul>
                        <li><a href="/"><span>08-30</span>如何快速建立自己的个人博客网站</a></li>
                        <li><a href="/"><span>08-30</span>个人博客，属于我的小世界！</a></li>
                        <li><a href="/"><span>08-30</span>网易博客关闭，何不从此开始潇洒行走江湖！</a></li>
                        <li><a href="/"><span>08-30</span>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
                        <li><a href="/"><span>08-30</span>帝国cms 循环调用子栏目信息以及头条图片</a></li>
                        <li><a href="/"><span>08-30</span>我是怎么评价自己的？</a></li>
                        <li><a href="/"><span>08-30</span>html5 个人博客模板《蓝色畅想》</a></li>
                        <li><a href="/"><span>08-30</span>【匆匆那些年】总结个人博客经历的这四年</a></li>
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
                <li><a href="/"><%=session.getAttribute("username")%>个人博客</a></li>
                <li><a href="/"><%=session.getAttribute("username")%>个人博客</a></li>
                <li><a href="/"><%=session.getAttribute("username")%>个人博客</a></li>
                <li><a href="/"><%=session.getAttribute("username")%>个人博客</a></li>
                <li><a href="/"><%=session.getAttribute("username")%>个人博客</a></li>
            </ul>
        </div>

        <div class="copyright">
            <p>Copyright 2018 Inc. AllRights Reserved. Design by <a href="/"><%=session.getAttribute("username")%>
                个人博客</a> 蜀ICP备11002373号-1</p>
        </div>
    </div>
</main>
<a href="#" class="cd-top cd-is-visible">Top</a>
</body>
</html>
