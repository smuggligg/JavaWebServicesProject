<%-- 
    Document   : products
    Created on : 23-Nov-2019, 7:54:46 PM
    Author     : canes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <h1>Products</h1>
        <table>
            <tr>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th></th>
                <th></th>
            </tr>

            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <c:forEach var="item" items="${products}">
                <tr>
                    <td>${item.code}</td>
                    <td>${item.description}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href="productMaint?action=editProduct&amp;productCode=${item.code}">Edit</a>
                    </td>
                    <td>
                        <a href="productMaint?action=deleteProduct&amp;productCode=${item.code}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <form action="productMaint" method="post">
            <input type="hidden" name="action" value="addProduct">
            <input type="submit" value="Add Product">
        </form>
    </body>
</html>
