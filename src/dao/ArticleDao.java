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
                article.setLike(resultSet.getInt("like"));
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

}