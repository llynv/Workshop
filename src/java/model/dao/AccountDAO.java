package model.dao;

import utilities.DBContext;
import utilities.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import model.Account;

public class AccountDAO implements Accessible<Account> {
    private ServletContext sc;
    private Connection connection;

    public AccountDAO() {
        connection = DBContext.getInstance().getConnection();
    }

    public AccountDAO(ServletContext sc) {
        this.sc = sc;
        DBContext.getInstance().connectDB(sc);
        connection = DBContext.getInstance().getConnection();
    }

    public Connection getConnection(ServletContext sc) {
        return connection;
    }

    @Override
    public int insertRec(Account obj) {
        String sql = "INSERT INTO accounts VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getAccount());
            ps.setString(2, obj.getPass());
            ps.setString(3, obj.getLastName());
            ps.setString(4, obj.getFirstName());
            ps.setDate(5, obj.getBirthday());
            ps.setBoolean(6, obj.getGender());
            ps.setString(7, obj.getPhone());
            ps.setBoolean(8, obj.getIsUse());
            ps.setInt(9, obj.getRoleInSystem());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int updateRec(Account obj) {
        String sql = "UPDATE accounts SET pass = ?, lastName = ?, firstName = ?, birthday = ?, gender = ?, phone = ?, isUse = ?, roleInSystem = ? WHERE account = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getPass());
            ps.setString(2, obj.getLastName());
            ps.setString(3, obj.getFirstName());
            ps.setDate(4, obj.getBirthday());
            ps.setBoolean(5, obj.getGender());
            ps.setString(6, obj.getPhone());
            ps.setBoolean(7, obj.getIsUse());
            ps.setInt(8, obj.getRoleInSystem());
            ps.setString(9, obj.getAccount());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int deleteRec(Account obj) {
        String sql = "DELETE FROM accounts WHERE account = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getAccount());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public Account getObjectById(String id) {
        String sql = "SELECT * FROM accounts WHERE account = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getBoolean(6), rs.getString(7), rs.getBoolean(8), rs.getInt(9));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Account> getAllList() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM accounts";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getBoolean(6), rs.getString(7), rs.getBoolean(8), rs.getInt(9)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
