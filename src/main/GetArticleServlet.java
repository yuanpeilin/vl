package main;

import dao.ArticleDao;
import dao.CommentDao;
import obj.Article;
import obj.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/getArticle.do")
public class GetArticleServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int aid = Integer.parseInt(req.getParameter("aid"));

        Article article = ArticleDao.getArticleByAid(aid);
        req.getSession().setAttribute("article", article);

        ArrayList<Comment> commentList = CommentDao.getCommentsByAid(aid);
        req.getSession().setAttribute("commentList", commentList);

        resp.sendRedirect("info.jsp");
    }

}
