/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.dao.ProductDAO;

public class category extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductDAO productDAO = new ProductDAO(request.getServletContext());
        List<Product> allProd = productDAO.getAllList();
        if (id == null) {
            request.setAttribute("productsByCatagory", allProd);
        } else {
            try {
                List<Product> prod = new ArrayList<>();
                for (Product product : allProd) {
                    if (product.getTypeId() == Integer.parseInt(id)) {
                        prod.add(product);
                    }
                }
                request.setAttribute("productsByCatagory", prod);
            } catch (Exception e) {
            }
        }
        request.getRequestDispatcher("categories.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
