<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="model.Category"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

* {
  scroll-behavior: smooth;
}

body, html {
  height: 100%;
  line-height: 1.8;
}

/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  background-image: url("/images/background.png");
  min-height: 100%;
}

.w3-bar .w3-button {
  padding: 16px;
}
</style>
</head>
<body>

<!-- include -->
<%@include file="header.jsp" %>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
    <span class="w3-jumbo w3-hide-small">Start something that matters</span><br>
    <span class="w3-xxlarge w3-hide-large w3-hide-medium">Start something that matters</span><br>
    <span class="w3-large">Stop wasting valuable time with projects that just isn't you.</span>
  </div> 
  <div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</header>

<!-- About Section -->
<!-- Body Section - Product Portfolio -->
<div class="w3-container" style="padding:128px 16px" id="portfolio">
  <h3 class="w3-center">Product Portfolio</h3>
  <p class="w3-center w3-large">Explore our range of products</p>

  <!-- Product Grid - Adjust the number of columns based on your design -->
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <!-- Add your product image here -->
        <img src="/images/product1.png" style="width:100%" alt="Product 1">
        <div class="w3-display-middle w3-display-hover">
          <button class="w3-button w3-black">View Details</button>
        </div>
      </div>
      <p>Product 1 Description</p>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <!-- Add your product image here -->
        <img src="/images/product2.png" style="width:100%" alt="Product 2">
        <div class="w3-display-middle w3-display-hover">
          <button class="w3-button w3-black">View Details</button>
        </div>
      </div>
      <p>Product 2 Description</p>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <!-- Add your product image here -->
        <img src="/images/product1.png" style="width:100%" alt="Product 3">
        <div class="w3-display-middle w3-display-hover">
          <button class="w3-button w3-black">View Details</button>
        </div>
      </div>
      <p>Product 3 Description</p>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <!-- Add your product image here -->
        <img src="/images/product4.png" style="width:100%" alt="Product 4">
        <div class="w3-display-middle w3-display-hover">
          <button class="w3-button w3-black">View Details</button>
        </div>
      </div>
      <p>Product 4 Description</p>
    </div>
      
    
    <!-- Add more product columns as needed -->
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
  <a href="#" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <a href="https://www.facebook.com/linvg19804"> <i class="fa fa-facebook-official w3-hover-opacity"></i> </a>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

</body>
</html>
