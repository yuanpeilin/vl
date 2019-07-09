package main;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login.do")
public class LoginServlet extends javax.servlet.http.HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        // 从登录界面获取username和password
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(this.getClass().toString() + " " + username + " " + password);

        // 判断合法性
        if (UserDao.getPasswordByUsername(username).equals(password)) {
            // 将用户姓名传给前台
            req.getSession().setAttribute("username", username);
            resp.sendRedirect("index.jsp");
        }
    }

}
