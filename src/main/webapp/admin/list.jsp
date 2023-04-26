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
    <title>Gears Management Application</title>
</head>
<body>
<label>
    <a href="${pageContext.request.contextPath}/admin?action=create"><input type="button" value="Add a new gear"></a>
    <a href="${pageContext.request.contextPath}/admin"><input type="button" value="Back to gears list"></a>
    <a href="${pageContext.request.contextPath}/user/homepage.jsp"><input type="button" value="Back to homepage"></a>
</label>
<div style="text-align: center;">
    <h1>Gaming Gear Shop Management</h1>
    <hr>
    <form method="get">
        <label>
            <input type="text" name="findName" placeholder="Enter a name to find">
        </label>
        <input type="hidden" name="action" value="findByCloseName">
        <input type="submit" value="Search">
    </form>
    <form method="get">
        <label>
            <input type="text" name="findManufacturer" placeholder="Enter a manufacturer to find">
        </label>
        <input type="hidden" name="action" value="findGearByManufacturer">
        <input type="submit" value="Search">
    </form>
    <form method="get">
        <label>
            <input type="text" name="findType" placeholder="Enter a type to find">
        </label>
        <input type="hidden" name="action" value="findGearByType">
        <input type="submit" value="Search">
    </form>
</div>
<div align="right">
    <a href="${pageContext.request.contextPath}/admin?action=sortByNameASC"><input type="button" value="Sort Gears List By Name Ascending"></a>
    <a href="${pageContext.request.contextPath}/admin?action=sortByNameDESC"><input type="button" value="Sort Gears List By Name Descending"></a>
</div>
<div align="center" style="font-family: Arial,serif">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col"><a href="/admin?action=sortByNameASC">Name</a></th>
            <th scope="col">Manufacturer</th>
            <th scope="col">Type</th>
            <th scope="col">Price</th>
            <th scope="col">Description</th>
            <th scope="col">Image</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="gear" items="${listGear}">
            <tr>
                <td><strong><c:out value="${gear.id}"/></strong></td>
                <td><c:out value="${gear.name}"/></td>
                <td><c:out value="${gear.manufacturer}"/></td>
                <td><c:out value="${gear.type}"/></td>
                <td><c:out value="${gear.price}"/></td>
                <td><c:out value="${gear.description}"/></td>
                <td><c:out value="${gear.image}"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin?action=edit&id=${gear.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/admin?action=delete&id=${gear.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<c:if test="${requestScope['messageDelete'] != null}">
    <script>
        alert("Successfully deleted!");
    </script>
</c:if>
</body>
</html>