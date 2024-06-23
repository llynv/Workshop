<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import -->
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Account" %>
<!-- end import -->
<!DOCTYPE html>
<html>
<head>
    <title>Account List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Account</th>
            <th>Password</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Phone</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Is Use</th>
            <th>Role In System</th>
        </tr>
        <%
            ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("acc");
            for (Account account : accounts) {
        %>
        <tr>
            <td><%= account.getAccount() %></td>
            <td><%= account.getPass() %></td>
            <td><%= account.getLastName() %></td>
            <td><%= account.getFirstName() %></td>
            <td><%= account.getPhone() %></td>
            <td><%= account.getBirthday() %></td>
            <td><%= account.getGender() ? "Male" : "Female" %></td>
            <td><%= account.getIsUse() ? "Yes" : "No" %></td>
            <td><%= account.getRoleInSystem() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
