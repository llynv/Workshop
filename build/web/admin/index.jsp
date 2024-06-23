<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

        body, html {
            height: 100%;
            line-height: 1.8;
        }

        .admin-menu {
            margin: 20px 0;
            padding: 0;
        }

        .admin-menu li {
            list-style: none;
            margin: 10px 0;
        }

        .admin-menu a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .admin-menu a:hover {
            text-decoration: underline;
        }

        .w3-bar .w3-button {
            padding: 16px;
        }
    </style>
</head>

<%@ include file="../header.jsp" %>

<body>
    <h1>Welcome to the Admin Dashboard</h1>
    <ul class="admin-menu">
        <li><a href="./manage_account">Manage Account</a></li>
        <li><a href="./admin_controller?action=addProduct">Add Product</a></li>
        <li><a href="./admin_controller?action=addAccount">Add Account</a></li>
        <li><a href="./admin_controller?action=accCategory">Add Category</a></li>
    </ul>
</body>

</html>