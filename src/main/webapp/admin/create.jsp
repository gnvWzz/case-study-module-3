<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 05/01/2023
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Inserting A New Gear</title>
</head>
<body>
<label>
    <a href="${pageContext.request.contextPath}/admin"><input type="button" value="Back to gears list"></a>
</label>
<form method="post">
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
    </div>
    <div class="form-group">
        <label for="manufacturer">Manufacturer</label>
        <input type="text" class="form-control" id="manufacturer" name="manufacturer" placeholder="Enter manufacturer">
    </div>
    <div class="form-group">
        <label for="type">Type</label>
        <input type="text" class="form-control" id="type" name="type" placeholder="Enter type">
    </div>
    <div class="form-group">
        <label for="price">Price</label>
        <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
    </div>
    <div class="form-group">
        <label for="description">Description</label>
        <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
    </div>
    <div class="form-group">
        <label for="image">Image Link</label>
        <input type="text" class="form-control" id="image" name="image" placeholder="Enter image link">
    </div>
    <button type="submit" class="btn btn-primary">Add</button>
</form>
<c:if test="${requestScope['message'] != null}">
    <script>
        alert("Successfully created!");
    </script>
</c:if>
</body>
</html>
