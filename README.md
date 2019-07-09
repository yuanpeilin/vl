* 新建数据库配置文件和数据库连接驱动
* 导入HTML资源文件到web根目录中
* 新建一个user表, 并初始化一些数据

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
    * `req.getSession().setAttribute("username", username);`放入数据
    * `<%=ssession.getAttribute()%>`获取数据
    
* 修改注册登录相反的bug, 并从后台后渠道用户名
* 新建article数据库, 并建立对应的实体类
* 新建ArticleDao, 通过uid获取这个用户的所有文章
* 修改LoginServlet, 获取用户的所有文章并发送给前台
* 向数据库里面加数据
* 修改index.jsp, 文章列表改成动态

* 新建list.jsp
* 修改list.jsp