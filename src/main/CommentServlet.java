package main;

import dao.CommentDao;
import obj.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/comment.do")
public class CommentServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Comment comment = new Comment();
        comment.setName(req.getParameter("username"));
        comment.setText(req.getParameter("text"));
        comment.setAid(Integer.parseInt(req.getParameter("aid")));
        CommentDao.addComment(comment);

        System.out.println("name: " + req.getParameter("username"));
        System.out.println("text: " + req.getParameter("text"));
        System.out.println("aid: " + req.getParameter("aid"));
    }

}