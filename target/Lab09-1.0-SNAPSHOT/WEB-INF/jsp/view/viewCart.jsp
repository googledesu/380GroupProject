<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Cart</title>
    </head>
    <body>
        <a href="<c:url value="/shop?action=emptyCart" />">Empty Cart</a>
        <h1>View Cart</h1>
        <a href="<c:url value="/ticket/list" />">Product List</a><br /><br />
        <%

            @SuppressWarnings("unchecked")
            Map<String, String> carts =
                   (Map<String, String>) session.getAttribute("cart");

            if (carts == null || carts.size() == 0) { %>
                Your cart is empty
        <%  } else { %>
            <ul>
            <% for (String id: carts.keySet()) { %>
                <li>  <%=carts.get(id) %></li>
            <% } %>
            </ul>
        <% } %>
    </body>
</html>
