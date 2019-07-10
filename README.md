# 总结
### 前端发送数据给后端
* 前端通过`<form>`标签的`action`属性设置要传递的值
* 前端通过`<input>`标签设置要传递的值, `name`属性相当于key
```html
<form action="login.do?aid=<%=article.getAid()%>" method="post">
    <input type="text" name="username">
    <input type="password" name="password">
    <input type="submit">
</form>
```
* 后端通过`req.getParameter(String key)`获得值
```java
@WebServlet("/login.do")
public class LoginServlet extends javax.servlet.http.HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String aid = req.getParameter("aid");
    }

}

```
### 后端发送数据给前端
* 后端将数据放到session中, 并设置session的属性
```java
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getSession().setAttribute(String key, Object value);
}
```
* 前端获取数据
```jsp
<%Object value = ssession.getAttribute(String key)%>
```
### 后端跳转页面
```java
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.sendRedirect("index.jsp");
}
```
### 数据库驱动连接
```java
public class ConnectionUtil {

    private static String username, password, url, driver;
    private static final String path = "*********.properties";

    static {
        try {
            getParam(path);
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    /**
     * 通过配置文件读取一些配置的值
     */
    private static void getParam(String path) throws IOException {
        // 获取类装载器
        ClassLoader classLoader = ConnectionUtil.class.getClassLoader();
        // 通过类加载器来加载配置文件
        InputStream inputStream = classLoader.getResourceAsStream(path);
        // 配置文件是properties文件, 所以创建一个Properties对象
        Properties properties = new Properties();
        // 使用properties对象去读取配置文件的文件流
        properties.load(inputStream);

        // 通过指定的key来获取对应的value
        username = properties.getProperty("username");
        password = properties.getProperty("password");
        url = properties.getProperty("url");
        driver = properties.getProperty("driver");
    }

}
```
### Dao层模板
```java
public static String getSomethingByObject(Object o) {
    String sql = "";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        connection = ConnectionUtil.getConnection();
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, Object o);
        resultSet = preparedStatement.executeQuery();
    
    
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
        }
    }
}
```

# 基本步骤
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

<br>

* 新建登陆注册servlet和user实体类
* 将index改为jsp

<br>

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

<br>
    
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

<br>

* 新建list.jsp
* 修改list.jsp

<br>

* 修改index.jsp, 将a标签的href属性改为`href="getArticle.do?aid=<%=article.getAid()%>"`
* 新建GetArticleServlet, 获取前端传过来的aid
    * **接受前端的数据** `req.getParameter("aid")`
* 修改Dao, 新增通过aid获取文章的方法
* 修改GetArticleServlet, 获取article实例
* **将article实例绑定到session中, 并跳转**
```java
Article article = ArticleDao.getArticleByAid(aid);
req.getSession().setAttribute("article",article);
resp.sendRedirect("info.jsp");
```
* 新建info.jsp并修改

<br>

* 将yq改成用户的名字
* 修改所有的href
* 加入验证的一些工具
* 加入图片

<br>

* 新建comment数据库
```sql
CREATE TABLE `vltest`.`comment` (
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

<br>

* 修改login.jsp, 准备验证
    * 导入对应的jar
    * 添加所需要的html, css, js. 注意改路径
    * 四个java类, 改口令
    * 改Java类对应的注解

<br>

* 删除所有的gtlog
* 调整登录逻辑
* 加入点赞html代码和对应的ajax代码, 测试是否能行
* 新建一个servlet处理点赞的请求
* 修改Dao层使得通过aid增加点赞数量

<br>

* 修改Dao层, 新增获取点赞数量最多的文章的函数
* 修改LoginServlet, 把获取到的文章绑定到session中
* 修改index.jsp和list.jsp, 获取点赞文章

<br>

* 查看CommentDao, 通过aid获取所有评论
* 查看GetArticleServlet, 将所有评论绑定到session中
* 修改info.jsp, 添加评论信息

<br>

* 修改Dao层, 增加新建评论信息的方法
* 新建servlet, 获取前端传来的信息
* 修改Dao层, 传入Dao层的对象应为Comment实体类

<br>

*  放弃ajax刷新评论

