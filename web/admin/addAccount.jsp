<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Account</title>
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
        input[type="text"], input[type="tel"], input[type="date"], input[type="password"], select {
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
    <h1>Add New Account</h1>
    <form action="./admin_controller?action=addAccount" method="post">
        <label for="accountName">Account Name:</label>
        <input type="text" id="accountName" name="accountName" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value=1>Male</option>
            <option value=0>Female</option>
        </select>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value=3>User</option>
            <option value=2>Staff</option>
            <option value=1>Admin</option>
        </select>

        <label for="state">State:</label>
        <select id="state" name="state" required>
            <option value=1>Active</option>
            <option value=0>Inactive</option>
        </select>

        <!-- message -->
        <% if (request.getAttribute("message") != null) { %>
            <p style="color: red;"><%= request.getAttribute("message") %></p>
        <% } %>
        
        <button type="submit">Add Account</button>
    </form>
</body>
</html>
