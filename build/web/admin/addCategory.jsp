<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
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
        input[type="text"], input[type="number"], textarea {
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
    </style>
</head>
<body>

    <%
        List<Category> categories = (List<Category>) request.getAttribute("listCategory");
    %>
    <h1>Categories</h1>
    <table>
        <thead>
            <tr>
                <th>Category Id</th>
                <th>Category Name</th>
                <th>Memo</th>
            </tr>
        </thead>
        <tbody>
            <% for (Category category : categories) { %>
                <tr>
                    <td><%= category.getTypeId() %></td>
                    <td><%= category.getCategoryName() %></td>
                    <td><%= category.getMemo() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    
    <h1>Add New Category</h1>
    <form action="admin_controller?action=addCategory" method="post">
        <label for="typeId">Category Id:</label>
        <input type="number" id="typeId" name="typeId" required>

        
        <label for="categoryName">Category Name:</label>
        <input type="text" id="categoryName" name="categoryName" required>

        <label for="memo">Memo:</label>
        <textarea id="memo" name="memo" rows="4"></textarea>

        <% if (request.getAttribute("message") != null) { %>
            <p style="color: red;"><%= request.getAttribute("message") %></p>
        <% } %>

        <button type="submit">Add Category</button>
    </form>
</body>
</html>
