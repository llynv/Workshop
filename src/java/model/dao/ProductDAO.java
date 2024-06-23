package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import model.Account;
import model.Category;
import model.Product;
import utilities.DBContext;

public class ProductDAO implements Accessible<Product> {

    private ServletContext sc;
    private Connection connection;

    public ProductDAO() {
        connection = DBContext.getInstance().getConnection();
    }

    public ProductDAO(ServletContext sc) {
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
    public int insertRec(Product obj) {
        String sql = "INSERT INTO products VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getProductId());
            ps.setString(2, obj.getProductName());
            ps.setString(3, obj.getProductImage());
            ps.setString(4, obj.getBrief());
            ps.setDate(5, obj.getPostedDate());
            ps.setInt(6, obj.getTypeId());
            ps.setString(7, obj.getAccount());
            ps.setString(8, obj.getUnit());
            ps.setInt(9, obj.getPrice());
            ps.setInt(10, obj.getDiscount());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int updateRec(Product obj) {
        String sql = "UPDATE products SET productName = ?, productImage = ?, brief = ?, postedDate = ?, typeId = ?, account = ?, unit = ?, price = ?, discount = ? WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getProductName());
            ps.setString(2, obj.getProductImage());
            ps.setString(3, obj.getBrief());
            ps.setDate(4, obj.getPostedDate());
            ps.setInt(5, obj.getTypeId());
            ps.setString(6, obj.getAccount());
            ps.setString(7, obj.getUnit());
            ps.setInt(8, obj.getPrice());
            ps.setInt(9, obj.getDiscount());
            ps.setString(10, obj.getProductId());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public int deleteRec(Product obj) {
        String sql = "DELETE FROM products WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getProductId());
            return ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    @Override
    public Product getObjectById(String id) {
        String sql = "SELECT * FROM products WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Product> getAllList() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
