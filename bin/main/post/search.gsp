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
            padding: 5px;
        }
        .image {
            width: 200px; /* Set the desired width */
            height: 200px; /* Set the desired height */
            object-fit: cover; /* Maintain aspect ratio and cover container */
        }
    </style>
</head>
<body>
    <div class="image-container">
        <table>
        <g:if test="${flash.message}">
                <tr>
                    <td colspan="5">
                        <div class="alert alert-success">${flash.message}</div>
                    </td>
                </tr>
            </g:if>
            <g:elseif test="${!pro || pro.size() == 0}">
                <tr>
                    <td class="message" colspan="5">NO POST YET FOR THIS USER..........</td>
                </tr>
            </g:elseif>
            <g:else>
            <g:each in="${pro}" var="item" status="i">
                <g:if test="${i % 5 == 0}">
                    <tr>
                </g:if>
                <td class="img">
                    <img class="image" src="${createLink(controller: 'post', action: 'show', id: item[0])}" alt="Image"/>
                    <h2>${item[3]}</h2>
                    <g:link controller="comment" action="values" params="[user:params.user, post:item[0]]">Comment</g:link>
                </td>
                <g:if test="${i % 5 == 4 || i == pro.size() - 1}">
                    </tr>
                </g:if>
            </g:each>

            <g:if test="${pro.size() % 5 != 0}">
                <td colspan="${5 - (pro.size() % 5)}"></td></tr>
            </g:if>
            </g:else>
            
        </table>
    </div>
</body>
</html>
