package main;

import dao.ArticleDao;
import dao.UserDao;
import obj.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        // 从注册界面获取username和password
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(this.getClass().toString() + " " + username + " " + password);

        boolean flag = UserDao.addUser(username, password);
        System.out.println(this.getClass().toString() + flag);

        // 将用户姓名传给前台
        req.getSession().setAttribute("username", username);
        // 获取用户的所有文章
        int uid = UserDao.getUidByUsername(username);
        ArrayList<Article> articleList = ArticleDao.getArticlesByUid(uid);
        req.getSession().setAttribute("articleList", articleList);
        // 获取点赞数量最高的文章
        ArrayList<Article> topArticles = ArticleDao.getTopArticle(8);
        req.getSession().setAttribute("topArticles", topArticles);
        // 跳转到主页
        resp.sendRedirect("index.jsp");
    }

}
