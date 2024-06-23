<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@ page import="model.dao.AccountDAO" %>
<%
    AccountDAO accountDAO = new AccountDAO(getServletContext());
    List<Account> accounts = accountDAO.getAllList();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Accounts</title>
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
        .changeState-button {
            background-color: #FFA500;
            color: white;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>

<%@ include file="../header.jsp" %>

<body>
    <h1>Manage Accounts</h1>
    <table>
        <thead>
            <tr>
                <th>Account</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Role</th>
                <th>State</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Account account : accounts) { %>
                <% if (account.getAccount().equals(((Account) session.getAttribute("user")).getAccount())) continue; %>
                <tr>
                    <td><%= account.getAccount() %></td>
                    <td><%= account.getFirstName() %></td>
                    <td><%= account.getLastName() %></td>
                    <td><%= account.getPhone() %></td>
                    <td><%= account.getBirthday() %></td>
                    <td><%= account.getGender() %></td>
                    <td><%= account.getRoleInSystem() %></td>
                    <td><%= (account.getIsUse() == true) ? "Active" : "Inactive" %></td>
                    <td class="action-buttons">
                        <a href="./admin_controller?action=updateAccount&account=<%=account.getAccount()%>" style="display: inline; text-decoration: none;">
                            <button type="submit" class="update-button">Update</button>
                        </a>
                        <a href="./admin_controller?action=deactivateAccount&account=<%=account.getAccount()%>" style="display:inline; text-decoration: none">
                            <button type="submit" class="changeState-button"><%= (account.getIsUse() != true) ? "Active" : "Deactivate" %></button>
                        </a>
                        <a href="./admin_controller?action=deleteAccount&account=<%=account.getAccount()%>" style="display:inline; text-decoration: none">
                            <button type="submit" class="delete-button">Delete</button>
                        </a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
