<%-- 
    Document   : addProduct
    Created on : 24-Nov-2019, 12:44:55 AM
    Author     : canes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <title>Product Maintenance</title>
    </head>
    <body>
        <h1>Add Product</h1>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
        <form action="productMaint" method="post">
            <input type="hidden" name="action" value="add">
            <label class="pad_top">Code:</label>
            <input type="text" name="productCode"><br>
            <label class="pad_top">Description:</label>
            <input type="text" name="productDescription"><br>
            <label class="pad_top">Price:</label>
            <input type="text" name="productPrice"><br>        
            <label>&nbsp;</label>
            <input type="submit" value="Add Product">
        </form>
        <br/>
        <form action="productMaint" method="post"><input type="hidden" name="action" value="displayProducts">
            <input type="submit" value="View Products"></form>
        <c:if test="${message != null}">
            <p><i>${message}</i></p>
        </c:if>
    </body>
</html>
