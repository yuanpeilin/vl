package dao;

import obj.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArticleDao {

    /**
     * 通过uid获取这个用户的所有文章
     *
     * @param uid
     * @return
     */
    public static ArrayList<Article> getArticlesByUid(int uid) {
        ArrayList<Article> list = new ArrayList<>();
        String sql = "SELECT * FROM article WHERE uid=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Article article = null;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, uid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                article = new Article();
                article.setAid(resultSet.getInt("aid"));
                article.setLikeCount(resultSet.getInt("likecount"));
                article.setUid(resultSet.getInt("uid"));
                article.setTitle(resultSet.getString("title"));
                article.setText(resultSet.getString("text"));
                article.setPic(resultSet.getString("pic"));
                article.setDate(resultSet.getString("date"));
                list.add(article);
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
        return list;
    }

    /**
     * 通过aid获取article实例
     *
     * @param aid
     * @return
     */
    public static Article getArticleByAid(int aid) {
        String sql = "SELECT * FROM article WHERE aid=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Article article = null;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, aid);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                article = new Article();
                article.setAid(resultSet.getInt("aid"));
                article.setLikeCount(resultSet.getInt("likecount"));
                article.setUid(resultSet.getInt("uid"));
                article.setTitle(resultSet.getString("title"));
                article.setText(resultSet.getString("text"));
                article.setPic(resultSet.getString("pic"));
                article.setDate(resultSet.getString("date"));
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
        return article;
    }

    /**
     * 通过aid增加点赞数量
     *
     * @param aid
     */
    public static void addLikeCountByAid(int aid) {
        String sql = "UPDATE article SET likecount=likecount+1 WHERE aid=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, aid);
            preparedStatement.executeUpdate();

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
