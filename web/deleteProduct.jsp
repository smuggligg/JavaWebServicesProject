<%-- 
    Document   : deleteProduct
    Created on : 25-Nov-2019, 9:35:06 PM
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
        <h1>Are you sure you want to delete this product?</h1>

        <label class="pad_top">Code:</label>
        <span>${product.code}</span><br>
        <label class="pad_top">Description:</label>
        <span>${product.description}</span><br>
        <label class="pad_top">Price:</label>
        <span>${product.price}</span><br>        
        <label>&nbsp;</label>
        <form action="productMaint?action=delete" method="post"> 
            <input type="hidden" name="productCode" value="${product.code}">
            <input type="submit" value="Yes">           
        </form>
        <form action="productMaint" method="post"><input type="hidden" name="action" value="displayProducts">
            <input type="submit" value="No">
        </form>
    </body>
</html>
