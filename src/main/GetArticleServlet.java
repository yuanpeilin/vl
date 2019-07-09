package main;

import dao.ArticleDao;
import obj.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getArticle.do")
public class GetArticleServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int aid = Integer.parseInt(req.getParameter("aid"));
        Article article = ArticleDao.getArticleByAid(aid);

        req.getSession().setAttribute("article",article);
        resp.sendRedirect("info.jsp");
    }

}
