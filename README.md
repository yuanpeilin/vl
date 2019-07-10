* 新建数据库配置文件和数据库连接驱动
* 导入HTML资源文件到web根目录中
* 新建一个user表, 并初始化一些数据, 表结构如下
```sql
CREATE TABLE `user` (
   `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `username` varchar(45) NOT NULL,
   `password` varchar(45) NOT NULL,
   `email` varchar(45) DEFAULT NULL,
   PRIMARY KEY (`uid`),
   UNIQUE KEY `uid_UNIQUE` (`uid`),
   UNIQUE KEY `username_UNIQUE` (`username`)
 ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```

* 新建登陆注册servlet和user实体类
* 将index改为jsp

* 新建UserDao, 通过用户名获取password和uid
* 修改servlet
    * `<form>`标签的action属性的值对应`@webServlet`
    * `<input>`标签的name属性的值对应`req.getParameter()`
* 加入登陆注册模板
* 修改loginServlet, 获取用户名和密码, **二次确认未处理** 
* 修改UserDao, 新增向数据库插入用户的函数
* 修改registerServlet, 登录成功时向数据库新增用户, 并跳转主页
    * `resp.sendRedirect("index.jsp");`跳转主页
* 再次修改loginServlet, 密码合法时跳转到主页
    * `req.getSession().setAttribute("username", username);`后端放入数据
    * `<%=ssession.getAttribute()%>`获取数据
    
* 修改注册登录相反的bug, 并从后台后渠道用户名
* 新建article数据库, 并建立对应的实体类
```sql
CREATE TABLE `article` (
   `aid` int(11) NOT NULL AUTO_INCREMENT,
   `uid` int(11) NOT NULL,
   `title` varchar(45) NOT NULL,
   `text` varchar(10000) NOT NULL,
   `pic` varchar(300) NOT NULL DEFAULT '3.jpg',
   `date` date NOT NULL DEFAULT '1989-06-04',
   `like` int(10) unsigned NOT NULL DEFAULT '0',
   PRIMARY KEY (`aid`),
   UNIQUE KEY `aid_UNIQUE` (`aid`)
 ) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```
* 新建ArticleDao, 通过uid获取这个用户的所有文章
* 修改LoginServlet, 获取用户的所有文章并发送给前台
* 向数据库里面加数据
* 修改index.jsp, 文章列表改成动态

* 新建list.jsp
* 修改list.jsp

* 修改index.jsp, 将a标签的href属性改为`href="getArticle.do?aid=<%=article.getAid()%>"`
* 新建GetArticleServlet, 获取前端传过来的aid
    * 接受前端的数据`req.getParameter("aid")`
* 修改Dao, 新增通过aid获取文章的方法
* 修改GetArticleServlet, 获取article实例
* **将article实例绑定到session中, 并跳转**
```java
Article article = ArticleDao.getArticleByAid(aid);
req.getSession().setAttribute("article",article);
resp.sendRedirect("info.jsp");
```
* 新建info.jsp并修改

* 将yq改成用户的名字
* 修改所有的href
* 加入验证的一些工具
* 加入图片

* 新建comment数据库
```sql
CREATE TABLE `vltest`.`conment` (
  `cid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(2000) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL DEFAULT "1989-06-04",
  `aid` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE INDEX `cid_UNIQUE` (`cid` ASC) VISIBLE);
```
* 新建对应的实体类
* 新建对应的Dao层, 通过aid获取所有的评论
* 修改GetArticleServlet, 获取评论并绑定到session中

* 修改login.jsp, 准备验证
    * 导入对应的jar
    * 添加所需要的html, css, js. 注意改路径
    * 四个java类, 改口令
    * 改Java类对应的注解

* 删除所有的gtlog
* 调整登录逻辑