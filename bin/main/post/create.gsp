<html>
<head>
<title>create a post</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<style>
    /* General Styles */
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
}

/* Create Post Form Styles */
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

h2 {
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

input[type="file"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
  box-sizing: border-box;
}

input[type="text"] {
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

.alert {
  padding: 15px;
  background-color: #f2dede;
  border: 1px solid #ff9999;
  border-radius: 5px;
  width: 300px;
  margin: 20px auto;
  text-align: center;
}

.alert-danger {
  background-color: #f2dede;
  border: 1px solid #ff9999;
  border-radius: 5px;
  width: 300px;
  margin: 20px auto;
  text-align: center;
  color: #ff0000;
}

</style>   
</head>
<body>
<h1>CREATE POST</h1>
    <g:form controller="post" action="upload" method="post" params="[user:params.user]"enctype="multipart/form-data">
        <div>
        <%-- <h2>${params.user}</h2> --%>
            <label for="photo">Choose an image:</label>
            <input type="file" id="photo"name="photo"></br></br>
            <label for="caption">caption</label>
            <input type="text" id="caption" name="caption" required></br></br>
        <button type="submit">UPLOAD</button>
        </div>
        </g:form>
</body>
</html>