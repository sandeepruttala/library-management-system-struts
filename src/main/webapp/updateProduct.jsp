<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            text-align: center;
            padding: 20px 0;
            background-color: #3498db;
            color: #fff;
            margin: 0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
            overflow: hidden;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], .form-group input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .form-group input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h1>List of Products</h1>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>category</th>
    </tr>

    <%

        Session session1 = FactoryProvider.getFactory().openSession();

        try {
            session1.beginTransaction();
            List<Product> products = session1.createQuery("from Product").getResultList();

            for (Product i : products) {
    %>
    <tr>
        <td><%= i.getId() %></td>
        <td><%= i.getName() %></td>
        <td><%= i.getDescription() %></td>
        <td><%= i.getPrice() %></td>
        <td><%= i.getQuantity() %></td>
        <td><%= i.getCategory() %></td>
    </tr>
    <%
            }
            session1.getTransaction().commit();
        } finally {
            if (session1 != null && session1.isOpen()) {
                session1.close();
            }
        }
    %>
</table>

<div class="container">
    <a href="index.jsp" class="btn">Home</a>
</div>
<h1>Update Product</h1>

<form action="UpdateProductAction" method="post">
    <div class="form-group">
        <label for="id">Product ID:</label>
        <input type="text" id="id" name="id" required />
    </div>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="product.name" required />
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" id="description" name="product.description" required />
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="number" id="price" name="product.price" required />
    </div>
    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="product.quantity" required />
    </div>
    <div class="form-group">
        <label for="category">Category:</label>
        <input type="text" id="category" name="product.category" required />
    </div>
    <div class="form-group">
        <input type="submit" value="Update Product" />
    </div>
</form>
</body>
</html>