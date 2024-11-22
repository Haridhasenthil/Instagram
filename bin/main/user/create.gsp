<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>USER PROFILE</title>
    <style>
        .split {
            height: 100%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
        }
        .top-left {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .left {
            left: 0;
            width: 20%;
            background-color: #F0F8FF;
        }
        .right {
            right: 0;
            width: 80%;
        }
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        input[type="checkbox"]::before {
            content: "\2665";
        }
        .image-container {
            width: 100%;
            display: table;
            table-layout: fixed;
        }
        .img {
            text-align: center;
            padding: 10px;
        }
        .image {
            width: 100%;
            height: 290px;
        }
        .centered img {
            width: 150px;
            border-radius: 50%;
        }
    </style>
    <style>
/* The Modal (background) */
   .modal {
            display: none;
            position: fixed;
            z-index: 2; /* Ensure the modal is above other content */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4); /* Semi-transparent background */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 50px;
            border: 1px solid #888;
            width: 100%;
            max-width: 600px; /* Limit the maximum width of the modal */
            position: relative; /* Ensure it respects parent positioning */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }
        .but {
          background-color: #04AA6D; /* Green */
          border: none;
          color: purple;
          padding: 4px 5px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    .search-icon {
      color: #333; /* Icon color */
      font-size: 24px; /* Adjust size as needed */
    }
  </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Function to open the modal with userDetails
    function openModal(userDetails) {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";

        $.ajax({
            url: "${createLink(controller: 'post', action: 'create')}", // Adjust this URL as needed
            type: 'GET',
            data: { user: userDetails },
            success: function(response) {
                $('#CREATEPOST').html(response); // Update the content inside #CREATEPOST
            },
            error: function(xhr, status, error) {
                console.error('Error fetching posts:', error);
            }
        });
    }

    // Function to close the modal
    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }

    // Function to perform search based on username
    function searchByUsername(username) {
        var modal = document.getElementById("myModal");

        $.ajax({
            url: "${createLink(controller: 'post', action: 'search')}", // Adjust this URL as needed
            type: 'GET',
            data: { username: username },
            success: function(response) {
                $('#CREATEPOST').html(response); // Update the content inside #CREATEPOST
                modal.style.display = "block"; // Display the modal after content is loaded
            },
            error: function(xhr, status, error) {
                console.error('Error fetching posts:', error);
            }
        });
    }

    // Function to handle click outside modal and close it
    window.onclick = function(event) {
        var modal = document.getElementById("myModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
</script>
</head>
<body>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
    <div id="CREATEPOST"></div>
    </div>
</div>
<g:form>
    <div class="split left">
        <strong>Username:</strong>${userDetailsIns[0]}<br/><br/>
        <strong>Name:</strong>${userDetailsIns[1]}<br/><br/>
        <strong>Bio:</strong>${userDetailsIns[2]}<br/><br/>
        <div class="but" onclick="openModal('${userDetailsIns[0]}')">CREATEPOST</div>
        <%-- <button><g:link action="create" controller="post" params="[user:userDetailsIns[0]]">CREATE POST</g:link></button> --%>
        <button class="but"><g:link controller="post" action="mypost" id="${userDetailsIns[0]}">MY POST</g:link></button>
    </div>
</g:form>

<div class="split right">
   <div class="search-container">
    Username: 
    <input type="text" id="username">
    <button onclick="searchByUsername(document.getElementById('username').value)">
        <i class="fas fa-search search-icon"></i> SEARCH
    </button>
</div>
    <div class="top-left">
        <g:link controller="user" action="login"><button>LOGOUT</button></g:link>
        <g:link controller="user" action="delete" params="[username:userDetailsIns[0]]"><button>DELETE MY ACCOUNT</button></g:link>
    </div>
    <center><h1>POST</h1></center>
    <div class="image-container">
        <table>
            <g:each in="${post}" var="item" status="i">
                <g:if test="${i % 3 == 0}">
                    <tr>
                </g:if>
                <td class="img">
                    <img class="image" src="${createLink(controller: 'post', action: 'show', id: item.id)}" alt="Image"/>
                    <h2>${item.caption}
                        <g:link controller="comment" action="values" params="[user:userDetailsIns[0], post:item.id]">comment</g:link>
                        <g:form controller="likes" action="toggleLike">
                            <input type="hidden" name="username" value="${userDetailsIns[0]}">
                           <input type="hidden" name="postId" value="${item.id}">
                           <input type="checkbox" name="likeCheckbox" onchange="this.form.submit()">
                        </g:form>

                    </h2>
                </td>
                <g:if test="${i % 3 == 2}">
                    </tr>
                </g:if>
            </g:each>
            <g:if test="${post.size() % 3 != 0}">
                <g:if test="${post.size() % 3 == 1}">
                    <td></td><td></td></tr>
                </g:if>
                <g:if test="${post.size() % 3 == 2}">
                    <td></td></tr>
                </g:if>
            </g:if>
        </table>
        <g:if test="${flash.message}">
                <div class="alert-success">
                  ${flash.message}
                </div>
        </g:if>
    </div>
</div>
</body>
</html>
