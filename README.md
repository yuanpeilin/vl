* 新建数据库配置文件和数据库连接驱动
* 导入HTML资源文件到web根目录中
* 新建一个user表, 并初始化一些数据

* 新建登陆注册servlet和user实体类
* 将index改为jsp

* 新建UserDao, 通过用户名获取password和uid
* 修改servlet
    * `<form>`标签的action属性的值对应`@webServlet`
    * `<input>`标签的name属性的值对应`req.getParameter()`
