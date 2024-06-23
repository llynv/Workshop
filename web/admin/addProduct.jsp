<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.Account" %>
<%@ page import="model.dao.CategoryDAO" %>
<%@ page import="model.dao.AccountDAO" %>
<!DOCTYPE html>

<%
    CategoryDAO categoryDAO = new CategoryDAO();
    List<Category> categories = categoryDAO.getAllList();

    AccountDAO accountDAO = new AccountDAO();
    List<Account> accounts = accountDAO.getAllList();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 600px;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], input[type="date"], input[type="file"], textarea, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<%@ include file="../header.jsp" %>

<style>
    select {
        width: 100%;
        padding: 8px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
</style>

<body>

    <h1>Add New Product</h1>
    <form action="./admin_controller?action=addProduct" method="post" enctype="multipart/form-data">
        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="productId" required>

        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="productImage">Product Image:</label>
        <input type="file" id="productImage" name="productImage" accept="image/*" required>

        <label for="brief">Brief Description:</label>
        <textarea id="brief" name="brief" rows="4" required></textarea>

        <label for="postedDate">Posted Date:</label>
        <input type="date" id="postedDate" name="postedDate" required>

        <label for="category">Category:</label>
        <select id="category" name="category" required>
            <% for (Category category : categories) { %>
                <option value="<%= category %>"><%= category.getCategoryName() %></option>
            <% } %>
        </select>

        <label for="account">Account:</label>
        <select id="account" name="account" required>
            <% for (Account account : accounts) { %>
                <option value="<%= account.getAccount() %>"><%= account.getAccount() %></option>
            <% } %>
        </select>

        <label for="unit">Unit:</label>
        <input type="text" id="unit" name="unit" required>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="discount">Discount:</label>
        <input type="number" id="discount" name="discount" required>

        <% if (request.getAttribute("message") != null) { %>
            <p style="color: red;"><%= request.getAttribute("message") %></p>
        <% } %>

        <button type="submit">Add Product</button>
    </form>
</body>
</html>
