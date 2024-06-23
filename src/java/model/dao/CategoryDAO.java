package model.dao;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import model.Account;
import model.Category;
import utilities.DBContext;

public class CategoryDAO implements Accessible<Category> {

    private ServletContext sc;
    private Connection connection;

    public CategoryDAO() {
        connection = DBContext.getInstance().getConnection();
    }

    public CategoryDAO(ServletContext sc) {
        this.sc = sc;
        DBContext.getInstance().connectDB(sc);
        connection = DBContext.getInstance().getConnection();
    }

    public Connection getConnection(ServletContext sc) {
        if (connection == null) {
            this.sc = sc;
            DBContext.getInstance().connectDB(sc);
            connection = DBContext.getInstance().getConnection();
        }
        return connection;
    }

    @Override
    public int insertRec(Category obj) {
        String sql = "INSERT INTO categories VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, obj.getTypeId());
            ps.setString(2, obj.getCategoryName());
            ps.setString(3, obj.getMemo());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int updateRec(Category obj) {
        String sql = "UPDATE categories SET categoryName = ?, memo = ? WHERE typeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getCategoryName());
            ps.setString(2, obj.getMemo());
            ps.setInt(3, obj.getTypeId());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int deleteRec(Category obj) {
        String sql = "DELETE FROM categories WHERE typeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, obj.getTypeId());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public Category getObjectById(String id) {
        Category category = null;
        String sql = "SELECT * FROM categories WHERE typeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category(rs.getInt("typeId"), rs.getString("categoryName"), rs.getString("memo"));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    @Override
    public List<Category> getAllList() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add (new Category(rs.getInt("typeId"), rs.getString("categoryName"), rs.getString("memo")));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
