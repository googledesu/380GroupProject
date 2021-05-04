<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Product #${ticket.id}</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="ticketForm">                         
            <b>Add Comments</b><br />
            <input type="text" name="comments" /><br/><br/>
            <input type="submit" value="Save"/><br/><br/>           
        </form:form>
        <a href="<c:url value="/ticket" />">Return to list products</a>
    </body>
</html>