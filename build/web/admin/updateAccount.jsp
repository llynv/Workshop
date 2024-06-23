<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="model.dao.AccountDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String username = request.getParameter("account");
    if (username == null) {
        response.sendRedirect("/admin/manage_account");
        return;
    }
    AccountDAO accountDAO = new AccountDAO();
    Account user = accountDAO.getObjectById(username);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    int roleInSystem = user.getRoleInSystem();
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        .w3-container {padding: 64px;}
    </style>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="/" class="w3-bar-item w3-button w3-wide">LOGO</a>
        <div class="w3-right w3-hide-small">
            <a href="/logout" class="w3-bar-item w3-button">Logout</a>
        </div>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a> 
    </div>
</div>

<!-- Profile Section -->
<div class="w3-container">
    <h3 class="w3-center">User Profile</h3>
    <p class="w3-center w3-large">View and update your profile information</p>
    <form class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin" action="/admin/admin_controller?action=updateAccount" method="post">
        <!-- add all account infor to change -->
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" name="firstName" type="text" placeholder="First Name" value="<%= user.getFirstName() %>" required>
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" name="lastName" type="text" placeholder="Last Name" value="<%= user.getLastName() %>" required>
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-calendar"></i></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" name="birthday" type="date" placeholder="Birthday" value="<%= sdf.format(user.getBirthday()) %>" required>
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" name="phone" type="text" placeholder="Phone" value="<%= user.getPhone() %>" required>
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-venus-mars"></i></div>
            <div class="w3-rest">
                <select class="w3-select w3-border" name="gender">
                    <option value="" disabled selected>Gender</option>
                    <option value="true" <%= user.getGender() ? "selected" : "" %>>Male</option>
                    <option value="false" <%= !user.getGender() ? "selected" : "" %>>Female</option>
                </select>
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-key"></i></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" name="pass" type="password" placeholder="Password" value="<%= user.getPass() %>">
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
            <div class="w3-rest">
                <select class="w3-select w3-border" name="roleInSystem">
                    <option value="" disabled selected>Role</option>
                    <option value="1" <%= user.getRoleInSystem() == 1 ? "selected" : "" %>>Admin</option>
                    <option value="2" <%= user.getRoleInSystem() == 2 ? "selected" : "" %>>Manager</option>
                    <option value="3" <%= user.getRoleInSystem() > 2 ? "selected" : "" %>>User</option>
                </select>
            </div>
        </div>
        <input type="hidden" name="account" value="<%= user.getAccount() %>">
        <div class="w3-row w3-section">
            <button type="submit" class="w3-button w3-block w3-teal">Update Profile</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="/" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>Home</a>
    <div class="w3-xlarge w3-section">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
</footer>

</body>
</html>
