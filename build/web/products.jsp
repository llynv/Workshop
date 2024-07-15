<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.dao.ProductDAO" %>
<%
    ProductDAO productDAO = new ProductDAO(getServletContext());
    List<Product> products = productDAO.getAllList();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            max-width: 100px;
            height: auto;
        }
        .action-buttons button {
            margin-right: 5px;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .update-button {
            background-color: #4CAF50;
            color: white;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Brief</th>
                <th>Posted Date</th>
                <th>Type ID</th>
                <th>Account</th>
                <th>Unit</th>
                <th>Price</th>
                <th>Discount</th>
            </tr>
        </thead>
        <tbody>
            <% for (Product product : products) { %>
                <tr>
                    <td><%= product.getProductId() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><img src="<%= product.getProductImage() %>" alt="Product Image"></td>
                    <td><%= product.getBrief() %></td>
                    <td><%= product.getPostedDate() %></td>
                    <td><%= product.getTypeId() %></td>
                    <td><%= product.getAccount() %></td>
                    <td><%= product.getUnit() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getDiscount() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
