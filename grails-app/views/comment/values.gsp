<html>
<head>
<title>Comment</title>
<style>
body {
    font-family: Arial, sans-serif;
    text-align: center;
}

h2 {
    color: #333;
}
  p {
        color: blue;
        font-size: 16px;
        line-height: 1.5;
    }
form {
    width: 50%;
    margin: 40px auto;
    background-color: #f0f0f0;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"] {
    width: 100%;
    height: 30px;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
}

input[type="submit"], button {
    width: 100%;
    height: 30px;
    background-color: #4CAF50;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover, button:hover {
    background-color: #3e8e41;
}

.alert-success {
    color: green;
    font-size: 16px;
    text-align: center;
    margin-top: 20px;
}

.comments-section {
    display: none; /* Hidden by default */
}
</style>
 <script>
            function validateComment() {
                var comment = document.getElementById('comment').value.trim();
                if (comment === "") {
                    alert("Please enter the comment");
                    return false; // Prevent form submission
                }
                return true; // Allow form submission
            }
     </script>
</head>
<body>
    <div>
        <g:form controller="comment" action="usercomment" params="[user:params.user, post:params.post]" method="post" onsubmit="return validateComment();">
            <label for="comment">COMMENT</label>
            <input type="text" id="comment" name="comment"><br><br>
            <input type="submit" value="POST">
        </g:form>
        <g:form>
        <g:if test="${pro}">
         <g:each in="${pro}" var="item">
            <p>User:${item[0]}</p> <h3>Comment : ${item[1]} </h3>  
         </g:each>
         </g:if>
         <g:else>
             <p>No comments yet; please share your thoughts first.</p>
        </g:else>
        </g:form>
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                ${flash.message}
            </div>
        </g:if>
        </div>
    </div>
</body>
</html>
