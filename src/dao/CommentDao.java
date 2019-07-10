package dao;

import obj.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class CommentDao {

    /**
     * 通过aid获取所有的评论
     *
     * @param aid
     */
    public static ArrayList<Comment> getCommentsByAid(int aid) {
        String sql = "SELECT * FROM comment WHERE aid=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Comment comment = null;
        ArrayList<Comment> commentList = new ArrayList<>();
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, aid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                comment = new Comment();
                comment.setCid(resultSet.getInt("cid"));
                comment.setAid(resultSet.getInt("aid"));
                comment.setName(resultSet.getString("name"));
                comment.setText(resultSet.getString("text"));
                comment.setDate(resultSet.getString("date"));
                commentList.add(comment);
            }

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
        return commentList;
    }

    /**
     * 添加一条评论
     */
    public static void addComment(Comment comment) {
        String sql = "INSERT INTO comment VALUES (DEFAULT, ?, ?, DEFAULT, ?)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, comment.getText());
            preparedStatement.setString(2, comment.getName());
            preparedStatement.setInt(3, comment.getAid());
            preparedStatement.execute();

            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
            }
        }
    }

}
