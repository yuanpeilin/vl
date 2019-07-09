package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
String sql = "";
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
try {
    connection = ConnectionUtil.getConnection();
    preparedStatement = connection.prepareStatement(sql);
    resultSet = preparedStatement.executeQuery();


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
*/

public class UserDao {

    /**
     * 通过username获得password
     *
     * @param username
     * @return
     */
    public static String getPasswordByUsername(String username) {
        String sql = "SELECT password FROM user WHERE username=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String password = null;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                password = resultSet.getString("password");
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
        return password;
    }

    /**
     * 通过username获得uid
     *
     * @param username
     * @return
     */
    public static int getUidByUsername(String username) {
        String sql = "SELECT uid FROM user WHERE username=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int uid = 0;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                uid = resultSet.getInt("uid");
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
        return uid;
    }

    /**
     * 向数据库中插入username和password
     *
     * @param username
     * @param password
     * @return
     */
    public static boolean addUser(String username, String password) {
        String sql = "INSERT INTO user VALUES (DEFAULT,?,?,NULL)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            connection = ConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            flag = preparedStatement.execute();

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
        return flag;
    }

}
