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
        <h2>Items</h2>
        <security:authorize access="hasRole('ADMIN')">    
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
        </security:authorize>
        <a href="<c:url value="/ticket/create" />">Create an items</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(ticketDatabase) == 0}">
                <i>There are no Items in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ticketDatabase}" var="ticket">
                    Items ${ticket.id}:
                    <a href="<c:url value="/ticket/view/${ticket.id}" />">
                        <c:out value="${ticket.subject}" /></a>
                    (Shopkeepers: <c:out value="${ticket.customerName}" />)
                    
                    <%-- Add to Shopping cart --%>
                    <a href="<c:url value="/ticket/addtoCart/${ticket.id}" />">
                        <c:out value="Add to cart" /></a>

                    <security:authorize access="hasRole('ADMIN') or
                                        principal.username=='${ticket.customerName}'">
                        [<a href="<c:url value="/ticket/edit/${ticket.id}" />">Edit</a>]
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN')">            
                        [<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach> 
            </c:otherwise>
        </c:choose>
        <%-- Shopping cart --%>        
        <a href="<c:url value="/shop?action=viewCart" />">Shopping cart</a><br /><br />  
    </body>
</html>
