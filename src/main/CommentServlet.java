package main;

import dao.CommentDao;
import obj.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/comment.do")
public class CommentServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        Comment comment = new Comment();
        comment.setName(req.getParameter("username"));
        comment.setText(req.getParameter("text"));
        comment.setAid(Integer.parseInt(req.getParameter("aid")));
        CommentDao.addComment(comment);
        System.out.println("name: " + req.getParameter("username") + " text: " + req.getParameter("text") + " aid: " + req.getParameter("aid"));


        ArrayList<Comment> commentList = CommentDao.getCommentsByAid(comment.getAid());
        req.getSession().setAttribute("commentList", commentList);
        resp.sendRedirect("info.jsp");
    }

}
