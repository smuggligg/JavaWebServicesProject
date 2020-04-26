<%-- 
    Document   : product
    Created on : 23-Nov-2019, 7:54:55 PM
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
        <h1>Edit Product</h1>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <form action="productMaint" method="post">

            <label class="pad_top">Code:</label>
            <input type="text" name="productCode" value="${product.code}"><br>
            <label class="pad_top">Description:</label>
            <input type="text" name="productDescription" value="${product.description}"><br>
            <label class="pad_top">Price:</label>
            <input type="text" name="productPrice" value="${product.price}"><br>        
            <label>&nbsp;</label>
            <input type="hidden" name="action" value="edit">
            <input type="submit" value="Edit Product">

        </form>
        <br/>
        <form action="productMaint" method="post"><input type="hidden" name="action" value="displayProducts">
            <input type="submit" value="View Products"></form>

    </body>
</html>
