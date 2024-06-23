<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: "Raleway", sans-serif
        }

        body,
        html {
            height: 100%;
            line-height: 1.8;
        }

        .bgimg-1 {
            background-position: center;
            background-size: cover;
            background-image: url("/w3images/mac.jpg");
            min-height: 100%;
        }

        .w3-bar .w3-button {
            padding: 16px;
        }

        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 48px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus,
        input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        button:hover {
            opacity: 1;
        }
    </style>
</head>

<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
      <a href="/" class="w3-bar-item w3-button w3-wide">LOGO</a>
      <!-- Right-sided navbar links -->
    </div>
  </div>
</div>

<body>

    <header class="bgimg-1 w3-display-container w3-grayscale-min">
        <div class="w3-display-middle">
            <div class="login-container w3-card-4">
                <h2 class="w3-center">Login</h2>
                <form action="/main_controller?action=login" method="post">
                    <label for="username"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="username" required>

                    <label for="password"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="password" required>

                    <% String errorMessage=(String) request.getAttribute("errorMessage"); if (errorMessage !=null) { %>
                        <div class="error-message">
                            <%= errorMessage %>
                        </div>
                        <% } %>

                    <button type="submit">Login</button>
                    <p class="w3-center">Don't have an account? <a href="/main_controller?action=register">Register here</a>.</p>
                </form>
            </div>
        </div>
    </header>

</body>

</html>