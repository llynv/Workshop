<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@ page import="model.Category" %>
<%@ page import="model.dao.CategoryDAO" %>
<%
  Account user = (Account) session.getAttribute("user");
%>

<head>
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
      .w3-bar .w3-button {
          padding: 16px;
      }

      body {
          margin-top: 59px;
      }
  </style>
</head>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="/" class="w3-bar-item w3-button w3-wide">LOGO</a>
    <!-- Right-sided navbar links -->
        
    <div class="w3-right w3-hide-small">
      <a href="/" class="w3-bar-item w3-button">Home</a>
      <% if (user != null && user.getRoleInSystem() == 1) { %>
        <a href="/admin" class="w3-bar-item w3-button">Dasboard</a>
      <% } %>
      <a href="/products" class="w3-bar-item w3-button">Products</a>
      <!-- Categories Dropdown -->
      <div class="w3-dropdown-hover">
        <a href="/category"  class="w3-button">Categories <i class="fa fa-caret-down"></i></a>
        <div class="w3-dropdown-content w3-bar-block w3-card-4">
          <% 
          List<Category> headerCategories = (new CategoryDAO(getServletContext())).getAllList();
          for (Category category : headerCategories) { 
          %>
            <a href="/category?name=<%= category.getTypeId() %>" class="w3-bar-item w3-button"><%= category.getCategoryName() %></a>
          <% } %>
        </div>
      </div>

      <% if (user == null) { %>
        <a href="/main_controller?action=login" class="w3-bar-item w3-button">Login</a>
      <% } else { %>
        <a href="/main_controller?action=profile" class="w3-bar-item w3-button" >
          <%
            out.print(user.getFirstName() + ' ' + user.getLastName());
          %>
        </a>
      <% } %>

    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>