package main;

import dao.ArticleDao;
import dao.UserDao;
import obj.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/login.do")
public class LoginServlet extends javax.servlet.http.HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = resp.getWriter();

        // 从登录界面获取username和password
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(this.getClass().toString() + " " + username + " " + password);

        // 判断合法性
        try {
            String passwordLegal = UserDao.getPasswordByUsername(username);
            if (!passwordLegal.equals(null))
                if (!passwordLegal.equals(password)) {
                    printWriter.println("密码错误");
                } else {
                    // 将用户姓名传给前台
                    req.getSession().setAttribute("username", username);
                    resp.sendRedirect("index.jsp");
                    // 获取用户的所有文章
                    int uid = UserDao.getUidByUsername(username);
                    ArrayList<Article> articleList = ArticleDao.getArticlesByUid(uid);
                    req.getSession().setAttribute("articleList", articleList);
                }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

}
