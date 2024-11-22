<!DOCTYPE html>
<html>
<head>

    <title>Login Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #fafafa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .logo {
           align-items: center;
           justify-content: center;
           width: 100px;
           margin: 10px auto;
           display: flex;
        }
        /* Container */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
          .alert-success {
        color: white;
           background-color: red; /* Background color */
        padding: 10px;
        border-radius: 5px;
    }
        /* Login Form Styles */
        form {
            background-color: white;
            padding: 40px 30px;
            border: 1px solid #e6e6e6;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            margin-bottom: 10px;
        }

        h1 {
            font-family: 'Billabong', sans-serif;
            font-size: 3em;
            text-align: center;
            margin-bottom: 20px;
            color: #262626;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: none; /* Hides labels to match Instagram style */
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
            background-color: #fafafa;
        }

        button[type="submit"],
        button[type="button"] {
            background-color: #0095f6;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
        }

        button[type="submit"]:hover,
        button[type="button"]:hover {
            background-color: #007bb5;
        }

        p {
            text-align: center;
            margin-top: 10px;
            color: #8e8e8e;
        }

        a {
            color: #0095f6;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Sign Up Form Styles */
        .signup {
            background-color: white;
            padding: 20px 30px;
            border: 1px solid #e6e6e6;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        .signup button {
            background: none;
            border: none;
            color: #0095f6;
            font-weight: bold;
            cursor: pointer;
        }

        .signup button:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <div class="container">
        <form action="${createLink(controller:'user',action:'login')}" method="post">
         <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram Logo" class="logo">
            <h1>INSTAGRAM</h1>
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Username" autocomplete="username" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Password" autocomplete="$0" required>
            </div>
            <%-- <div>
                <input type="hidden" name="deleted" value="false">
            </div> --%>
             <g:if test="${flash.message}">
                <div class="alert-success">
                  ${flash.message}
                </div>
            </g:if>

            <div>
                <button type="submit">LOGIN</button>
            </div>
        </form>
        <div class="signup">
            <p>Don't have an account? <button type="button" onclick="window.location.href='${createLink(controller:'User', action:'login1')}'">SIGNUP</button></p>
        </div>
    </div>
</body>
</html>
