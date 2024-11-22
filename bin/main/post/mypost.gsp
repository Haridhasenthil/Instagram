<!DOCTYPE html>
<html>
<head>
    <title>Image Gallery</title>
    <style>
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
              width: 200px; /* Set the desired width */
            height: 200px; /* Set the desired height */
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="image-container">
        <table>
            <g:if test="${!pro || pro.size() == 0}">
                <tr>
                    <td class="message" colspan="2">No post yet........</td>
                </tr>
            </g:if>

            <g:each in="${pro}" var="item" status="i">
                <g:if test="${i % 5 == 0}">
                    <tr>
                </g:if>
                <td class="img">
                    <img class="image" src="${createLink(controller: 'post', action: 'show', id: item[0])}" alt="Image"/>
                    <h2>${item[3]}</h2> <g:link controller="comment" action="values" params="[user:params.user, post:item[0]]">comment</g:link>
                </td>
            </g:each>
            <g:if test="${pro.size() % 5 == 1}">
                <td></td></tr>
            </g:if>
         <g:if test="${flash.message}">
            <div class="alert alert-success">
                ${flash.message}
            </div>
        </g:if>
        </table>
    </div>
</body>
</html>
