/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Product;
import model.dao.AccountDAO;
import model.dao.ProductDAO;

/**
 *
 * @author asus
 */
@WebServlet(name="adminController", urlPatterns={"/admin/admin_controller"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        if (user == null || user.getRoleInSystem() != 1) {
            response.sendRedirect("/error");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
            return;
        }
        AccountDAO accountDAO = new AccountDAO(request.getServletContext());

        switch (action) {
            case "addAccount":
                request.getRequestDispatcher("/admin/addAccount.jsp").forward(request, response);
                break;
            case "updateAccount":
                String account = request.getParameter("account");
                request.setAttribute("account", account);
                request.getRequestDispatcher("/admin/updateAccount.jsp").forward(request, response);
                break;
            case "addProduct":
                request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
                break;
            case "deteleAccount":
                break;
            case "deactivateAccount":
                String accountDeactivate = request.getParameter("account");
                Account accountDeactivateObj = accountDAO.getObjectById(accountDeactivate);
                accountDeactivateObj.setIsUse(!accountDeactivateObj.getIsUse());
                accountDAO.updateRec(accountDeactivateObj);
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/admin/manage_account"));
                break;
            case "listProduct":
                ProductDAO productDAO = new ProductDAO(request.getServletContext());
                request.setAttribute("listProduct", productDAO.getAllList());
                request.getRequestDispatcher("/admin/listProduct.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
                break;
        }
    } 

    private void updateProfile (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        AccountDAO accountDAO = new AccountDAO(request.getServletContext());
        String username = request.getParameter("account");
        Account user = accountDAO.getObjectById(username);
        String password = request.getParameter("pass");
        Date dob = Date.valueOf(request.getParameter("birthday"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        boolean gender = user.getGender();
        try {
            gender = Boolean.parseBoolean(request.getParameter("gender"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        int role = user.getRoleInSystem();
        try {
            role = Integer.parseInt(request.getParameter("roleInSystem"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String phone = request.getParameter("phone");
        boolean isUse = user.getIsUse();

        Account update = new Account(user.getAccount(), password, lastName, firstName, dob, gender, phone, isUse, role);
        accountDAO.updateRec(update);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
            return;
        }

        switch (action) {
            case "addAccount":
                String username = request.getParameter("accountName");
                String password = request.getParameter("password");
                Date dob = Date.valueOf(request.getParameter("birthday"));
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                int role = Integer.parseInt(request.getParameter("role"));
                String phone = request.getParameter("phone");
                boolean isUse = Boolean.parseBoolean(request.getParameter("state"));
                AccountDAO accountDAO = new AccountDAO(request.getServletContext());
                Account newAccount = new Account(username, password, lastName, firstName, dob, gender, phone, isUse, role);
                String accMessage = "";
                if (accountDAO.insertRec(newAccount) == 1) {
                    accMessage = "Add account success!";
                } else {
                    accMessage = "Add account failed!";
                }
                request.setAttribute("message", accMessage);
                request.getRequestDispatcher("/admin/addAccount.jsp").forward(request, response);
                break;
            case "updateAccount":
                updateProfile(request, response);
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/admin/manage_account"));
                break;
            case "addProduct":
                String productId = request.getParameter("productId");
                String productName = request.getParameter("productName");
                String productImage = request.getParameter("productImage"); 
                String brief = request.getParameter("brief");
                Date postedDate = Date.valueOf(request.getParameter("postedDate"));
                int typeId = Integer.parseInt(request.getParameter("typeId"));
                String account = request.getParameter("account");
                String unit = request.getParameter("unit");
                int price = Integer.parseInt(request.getParameter("price"));
                int discount = Integer.parseInt(request.getParameter("discount"));

                ProductDAO productDAO = new ProductDAO(request.getServletContext());
                productDAO.insertRec(new Product(productId, productName, productImage, brief, postedDate, typeId, account, unit, price, discount));
                break;
            case "deteleAccount":
                break;
            default:
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
                break;
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
