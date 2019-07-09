package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionUtil {

    private static String username, password, url, driver;
    private static final String path = "local.properties";

    static {
        try {
            getParam(path);
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过配置文件读取一些配置的值
     *
     * @param path 配置文件的路径
     * @throws IOException
     */
    private static void getParam(String path) throws IOException {
        // 获取类装载器
        ClassLoader classLoader = ConnectionUtil.class.getClassLoader();
        // 通过类加载器来加载配置文件
        InputStream inputStream = classLoader.getResourceAsStream(path);
        // 配置文件是properties文件, 所以创建一个Properties对象
        Properties properties = new Properties();
        // 使用properties对象去读取配置文件的文件流
        properties.load(inputStream);

        // 通过指定的key来获取对应的value
        username = properties.getProperty("username");
        password = properties.getProperty("password");
        url = properties.getProperty("url");
        driver = properties.getProperty("driver");
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

}
