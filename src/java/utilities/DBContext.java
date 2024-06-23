package utilities;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

import model.Account;

public class DBContext {
    private Connection connection;
    private String hostName, instanceName, port, dbName, user, pass;

    private static DBContext objInstance;

    private DBContext() {
    }

    public static DBContext getInstance() {
        if (objInstance == null) {
            objInstance = new DBContext();
        }
        return objInstance;
    }

    private String getURL() {
        return "jdbc:sqlserver://" + hostName + "\\" + instanceName + ":" + port + ";databaseName=" + dbName + ";user=" + user + ";password=" + pass;
    }

    public void connectDB() {
        try {
            hostName = "localhost";
            instanceName = "LINHLAPTOP";
            port = "1433";
            dbName = "ProductIntro";
            user = "sa";
            pass = "1";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(getURL());
        } catch (Exception e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void connectDB (ServletContext sc) {
        try {
            hostName = sc.getInitParameter("hostName");
            instanceName = sc.getInitParameter("instanceName");
            port = sc.getInitParameter("port");
            dbName = sc.getInitParameter("dbName");
            user = sc.getInitParameter("user");
            pass = sc.getInitParameter("pass");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(getURL());
        } catch (Exception e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connectDB();
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return connection;
    }
}
