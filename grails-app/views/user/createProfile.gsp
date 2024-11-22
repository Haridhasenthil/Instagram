<!DOCTYPE html>
<html>
<head>
    <title>CREATE PROFILE</title>
    <style>
    /* General Styles */
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
}

/* Create Profile Form Styles */
form {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  margin: 50px auto;
}

h1 {
  text-align: center;
  margin-bottom: 20px;
}

div {
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

input[type="int"],
input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
  box-sizing: border-box;
}

button[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
  width: 100%;
}

button[type="submit"]:hover {
  background-color: #45a049;
}

p {
  text-align: center;
  margin-top: 20px;
}

a {
  color: #4CAF50;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
    <form action="${createLink(controller: 'user', action: 'createProfile')}" method="post">
    <h1>CREATE PROFILE</h1>
         <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="bio">Bio:</label>
            <input type="text" id="bio" name="bio" required>
        </div>
        <div>
            <!--<button type="submit">signup</button>-->
            <button type="submit">SIGNUP</button>

        </div>
    </form>
    
</body>
</html>